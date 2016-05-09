package cn.chia.pay.wechat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.xml.sax.SAXException;

import cn.chia.pay.wechat.protool.close_order_protool.CloseOrderReqData;
import cn.chia.pay.wechat.protool.close_order_protool.CloseOrderResData;
import cn.chia.pay.wechat.protool.download_bill_protool.DownloadBillReqData;
import cn.chia.pay.wechat.protool.order_query_protool.OrderQueryReqData;
import cn.chia.pay.wechat.protool.order_query_protool.OrderQueryResData;
import cn.chia.pay.wechat.protool.pay_result_notify.PayResultNotifyResData;
import cn.chia.pay.wechat.protool.refund_protool.RefundReqData;
import cn.chia.pay.wechat.protool.refund_protool.RefundResData;
import cn.chia.pay.wechat.protool.refund_query_protool.RefundQueryReqData;
import cn.chia.pay.wechat.protool.refund_query_protool.RefundQueryResData;
import cn.chia.pay.wechat.protool.reprot_protool.ReportReqData;
import cn.chia.pay.wechat.protool.reprot_protool.ReportResData;
import cn.chia.pay.wechat.protool.unified_order_protool.UnifiedOrderReqData;
import cn.chia.pay.wechat.protool.unified_order_protool.UnifiedOrderResData;
import cn.chia.pay.wechat.util.authorization.Signature;
import cn.chia.pay.wechat.util.common.Charsets;
import cn.chia.pay.wechat.util.common.HttpHandler;
import cn.chia.pay.wechat.util.common.RequestCheck;
import cn.chia.pay.wechat.util.common.XMLTool;



/**
 * @author 莫庆来, 2016年4月14日 下午3:51:51
 * @description 支付状态管理，向微信服务器发送请求返回相应数据 <p>参考<a>https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1#</a></p>
 * 使用JS-SDK调用支付
 */
public class PayManager {
	private static Logger logger = Logger.getLogger(PayManager.class);
	
	/**
     * 统一下单
     */
    public static final String UNIFIED_ORDER_API = "https://api.mch.weixin.qq.com/pay/unifiedorder";
    /**
     * 查询订单
     */
    public static final String ORDER_QUERY_API = "https://api.mch.weixin.qq.com/pay/orderquery";
    /**
     * 关闭订单
     */
    public static final String CLOSE_ORDER_API = "https://api.mch.weixin.qq.com/pay/closeorder";
    /**
     * 申请退款
     */
    public static final String REFUND_API = "https://api.mch.weixin.qq.com/secapi/pay/refund";
    /**
     * 查询退款
     */
    public static final String REFUND_QUERY_API = "https://api.mch.weixin.qq.com/pay/refundquery";
    /**
     * 下载对账单
     */
    public static final String DOWNLOAD_BILL_API = "https://api.mch.weixin.qq.com/pay/downloadbill";
    
    /**
     * 支付结果通用通知
     * 由统一下单中提交的参数notify_url设置，如果链接无法访问，商户将无法接收到微信通知
     */
    
    /**
     * 测速上报
     */
    public static final String PAYTIL_REPORT_API = "https://api.mch.weixin.qq.com/payitil/report";
    
    
    /**
	 * 判断是否来自微信, 5.0 之后的才支持微信支付
	 * @param request
	 * @return
	 */
	public static boolean isWeChat(HttpServletRequest request) {
		String userAgent = request.getHeader("User-Agent");
		if (!userAgent.equals("") && userAgent != null) {
			Pattern p = Pattern.compile("MicroMessenger/(\\d+).+");
			Matcher m = p.matcher(userAgent);
			String version = null;
			if (m.find()) {
				version = m.group(1);
			}
			return (null != version && NumberUtils.toInt(version) >= 5);
		}
		return false;
	}
	
	
    /**
     * 统一下单
     * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1">开发文档</p>
     * @author 莫庆来
     * @param UnifiedOrderReqData
     * @return UnifiedOrderResData. can be JSON too.
     * @throws Exception
     */
    public static UnifiedOrderResData unifiedOrder(UnifiedOrderReqData request) throws Exception {
    	//传入的request要封装好添加的订单数据
    	
    	UnifiedOrderResData response = null;
    	
    	String xmlObj = XMLTool.ObjectToXml(request);
    	logger.info("prepared xml data to WeChat: \n" + xmlObj);
    	System.out.println("\n prepared xml data to WeChat: \n" + xmlObj);
    	String result = HttpHandler.sendPostRequest(UNIFIED_ORDER_API, xmlObj);
    	
    	logger.info("post result: \n" + result);
    	System.out.println("post result: \n" + result);
    	boolean asscessOk = RequestCheck.isAccessOK(result, PayManager.class, "unifiedOrder()");
    	boolean businessOk = RequestCheck.isBusinessOK(result, PayManager.class, "unifiedOrder()");
    	
    	if(asscessOk && businessOk) {
    		//此时才有sign返回
    		//检验result的支付签名，前面生成签名用到了传入的UnifiedOrderReqData对象数据,因此解析需将result的数据拿出来，与原来对照
    		Boolean flag = Signature.checkSignFromResponse(result);
    		
    		System.out.println("PayManager.unifiedOrder() 统一下单API支付签名验证结果：" + flag);
    		
    		if (flag==false) {
    			logger.error("签名不通过，返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    			System.out.println("签名不通过，返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    			return response;
    		}
    		logger.info("签名通过，返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    		response = (UnifiedOrderResData) XMLTool.getObjectFromXML(result, UnifiedOrderResData.class);
    		return response;
    	}
    	return response; 
    }
    
    /**
     * 查询订单
     * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_2">开发文档</p>
     * @author 莫庆来
     * @param OrderQueryReqData
     * @return OrderQueryResData can be json too.
     * @throws IllegalAccessException 
     * @throws SAXException 
     * @throws IOException 
     * @throws ParserConfigurationException 
     */
    public static OrderQueryResData orderQuery(OrderQueryReqData request) throws IllegalAccessException, ParserConfigurationException, IOException, SAXException{
    	request.setSign(Signature.getSign(request));
    	
    	String xmlObj = XMLTool.ObjectToXml(request);
    	logger.info("prepared xml data to WeChat: \n" + xmlObj);
    	String result = HttpHandler.sendPostRequest(ORDER_QUERY_API, xmlObj);
    	
    	logger.info("post result: \n" + result);
    	
    	RequestCheck.isAccessOK(result, PayManager.class, "orderQuery()");
    	RequestCheck.isBusinessOK(result, PayManager.class, "orderQuery()");
    	Boolean flag = Signature.checkSignFromResponse(result);
		
    	if (flag==false) {
    		logger.error("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    		System.out.println(XMLTool.XmlToJson(result));
    		return null;
		}
    	
    	logger.info("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    	OrderQueryResData response = (OrderQueryResData) XMLTool.getObjectFromXML(result,OrderQueryResData.class);
    	//要增加代金券功能，请清除注释
//    	try {
//			parseCouponsForOrderQuery(result, response);
//		} catch (ParserConfigurationException | IOException | SAXException e) {
//			logger.error("解析代金券或立减优惠失败", e);
//			throw e;
//		}
    	
    	return response;
    }
    
    /**
     * 关闭订单
     * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_2">开发文档</p>
     * @author 莫庆来
     * @param CloseOrderReqData
     * @return CloseOrderResData can be json too.
     * @throws Exception
     */
    public static CloseOrderResData closeOrder(CloseOrderReqData request) throws Exception{
    	request.setSign(Signature.getSign(request));
    	
    	String xmlObj = XMLTool.ObjectToXml(request);
    	logger.info("prepared xml data to WeChat: \n" + xmlObj);
    	String result = HttpHandler.sendPostRequest(CLOSE_ORDER_API, xmlObj);
    	
    	logger.info("post result: \n" + result);
    	
    	RequestCheck.isAccessOK(result, PayManager.class, "orderQuery()");
    	RequestCheck.isBusinessOK(result, PayManager.class, "orderQuery()");
    	Boolean flag = Signature.checkSignFromResponse(result);
		
    	if (flag==false) {
    		logger.error("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    		System.out.println(XMLTool.XmlToJson(result));
    		return null;
		}
    	logger.info("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    	CloseOrderResData response = (CloseOrderResData) XMLTool.getObjectFromXML(result,CloseOrderResData.class);
    	return response;
    }
    
    
    /**
     * 申请退款
     * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_4">开发文档</p>
     * @author 莫庆来
     * @param RefundReqData
     * @return RefundResData can be json too.
     * @throws Exception
     */
    public static RefundResData refund(RefundReqData request) throws Exception{
    	request.setSign(Signature.getSign(request));
    	
    	String xmlObj = XMLTool.ObjectToXml(request);
    	logger.info("prepared xml data to WeChat: \n" + xmlObj);
    	String result = HttpHandler.sendPostRequest(REFUND_API, xmlObj);
    	
    	logger.info("post result: \n" + result);
    	
    	RequestCheck.isAccessOK(result, PayManager.class, "orderQuery()");
    	RequestCheck.isBusinessOK(result, PayManager.class, "orderQuery()");
    	Boolean flag = Signature.checkSignFromResponse(result);
		
    	if (flag==false) {
    		logger.error("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    		System.out.println(XMLTool.XmlToJson(result));
    		return null;
		}
    	logger.info("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    	RefundResData response = (RefundResData) XMLTool.getObjectFromXML(result,RefundResData.class);
    	return response;
    }
    
    /**
      * 查询退款
     * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_4">开发文档</p>
     * @author 莫庆来
     * @param RefundReqData
     * @return RefundResData can be json too.
     * @throws IllegalAccessException 
     * @throws SAXException 
     * @throws IOException 
     * @throws ParserConfigurationException 
     */
    public static RefundQueryResData refundQuery(RefundQueryReqData request) throws IllegalAccessException, ParserConfigurationException, IOException, SAXException{
    	request.setSign(Signature.getSign(request));
    	
    	String xmlObj = XMLTool.ObjectToXml(request);
    	logger.info("prepared xml data to WeChat: \n" + xmlObj);
    	String result = HttpHandler.sendPostRequest(REFUND_QUERY_API, xmlObj);
    	
    	logger.info("post result: \n" + result);
    	
    	RequestCheck.isAccessOK(result, PayManager.class, "orderQuery()");
    	RequestCheck.isBusinessOK(result, PayManager.class, "orderQuery()");
    	Boolean flag = Signature.checkSignFromResponse(result);
		
    	if (flag==false) {
    		logger.error("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    		System.out.println(XMLTool.XmlToJson(result));
    		return null;
		}
    	logger.info("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
    	RefundQueryResData response = (RefundQueryResData) XMLTool.getObjectFromXML(result,RefundQueryResData.class);
    	//要增加代金券功能，请清除注释
//    	try {
//			parseCouponsForRefundQuery(result, response);
//		} catch (ParserConfigurationException | IOException | SAXException e) {
//			logger.error("解析代金券或立减优惠失败", e);
//			throw e;
//		}
    	return response;
    }
    
    /**
    * 下载对账单
    * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_6">开发文档</p>
    * @author 莫庆来
    * @param DownloadBillReqData
    * @return xls文件.
    */
   public static String downloadBill(DownloadBillReqData request) {
   	
		String result = null;
		try {
			request.setSign(Signature.getSign(request));

			String xmlObj = XMLTool.ObjectToXml(request);
			logger.info("prepared xml data to WeChat: \n" + xmlObj);
			result = HttpHandler.sendPostRequest(DOWNLOAD_BILL_API, xmlObj);

			logger.info("post result: \n" + result);

			RequestCheck.isAccessOK(result, PayManager.class, "orderQuery()");
			RequestCheck.isBusinessOK(result, PayManager.class, "orderQuery()");
			Signature.checkSignFromResponse(result);

		} catch (Exception e) {
			// 说明不是xml文件，是xls文件
			logger.info("这是xls文件，所以前面验证xml文件的log会报错，勿担心");
			return result;
		}
		//如果不是xls文件才会执行以下语句
		logger.info("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
		return result;
		
   }
   
   
   /**
    * 封装支付结果通知
    * <p/>
    * <b>注意：同样的通知可能会多次发送给商户系统。商户系统必须能够正确处理重复的通知。 </b>
    * <p><a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_7">开发文档</a></p>
    * <p>该链接是通过【统一下单API】中提交的参数notify_url设置，如果链接无法访问，商户将无法接收到微信通知。通知url必须为直接可访问的url，不能携带参数。示例：notify_url：“https://pay.weixin.qq.com/wxpay/pay.action”</p>
    * @author 莫庆来
    * @param ServletRequest 包含微信服务器返回的支付结果xml数据,ServletResponse 返回给微信服务器的xml数据
    * @return DownloadBillResData can be json too.
    * @throws Exception 
    */
   public static PayResultNotifyResData payResultNotify(ServletRequest request, ServletResponse response) throws Exception{
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		String result = null;
		//默认返回OK
		PayApiException exception = new PayApiException(PayApiException.CODE_SUCCESS,"OK");
		
		try {
			inputStream = request.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream,
					Charsets.UTF8);
			bufferedReader = new BufferedReader(inputStreamReader);

			String str = null;
			StringBuffer sb = new StringBuffer();
			while ((str = bufferedReader.readLine()) != null) {
				sb.append(str);
			}

			result = sb.toString();

		} catch (IOException e) {
			logger.error("支付结果通知数据解析失败", e);
			// 错误数据，包括return_code,return_msg，要同步用response对象返回给微信
			exception = new PayApiException(PayApiException.CODE_FAIL, "支付结果通知数据解析失败");
			responseToWechat(response, exception);
			throw exception;
		}
		
		// 有结果返回后，校验通信、签名
		logger.info("返回的支付结果xml回包" + result);
		System.out.println("返回的支付结果xml回包" + result);
		RequestCheck.isAccessOK(result, PayManager.class, "payResultNotify()");
		try {
			Signature.checkSignFromResponse(result);
		} catch (Exception e) {
			logger.error("签名校验失败", e);
			exception = new PayApiException(PayApiException.CODE_FAIL, "签名校验失败");
			responseToWechat(response, result);
			throw e;
		}
		PayResultNotifyResData notifyResData = (PayResultNotifyResData) XMLTool.getObjectFromXML(result, PayResultNotifyResData.class);
		
		//校验业务，若true，无错误，返回信息给微信服务器
		if(RequestCheck.isBusinessOK(result, PayManager.class, "payResultNotify()")){
			
//		try {
//			parseCouponsForPayResultNotify(result, notifyResData);
//		} catch (Exception e) {
//			logger.error("解析代金券或立减优惠失败", e);
//			exception = new PayApiException(PayApiException.CODE_FAIL, "解析代金券或立减优惠失败");
//			throw exception;
//		}
			
			//返回SUCCESS,OK给微信服务器
			responseToWechat(response, exception);
			
			logger.info("返回成功数据的JSON:\n" + XMLTool.XmlToJson(result));
			System.out.println(XMLTool.XmlToJson(result));
			
			return notifyResData;
			
		}

		logger.info("返回不成功数据的JSON:\n" + XMLTool.XmlToJson(result));
		System.out.println(XMLTool.XmlToJson(result));
		return notifyResData;
   }
   
   /**
    * 测速上报
    * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_8">开发文档</p>
    *
    * @param ReportReqData
    * @return
    * @throws IllegalAccessException
    * @throws ParserConfigurationException
    * @throws IOException
    * @throws SAXException
    */
   public static ReportResData report(ReportReqData request) throws IllegalAccessException, ParserConfigurationException, IOException, SAXException{
		request.setSign(Signature.getSign(request));

		String xmlObj = XMLTool.ObjectToXml(request);
		logger.info("prepared xml data to WeChat: \n" + xmlObj);
		String result = HttpHandler.sendPostRequest(PAYTIL_REPORT_API, xmlObj);

		logger.info("post result: \n" + result);

		RequestCheck.isAccessOK(result, PayManager.class, "orderQuery()");
		RequestCheck.isBusinessOK(result, PayManager.class, "orderQuery()");

		logger.info("返回数据的JSON:\n" + XMLTool.XmlToJson(result));
		System.out.println(XMLTool.XmlToJson(result));
		
		ReportResData response = (ReportResData) XMLTool.getObjectFromXML(result, ReportResData.class);
		return response;
   }
   
   
   
   
   
   
   
   /**
    * The following are methods useful for WeChatPay process
    *
    */
   
   
   
   /**
    * 商户处理支付结果通知后同步返回给微信参数
    *
    * @param servletResponse
    * @param postData
    * @throws IOException 
    */
   private static void responseToWechat(ServletResponse response, Object postData) throws IOException {
	   OutputStream ouputStream = null;
	   byte[] buf = XMLTool.ObjectToXml(postData).getBytes(Charsets.UTF8);
	   try {
    	   ouputStream = response.getOutputStream();
    	   ouputStream.write(buf);
    	   ouputStream.flush();
       } catch (IOException e) {
          
       } finally {
    	   ouputStream.close();
       }
   }
   
   /**
	 * 获取ip参数
	 *
	 * @param request
	 * @return
	 */
	public static String getIp(HttpServletRequest request) {
		if (request == null)
			return "";
		String ip = request.getHeader("X-Requested-For");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Forwarded-For");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
   
   
   /**
    * 构造H5调用支付的参数对象
    *
    * @param timeStamp
    * @param nonceStr
    * @param prepayId 调用统一下单 API后，从微信服务器返回
    * @return 调用JS-SDK支付所需要的参数对象
    * @throws IllegalAccessException 
    */
   public static H5PayParam buildH5PayConfig(String timeStamp, String nonceStr, String prepayId) throws IllegalAccessException {
       H5PayParam param = new H5PayParam();
       param.setTimeStamp(timeStamp);
       param.setNonceStr(nonceStr);
       param.setPackageWithPrepayId("prepay_id=" + prepayId);
       param.setPaySign(Signature.getSign(param));
       return param;
   }
   
   
   
   
   
   /**
    * 解析支付结果通知的代金券或立减优惠
    * 来自wechat4j
    * @param postResult
    * @param payResultNotifyResponse
    * @throws ParserConfigurationException
    * @throws IOException
    * @throws SAXException
    */
   private static void parseCouponsForPayResultNotify(String postResult, PayResultNotifyResData payResultNotifyResData) throws ParserConfigurationException, IOException, SAXException {
       List<String> coupon_id_$n = new ArrayList<String>();
       List<Integer> coupon_fee_$n = new ArrayList<Integer>();
       Map<String, Object> mapFromPayResultNotifyXML = XMLTool.getMapFromXML(postResult);
       Iterator<String> iterator = mapFromPayResultNotifyXML.keySet().iterator();
       while (iterator.hasNext()) {
           String key = iterator.next();
           // 解析代金券或立减优惠，$n为下标，从0开始编号
           if (key.matches("^coupon_id_[0-9]+$")) { // coupon_id_$n
               coupon_id_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^coupon_fee_[0-9]+$")) { // coupon_fee_$n
               coupon_fee_$n.add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           }
       }
       payResultNotifyResData.setCoupon_id_$n(coupon_id_$n.toArray(new String[coupon_id_$n.size()]));
       payResultNotifyResData.setCoupon_fee_$n(coupon_fee_$n.toArray(new Integer[coupon_fee_$n.size()]));
   }

   /**
    * 解析查询订单的代金券或立减优惠
    * 来自wechat4j
    * @param postResult
    * @param orderqueryResponse
    * @throws ParserConfigurationException
    * @throws IOException
    * @throws SAXException
    */
   private static void parseCouponsForOrderQuery(String postResult, OrderQueryResData orderQueryResData) throws ParserConfigurationException, IOException, SAXException {
       List<String> coupon_batch_id_$n = new ArrayList<String>();
       List<String> coupon_id_$n = new ArrayList<String>();
       List<Integer> coupon_fee_$n = new ArrayList<Integer>();
       Map<String, Object> mapFromPayResultNotifyXML = XMLTool.getMapFromXML(postResult);
       Iterator<String> iterator = mapFromPayResultNotifyXML.keySet().iterator();
       while (iterator.hasNext()) {
           String key = iterator.next();
           // 解析代金券或立减优惠，$n为下标，从0开始编号
           if (key.matches("^coupon_batch_id_[0-9]+$")) { // coupon_batch_id_$n
               coupon_batch_id_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^coupon_id_[0-9]+$")) { // coupon_id_$n
               coupon_id_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^coupon_fee_[0-9]+$")) { // coupon_fee_$n
               coupon_fee_$n.add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           }
       }
       orderQueryResData.setCoupon_batch_id_$n(coupon_batch_id_$n.toArray(new String[coupon_id_$n.size()]));
       orderQueryResData.setCoupon_id_$n(coupon_id_$n.toArray(new String[coupon_id_$n.size()]));
       orderQueryResData.setCoupon_fee_$n(coupon_fee_$n.toArray(new Integer[coupon_fee_$n.size()]));
   }

   /**
    * 解析查询退款的代金券或立减优惠
    * 来自wechat4j
    * @param postResult
    * @param refundqueryResponse
    * @throws ParserConfigurationException
    * @throws IOException
    * @throws SAXException
    */
   private static void parseCouponsForRefundQuery(String postResult, RefundQueryResData refundQueryResData) throws ParserConfigurationException, IOException, SAXException {
       List<String> out_refund_no_$n = new ArrayList<String>();
       List<String> refund_id_$n = new ArrayList<String>();
       List<String> refund_channel_$n = new ArrayList<String>();
       List<Integer> refund_fee_$n = new ArrayList<Integer>();
       List<Integer> coupon_refund_fee_$n = new ArrayList<Integer>();
       List<Integer> coupon_refund_count_$n = new ArrayList<Integer>();
       List<List<String>> coupon_refund_batch_id_$n_$m = new ArrayList<List<String>>();
       List<List<String>> coupon_refund_id_$n_$m = new ArrayList<List<String>>();
       List<List<Integer>> coupon_refund_fee_$n_$m = new ArrayList<List<Integer>>();
       List<String> refund_status_$n = new ArrayList<String>();
       Map<String, Object> mapFromPayResultNotifyXML = XMLTool.getMapFromXML(postResult);
       Iterator<String> iterator = mapFromPayResultNotifyXML.keySet().iterator();
       while (iterator.hasNext()) {
           String key = iterator.next();
           // 解析代金券或立减优惠，$n为下标，$n为下标，从0开始编号
           if (key.matches("^out_refund_no_[0-9]+$")) { // out_refund_no_$n
               out_refund_no_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^refund_id_[0-9]+$")) { // refund_id_$n
               refund_id_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^refund_channel_[0-9]+$")) { // refund_channel_$n
               refund_channel_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^refund_fee_[0-9]+$")) { // refund_fee_$n
               refund_fee_$n.add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           } else if (key.matches("^coupon_refund_fee_[0-9]+$")) { // coupon_refund_fee_$n
               coupon_refund_fee_$n.add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           } else if (key.matches("^coupon_refund_fee_[0-9]+$")) { // coupon_refund_fee_$n
               coupon_refund_fee_$n.add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           } else if (key.matches("^coupon_refund_count_[0-9]+$")) { // coupon_refund_count_$n
               coupon_refund_count_$n.add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           } else if (key.matches("^coupon_refund_batch_id_[0-9]+_[0-9]+$")) { // coupon_refund_batch_id_$n_$m
               String[] indexs = key.replace("coupon_refund_batch_id_", "").split("_");
               int index0 = Integer.valueOf(indexs[0]);
               if (coupon_refund_batch_id_$n_$m.size() <= index0) {
                   coupon_refund_batch_id_$n_$m.add(new ArrayList<String>());
               }
               coupon_refund_batch_id_$n_$m.get(index0).add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^coupon_refund_id_[0-9]+_[0-9]+$")) { // coupon_refund_id_$n_$m
               String[] indexs = key.replace("coupon_refund_id_", "").split("_");
               int index0 = Integer.valueOf(indexs[0]);
               if (coupon_refund_id_$n_$m.size() <= index0) {
                   coupon_refund_id_$n_$m.add(new ArrayList<String>());
               }
               coupon_refund_id_$n_$m.get(index0).add(mapFromPayResultNotifyXML.get(key).toString());
           } else if (key.matches("^coupon_refund_fee_[0-9]+_[0-9]+$")) { // coupon_refund_fee_$n_$m
               String[] indexs = key.replace("coupon_refund_fee_", "").split("_");
               int index0 = Integer.valueOf(indexs[0]);
               if (coupon_refund_fee_$n_$m.size() <= index0) {
                   coupon_refund_fee_$n_$m.add(new ArrayList<Integer>());
               }
               coupon_refund_fee_$n_$m.get(index0).add(Integer.valueOf(mapFromPayResultNotifyXML.get(key).toString()));
           } else if (key.matches("^refund_status_[0-9]+$")) { // refund_status_$n
               refund_status_$n.add(mapFromPayResultNotifyXML.get(key).toString());
           }
       }
       refundQueryResData.setOut_refund_no_$n(out_refund_no_$n.toArray(new String[out_refund_no_$n.size()]));
       refundQueryResData.setRefund_id_$n(refund_id_$n.toArray(new String[refund_id_$n.size()]));
       refundQueryResData.setRefund_channel_$n(refund_channel_$n.toArray(new String[refund_channel_$n.size()]));
       refundQueryResData.setRefund_fee_$n(refund_fee_$n.toArray(new Integer[refund_fee_$n.size()]));
       refundQueryResData.setCoupon_refund_fee_$n(coupon_refund_fee_$n.toArray(new Integer[coupon_refund_fee_$n.size()]));
       refundQueryResData.setCoupon_refund_count_$n(coupon_refund_count_$n.toArray(new Integer[coupon_refund_count_$n.size()]));
       String[][] coupon_refund_batch_id_$n_$m_array = new String[coupon_refund_batch_id_$n_$m.size()][];
       for (int i = 0; i < coupon_refund_batch_id_$n_$m.size(); i++) {
           List<String> item = coupon_refund_batch_id_$n_$m.get(i);
           coupon_refund_batch_id_$n_$m_array[i] = item.toArray(new String[item.size()]);
       }
       refundQueryResData.setCoupon_refund_batch_id_$n_$m(coupon_refund_batch_id_$n_$m_array);
       String[][] coupon_refund_id_$n_$m_array = new String[coupon_refund_id_$n_$m.size()][];
       for (int i = 0; i < coupon_refund_id_$n_$m.size(); i++) {
           List<String> item = coupon_refund_id_$n_$m.get(i);
           coupon_refund_id_$n_$m_array[i] = item.toArray(new String[item.size()]);
       }
       refundQueryResData.setCoupon_refund_id_$n_$m(coupon_refund_id_$n_$m_array);
       Integer[][] coupon_refund_fee_$n_$m_array = new Integer[coupon_refund_fee_$n_$m.size()][];
       for (int i = 0; i < coupon_refund_fee_$n_$m.size(); i++) {
           List<Integer> item = coupon_refund_fee_$n_$m.get(i);
           coupon_refund_fee_$n_$m_array[i] = item.toArray(new Integer[item.size()]);
       }
       refundQueryResData.setCoupon_refund_fee_$n_$m(coupon_refund_fee_$n_$m_array);
       refundQueryResData.setRefund_status_$n(refund_status_$n.toArray(new String[refund_status_$n.size()]));
   }

   
}
