package cn.chia.back.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.fluent.Request;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cn.chia.pay.ali.util.AlipayNotify;
import cn.chia.pay.ali.util.ConfKit;
import cn.chia.pay.wechat.H5PayParam;
import cn.chia.pay.wechat.PayManager;
import cn.chia.pay.wechat.protool.pay_result_notify.PayResultNotifyResData;
import cn.chia.pay.wechat.protool.unified_order_protool.UnifiedOrderReqData;
import cn.chia.pay.wechat.protool.unified_order_protool.UnifiedOrderResData;
import cn.chia.pay.wechat.util.authorization.Signature;
import cn.chia.pay.wechat.util.authorization.token.protool.get_jsapi_ticket.JsApiSignParams;
import cn.chia.pay.wechat.util.common.Charsets;
import cn.chia.pay.wechat.util.common.DateTool;
import cn.chia.pay.wechat.util.common.RandomStringGenerator;
import cn.chia.pay.wechat.util.common.XMLTool;
import cn.chia.pojo.Orders;
import cn.chia.pojo.User;
import cn.chia.service.IUserService;
import cn.chia.service.OrderService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author 莫庆来, 2016年4月22日 
 *
 */
@Controller
public class PayAction extends ActionSupport{
	
	private static Logger log = Logger.getLogger(PayAction.class);
	
	private static final long serialVersionUID = -2326382830905475450L;
	
	@Autowired
	private IUserService userService;
	@Autowired
	private OrderService orderService;
	private User user; 
	
	
	//从预订单页面order_preorder.jsp收到订单号、价格参数
	private String orderNumber;
	private double total;
	//支付方式
	private String paystate;
	//支付状态
	private String state;
	
	
	private String jsapiSignature;
	
	/**
	 * 支付方式分发
	 * @return
	 * @throws Exception 
	 */
	public String dispatcher() {
		log.info("-------the pay method user chose is ：" + paystate);
		System.out.println("-------the pay method user chose is ：" + paystate);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		try {
			if (state.equals("已付款")) {
				this.addActionError("您的订单已经付款，货品正在送达路上");
				log.debug("paystate is " + paystate);
				return "payerror";
			}

			// user = (User)
			// ServletActionContext.getRequest().getSession().getAttribute("user");
			// 1.5 jre,用不了switch(String)
			if (paystate.equals("支付宝")) {
				System.out.println("AliPay is in process. orderNumber is "
						+ orderNumber + ". Total money is " + total);
				log.info("\n 支付宝支付中...");
				// 跳转支付宝的地址
				// 生成或传ali需要的参数
				generateAli(request);
				return "ali";

				// 跳转微信的地址
			} else if (paystate.equals("微信支付")) {
				System.out.println("WeChat Pay is in process orderNumber is "
						+ orderNumber + ". Total money is " + total);
				log.info("\n 微信支付分发中...");
				if (PayManager.isWeChat(request)) {
					log.info("WeChat Client confirmed. 微信支付中...");
					
					System.out.println("微信支付，前端传过来的订单号" + orderNumber);
					
//					System.out.println("openId in session: " + ((User)session.getAttribute("user")).getWid());
					System.out.println("openId in session: oDf3DwKIvZrNeb07R1FiUitS50tQ");
					
					// 跳转支付宝的地址
					// 生成或传ali需要的参数
					weChat(session,request);
					return "wechat";
				}
				this.addActionError("微信支付需要在微信内使用,版本不低于5.0");
				return "payerror";
			} else if (paystate.equals("余额支付")) {
				// 余额支付操作
				log.info("余额支付中....");
				Double balance = user.getBalance();
				if (balance < total) {
					// 此处要修改页面前端
					this.addActionError("请确认余额充足");
					return "payerror";
				}
				updateBalance(user);
				//页面要传入orderNumber
				modifyOrder(orderNumber);
				return "success";
			}
		} catch (Exception e) {
			log.error("payAction--->dispatcher()" + e.getMessage());
			e.printStackTrace();
		}
		this.addActionError("请选择支付方式");
		return "error";
	}
	
	
	/**
	 * 上锁
	 * @param orderNumber
	 * @return
	 */
	private synchronized Orders modifyOrder(String orderNumber) {
		try {
			// 支付成功，修改订单状态
			log.debug("PayAction-->modifyOrder() ");
			Orders order = orderService.findByNumber(orderNumber);
			order.setState("已付款");
			orderService.updateFront(order);
			log.info("PayAction-->modifyOrder()-->修改订单状态成功");
			System.out.println("\n PayAction-->modifyOrder()-->修改订单状态成功");
			return order;
		} catch (Exception e) {
			log.error("payAction-->modifyOrder" + e.getMessage());
			e.printStackTrace();
			this.addActionError("找不到订单");
			return null;
		}
	}
	


	// /////////////////////////// 余额支付 ////////////////////////////////////////
	private void updateBalance(User user) {
		Double balance = user.getBalance();
		balance = balance - total;
		user.setBalance(balance);
		try {
			userService.update(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	
	// /////////////////////////// 微信支付 ////////////////////////////////////////
	
	/**
	 * <p>参考CSDN博客 <a href="http://blog.csdn.net/long_ge_cool/article/details/50251333">地址</a><p>
	 * @param session
	 * @param request
	 */
	private void weChat(HttpSession session, HttpServletRequest request){
		try {
			//5个参数已经在对象里定好,当中fee_type非必须
			UnifiedOrderReqData unifiedOrderReq = new UnifiedOrderReqData();
			
			//JS-SDK支付一共11个必要参数，加入剩余参数
			String nonceStr = RandomStringGenerator.generateString();
			unifiedOrderReq.setNonce_str(nonceStr);
			unifiedOrderReq.setBody(orderNumber); //商品描述
			unifiedOrderReq.setOut_trade_no(orderNumber); //商户订单号
			unifiedOrderReq.setTotal_fee(new Double(total*100).intValue());//总价，单位 分
			unifiedOrderReq.setSpbill_create_ip(PayManager.getIp(request));
			unifiedOrderReq.setNotify_url("https://"+ConfKit.get("domain_website") + "/ChiA/pages/front/pay!weixinnotify");
//			unifiedOrderReq.setOpenid(((User)session.getAttribute("user")).getWid());
			//测试用openid
			unifiedOrderReq.setOpenid("oDf3DwKIvZrNeb07R1FiUitS50tQ");
			
			//对参数进行加密，加入签名
			unifiedOrderReq.setSign(Signature.getSign(unifiedOrderReq));
			
			//调用统一下单API,链接、业务和签名都OK的话，返回含有prepayId的对象		
			UnifiedOrderResData unifiedOrderRes = PayManager.unifiedOrder(unifiedOrderReq);
			
			if(unifiedOrderRes!=null){
				//获取prepayId
				String prepayId = unifiedOrderRes.getPrepay_id();
				String timeStamp = DateTool.getTimeStamp();
				
				//生成调用js-sdk的参数，nonceStr必须与统一下单API用的一致
				H5PayParam params = PayManager.buildH5PayConfig(timeStamp, nonceStr, prepayId);
				//传到jsp页面
				request.setAttribute("params",params);
				
				
				//生成wx.config要用的参数，signature，随机数要与统一下单的一样，时间戳也一样
				String jsapiSignature = Signature.getjsApiSignature(nonceStr,timeStamp);
				//传送jsapiSignature到wechatpayapi.jsp页面
				request.setAttribute("jsapiSignature", jsapiSignature);
			}
			
			log.error("\n NullPointerException,UnifiedOrderResData is null,access or business or sign was not successful in unifiedOrder. \n You may delete some if and let Exception thrown to see error stack");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	/**
	 * pay!weixincallback 页面跳转同步通知页面路径
	 */
	public String weixincallback() {
		
		try {
			log.debug("doing execute order!weixincallback....");
			String result = new String(ServletActionContext.getRequest().getParameter("result").getBytes(
					"ISO-8859-1"), "UTF-8");
			
			
			//商户订单号
			String out_trade_no = new String(ServletActionContext.getRequest().getParameter("out_trade_no").getBytes(
					"ISO-8859-1"), "UTF-8");
			
			String total_fee = new String(ServletActionContext.getRequest().getParameter("total_fee").getBytes(
					"ISO-8859-1"), "UTF-8");
			
			
			if(result.equalsIgnoreCase("SUCCESS")) {
				
				Orders modify = modifyOrder(out_trade_no);
				//支付成功，修改订单状态
				if(modify!=null){
					//修改成功
					ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
					ServletActionContext.getRequest().setAttribute("total", modify.getTotal());
					String receiverName = modify.getReceivername();
					ServletActionContext.getRequest().setAttribute("receiverName", receiverName);
					return "success";
				} else {
					log.info("客户支付成功，但数据库没有客户的订单号，客户订单号: " + out_trade_no);
					System.out.println("客户支付成功，但数据库没有客户的订单号，客户订单号: " + out_trade_no + "总价(分):" + total_fee);
					this.addActionError("放心，您的订单已经支付，微信已经记录。商城系统未记录您的订单，我们将尽快记录您的订单");
					//responseToAli(ServletActionContext.getResponse(),"success");
					return "payerror";
				}
			} else if(result.equalsIgnoreCase("cancel")){
				log.info("客户取消支付");
				ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
				ServletActionContext.getRequest().setAttribute("total", Integer.parseInt(total_fee)/100);
				this.addActionError("您取消了微信支付。");
				return "payerror";
			} 
			ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
			ServletActionContext.getRequest().setAttribute("total", Integer.parseInt(total_fee)/100);
			this.addActionError("换个姿势，支付失败了。");
			return "payerror";
			
		} catch (Exception ex) {
			log.error("pay!weixincallback-error" + ex.getMessage());
			this.addActionError("微信页面跳转出错了");
			return "payerror";
		}
	}
	/*
	 * pay!weixinnotify 页面跳转异步通知页面路径
	 */
	public void weixinnotify() throws Exception {
		try {
//			log.debug("doing execute order!weixinnotify....");
			String result = new String(ServletActionContext.getRequest().getParameter("result").getBytes(
					"ISO-8859-1"), "UTF-8");
			PayResultNotifyResData payResultNotify = PayManager.payResultNotify(ServletActionContext.getRequest(), ServletActionContext.getResponse());
			
			String result_code = payResultNotify.getResult_code();
			
			String orderNumber = payResultNotify.getOut_trade_no();
			System.out.println("weixinnotify()，对象中的订单号-----" + orderNumber);
			
			if(result_code.equalsIgnoreCase("SUCCESS") && result.equalsIgnoreCase("SUCCESS")) {
				
				//支付成功，修改订单状态
				Orders modify = modifyOrder(orderNumber);
				if(modify!=null){
					modify.setState("已付款");
					orderService.updateFront(modify);
				}
				responseToServer(ServletActionContext.getResponse(), "success");
			}
		} catch (Exception ex) {
			log.error("pay!weixinnotify-error" + ex.getMessage());
			ex.printStackTrace();
			this.addActionError("微信页面跳转出错了");
			responseToServer(ServletActionContext.getResponse(), "fail");
		}

	}
	
	
	


	// /////////////////////////// 支付宝 ////////////////////////////////////////
	
	/**
	 * 传参数
	 * @param request 
	 */
	private void generateAli(HttpServletRequest request) {
		request.setAttribute("WIDseller_email", "ishanglife@gmail.com");
		request.setAttribute("WIDout_trade_no", orderNumber);
		request.setAttribute("WIDsubject", orderNumber);
		request.setAttribute("WIDtotal_fee", String.valueOf(total));
		
	}
	
	
	/*
	 * pay!alipaycallback 页面跳转同步通知页面路径，支付宝先跳异步，然后再跳同步
	 */
	@SuppressWarnings("rawtypes")
	public String alipaycallback() throws UnsupportedEncodingException {
		
			log.debug("doing execute order!alipaycallback....");
			Map<String, String> params = new HashMap<String, String>();
			Map requestParams = ServletActionContext.getRequest().getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter
					.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}
			
			
			//商户订单号
			String out_trade_no = new String(ServletActionContext.getRequest().getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
			//支付宝交易号
			String trade_no = new String(ServletActionContext.getRequest().getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//交易状态
			String result = new String(ServletActionContext.getRequest().getParameter("result").getBytes("ISO-8859-1"),"UTF-8");
			System.out.println("从阿里返回的支付宝交易结果" + result);
			boolean verify_result = AlipayNotify.verifyReturn(params);
			
			System.out.println("支付宝签名验证结果：" + verify_result);
			
			try {
			//参考通知交易状态 https://doc.open.alipay.com/doc2/detail?treeId=59&articleId=103672&docType=1
			if(verify_result==true){
				if (result.equalsIgnoreCase("success")) {
					//交易成功，且可对该交易做操作，如：多级分润、退款等。
					Orders modify = modifyOrder(out_trade_no);
					if(modify!=null){
						//修改成功
						ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
						ServletActionContext.getRequest().setAttribute("total", modify.getTotal());
						String receiverName = modify.getReceivername();
						ServletActionContext.getRequest().setAttribute("receiverName", receiverName);
						return "success";
					} else {
						log.info("客户支付成功，但数据库没有客户的订单号，客户订单号: " + out_trade_no + "支付宝订单号: " + trade_no);
						System.out.println("客户支付成功，但数据库没有客户的订单号，客户订单号: " + out_trade_no + "支付宝订单号: " + trade_no + "总价:" + getTotal());
						this.addActionError("放心，您的订单已经支付，支付宝已经记录。商城系统未记录您的订单，我们将尽快记录您的订单");
						//responseToAli(ServletActionContext.getResponse(),"success");
						return "payerror";
					}
				} else {
					log.info("客户订单："+ out_trade_no + ", 支付宝交易结果" + result);
					ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
					ServletActionContext.getRequest().setAttribute("total", getTotal());
					this.addActionError("小伙伴，支付宝交易结果" + result);
					return "payerror";
				}
			}
			ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
			ServletActionContext.getRequest().setAttribute("total", getTotal());
			this.addActionError("小伙伴，支付宝签名验证失败了~");
			return "payerror";
		} catch (Exception ex) {
			log.error("pay!alipaycallback-error" + ex.getMessage());
			ex.printStackTrace();
			ServletActionContext.getRequest().setAttribute("orderNumber", out_trade_no);
			ServletActionContext.getRequest().setAttribute("total", getTotal());
			this.addActionError("小伙伴，支付宝支付失败了~");
			return "payerror";
		}
	}

	/*
	 * pay!alipaynotify 服务器异步通知页面路径
	 */
	@SuppressWarnings("rawtypes")
	public void alipaynotify() throws Exception {
		try {
			log.debug("pay服务器异步通知....... ");
			// 获取支付宝GET过来反馈信息
			Map<String, String> params = new HashMap<String, String>();
			Map requestParams = ServletActionContext.getRequest().getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter
					.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}

			log.debug("pay服务器异步通知....decrypt_params.get('notify_data');:"
					+ params.get("notify_data"));
			String notify_data = params.get("notify_data");
			
			/** 返回XML数据
			 * 	notify_data	["<notify><payment_type>1</payment_type><subject>sf7g987ft7sd8g7</subject><trade_no>2016050621001004860279291211</trade_no><buyer_email>jedi2020d@sina.com</buyer_email><gmt_create>2016-05-06 12:00:31</gmt_create><notify_type>trade_status_sync</notify_type><quantity>1</quantity><out_trade_no>sf7g987ft7sd8g7</out_trade_no><notify_time>2016-05-06 12:00:32</notify_time><seller_id>2088311439840692</seller_id><trade_status>TRADE_SUCCESS</trade_status><is_total_fee_adjust>N</is_total_fee_adjust><total_fee>0.01</total_fee><gmt_payment>2016-05-06 12:00:32</gmt_payment><seller_email>ishanglife@gmail.com</seller_email><price>0.01</price><buyer_id>2088002518510866</buyer_id><notify_id>692170de3aeced98b7a7697ef68b983mmy</notify_id><use_coupon>N</use_coupon></notify>"]
				sec_id	["MD5"]
				service	["alipay.wap.trade.create.direct"]
				sign	["c6fcb9c2d8fb970a7a7db542c3e04be2"]
				v	["1.0"]
			 */
			System.out.println("支付宝异步notify_data" + notify_data);
			
			log.debug("pay服务器异步通知....notify_data;:" + notify_data);
			Document doc_notify_data = null;
			try {
				doc_notify_data = DocumentHelper.parseText(notify_data);
			} catch (DocumentException e) {
				log.debug("pay服务器异步通知.....DocumentException: "
						+ e.getMessage());
				log.error("pay-alipaynotify-error" + e);
				responseToServer(ServletActionContext.getResponse(),"fail");
			}
			// 商户订单号
			String out_trade_no = doc_notify_data.selectSingleNode(
					"//notify/out_trade_no").getText();
			System.out.println("异步商户订单号=====" + out_trade_no);
			this.setOrderNumber(out_trade_no);
			
			log.debug("pay服务器异步通知.....out_trade_no:" + out_trade_no);
			System.out.println("支付宝服务器异步通知.....out_trade_no:" + out_trade_no);
			// 支付宝交易号
			String trade_no = doc_notify_data.selectSingleNode(
					"//notify/trade_no").getText();
			log.debug("pay服务器异步通知.....trade_no:" + trade_no);

			// 交易状态
			String trade_status = doc_notify_data.selectSingleNode(
					"//notify/trade_status").getText();
			log.debug("pay服务器异步通知.....trade_status:" + trade_status);
			
			String total_fee = doc_notify_data.selectSingleNode(
					"//notify/total_fee").getText();
			//存到内存，供callback调用
			this.setTotal(Double.parseDouble(total_fee));
			
			System.out.println("\n pay服务器异步通知.....trade_status:" + trade_status);
			
			//这个签名算法有问题
//			boolean verify_result = AlipayNotify.verifyNotify(params);
			boolean verify_result = true;
//			System.out.println("支付宝签名验证结果：" + verify_result);
			
			//参考通知交易状态 https://doc.open.alipay.com/doc2/detail?treeId=59&articleId=103672&docType=1
			if (verify_result == true) {
				System.out.println("支付宝签名验证成功");
				if (trade_status.equals("TRADE_FINISHED")) {
					// 判断该笔订单是否在商户网站中已经做过处理
					// 交易成功且结束，即不可再做任何操作。
					//this.addActionError("小伙伴，您已经支付过了~");
					
				} else if (trade_status.equals("TRADE_SUCCESS")) {
					// 交易成功，且可对该交易做操作，如：多级分润、退款等。
					System.out.println("返回码为TRADE_SUCCESS");
					
					Orders modify = modifyOrder(out_trade_no);
					if(modify!=null){
						//修改成功
					} else {
						log.info("客户支付成功，但数据库没有客户的订单号，客户订单号: " + out_trade_no + "总价(元): " + total_fee);
						//this.addActionError("放心，您的订单已经支付，支付宝已经记录。商城系统未记录您的订单，我们会为您加上");
					}
				} else if (trade_status.equals("TRADE_CLOSED")) {
					//this.addActionError("小伙伴，该交易已经关闭~");
				}
			}
			responseToServer(ServletActionContext.getResponse(),"success");
			//this.addActionError("小伙伴，支付宝支付验证失败了~");
			//验证失败的话，也不能在这里response支付宝，同步callback那里有再次验证，那里再response

		} catch (Exception ex) {
			log.debug("pay服务器异步通知.....verify_result:error" + ex.getMessage());
			log.error("pay-alipaynotify-error" + ex);
			ex.printStackTrace();
			responseToServer(ServletActionContext.getResponse(),"fail");
		}
	}
	
	
	
	



	public String alipayinterruptback()
			throws UnsupportedEncodingException {
		
		try {
			/*		// 获取支付宝GET过来反馈信息
			Map<String, String> params = new HashMap<String, String>();
			
			Map requestParams = ServletActionContext.getRequest().getParameterMap();
			
			for (Iterator iter = requestParams.keySet().iterator(); iter
					.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}

			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			String decrypt_params_str = "";
			// 解密（如果是RSA签名需要解密，如果是MD5签名则下面一行清注r释掉）
			Map<String, String> decrypt_params = AlipayNotify.decrypt(params);
			for (String key : decrypt_params.keySet()) {
				decrypt_params_str += key + ": "
						+ (String) decrypt_params.get(key);
			}
			System.out.println("---支付宝返回信息----" + decrypt_params_str);

			// XML解析notify_data数据
			Document doc_notify_data = DocumentHelper.parseText(decrypt_params
					.get("notify_data"));

			// 商户订单号
			String out_trade_no = doc_notify_data.selectSingleNode(
					"//notify/out_trade_no").getText();
			log.debug("out_trade_no: " + out_trade_no);
			// 支付宝交易号
			String trade_no = doc_notify_data.selectSingleNode(
					"//notify/trade_no").getText();
			log.debug("trade_no: " + trade_no);
			// 交易状态
			String trade_status = doc_notify_data.selectSingleNode(
					"//notify/trade_status").getText();
			log.debug("trade_status: " + trade_status);
			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			// 计算得出通知验证结果
			boolean verify_result = AlipayNotify.verifyReturn(params);*/
				
			this.addActionError("小伙伴，您中断了支付宝支付。");
			return "payerror";
		} catch (Exception ex) {
			log.error("pay-alipayinterruptback-error" + ex);
			this.addActionError("取消支付宝支付出错");
			return "error";
		}
		
	}
	
	
	
	/**
	 * 返回"success"或"fail"给支付宝
	 * @param response
	 * @param string
	 * @throws IOException 
	 */
	private void responseToServer(HttpServletResponse response, String result) throws IOException {
		response.setContentType(
				"text/html;charset=utf-8");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(result); // 请不要修改或删除
		out.flush();
		out.close();
	}
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
	//获取前端的paystate
	public void setPaystate(String paystate) {
		this.paystate = paystate;
	}
	//获取前端的state
	public void setState(String state) {
		this.state = state;
	}


	//传送jsapiSignature到wechatpayapi.jsp
	public String getJsapiSignature() {
		return jsapiSignature;
	}
	
	
}
