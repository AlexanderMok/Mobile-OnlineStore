package cn.chia.pay.wechat.util.authorization;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

import cn.chia.pay.ali.util.ConfKit;
import cn.chia.pay.wechat.util.authorization.token.protool.get_jsapi_ticket.JsApiSignParams;
import cn.chia.pay.wechat.util.common.Configure;
import cn.chia.pay.wechat.util.common.DateTool;
import cn.chia.pay.wechat.util.common.HttpHandler;
import cn.chia.pay.wechat.util.common.RandomStringGenerator;
import cn.chia.pay.wechat.util.common.XMLTool;
import cn.chia.pay.wechat.util.encrypt.AesException;
import cn.chia.pay.wechat.util.encrypt.MD5;

/**
 * @author 莫庆来, 2016年4月14日 下午4:24:25
 * 
 */
public class Signature {

	private static Logger logger = Logger.getLogger(Signature.class);

	/**
	 * 从API返回的XML数据里面，清除sign数据，再重新计算一次签名 来自微信scan pay demo
	 * 
	 * @param responseString
	 *            API返回的XML数据
	 * @return 清除xml里的sign数据之后的签名
	 * @throws ParserConfigurationException
	 * @throws IOException
	 * @throws SAXException
	 */
	public static String getSignFromResponse(String responseString)
			throws IOException, SAXException, ParserConfigurationException {
		Map<String, Object> map = XMLTool.getMapFromXML(responseString);
		// 清掉返回数据对象里面的Sign数据（不能把这个数据也加进去进行签名），然后用签名算法进行签名
		map.put("sign", "");
		// 将API返回的数据根据用签名算法，计算新的签名，用来跟API返回的签名进行比较
		return Signature.getSign(map);
	}

	/**
	 * 检验API返回的数据里面的签名是否合法，避免数据在传输的过程中被第三方篡改 来自微信scan pay demo
	 * 
	 * @param responseString
	 *            API返回的XML数据字符串
	 * @return API签名是否合法
	 * @throws ParserConfigurationException
	 * @throws IOException
	 * @throws SAXException
	 */
	public static boolean checkSignFromResponse(String responseString)
			throws ParserConfigurationException, IOException, SAXException {

		Map<String, Object> map = XMLTool.getMapFromXML(responseString);
		
		logger.info(map.toString());

		String signFromAPIResponse = map.get("sign").toString();
		
		if (signFromAPIResponse == "" || signFromAPIResponse == null) {
			logger.error("API返回的数据签名数据不存在，有可能被第三方篡改!!!");
			return false;
		}
		logger.info("服务器回包里面的签名是:" + signFromAPIResponse);
		// 清掉返回数据对象里面的Sign数据（不能把这个数据也加进去进行签名），然后用签名算法进行签名
		map.put("sign", "");
		// 将API返回的数据根据用签名算法进行计算新的签名，用来跟API返回的签名进行比较
		String signForAPIResponse = Signature.getSign(map);

		if (!signForAPIResponse.equals(signFromAPIResponse)) {
			// 签名验不过，表示这个API返回的数据有可能已经被篡改了
			logger.error("API返回的数据签名验证不通过，有可能被第三方篡改!!!");
			return false;
		}
		logger.info("恭喜，API返回的数据签名验证通过!!!");
		System.out.println("恭喜，API返回的数据签名验证通过!!!");
		return true;
	}

	/**
	 * 签名算法 来自微信scan pay demo 
	 * 
	 * @param o
	 *            要参与签名的数据对象
	 * @return MD5签名
	 * @throws IllegalAccessException
	 */
	public static String getSign(Object o) throws IllegalAccessException {
		ArrayList<String> list = new ArrayList<String>();
        Class cls = o.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            if (f.get(o) != null && f.get(o) != "") {
                list.add(f.getName() + "=" + f.get(o) + "&");
            }
        }
        int size = list.size();
        String [] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < size; i ++) {
            sb.append(arrayToSort[i]);
        }
		//加入私钥
        String result = sb.toString();
        result += "key=" + ConfKit.get("key");
        logger.info("Sign Before MD5:" + result);
        System.out.println("Sign Before MD5:" + result);
        result = MD5.MD5Encode(result).toUpperCase();
        logger.info("Sign Result:" + result);
        System.out.println("Sign Result:" + result);
        return result;
	}

	/**
	 * 来自微信scan pay demo
	 * 
	 * @param map
	 * @return 加密后数据
	 */
	public static String getSign(Map<String, Object> map) {
		ArrayList<String> list = new ArrayList<String>();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			if (entry.getValue() != "") {
				list.add(entry.getKey() + "=" + entry.getValue() + "&");
			}
		}
		int size = list.size();
		String[] arrayToSort = list.toArray(new String[size]);
		Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < size; i++) {
			sb.append(arrayToSort[i]);
		}
		//加入私钥
		String result = sb.toString();
        result += "key=" +  ConfKit.get("key");
		logger.info("Sign Before MD5:" + result);
		System.out.println("Sign Before MD5:" + result);
		result = MD5.MD5Encode(result).toUpperCase();
		logger.info("Sign Result:" + result);
		 System.out.println("Sign Result:" + result);
		return result;
	}

	/**
	 * 给需要调用JS SDK的URL签名
	 * 与下面的方法getjsApiSignature()功能一样
	 * @param url
	 * @return
	 * @throws AesException
	 */
	public static JsApiSignParams jsApiSign(String url,String nonceStr) throws AesException {
		StringBuffer signatureSource = new StringBuffer();
		String timestamp = Long.toString(System.currentTimeMillis() / 1000);
		// 使用缓存的ticket
		String jsapiTicket = "";
		signatureSource.append("jsapi_ticket=").append(jsapiTicket);
		signatureSource.append("&noncestr=").append(nonceStr);
		signatureSource.append("&timestamp=").append(timestamp);
		signatureSource.append("&url=").append(url);
		logger.info("sign source : " + signatureSource);
		// String signature = SHA1.getSHA1(jsapiTicket, timestamp, nonceStr,
		// url);
		String signature = DigestUtils.sha1Hex(signatureSource.toString());
		logger.info("sign : " + signature);
		return new JsApiSignParams(url, jsapiTicket, nonceStr, timestamp,
				signature);
	}

	/**
	 * get signature
	 * 
	 * @param request
	 * @param ibody
	 * @param iopenid
	 * @param itotal_fee
	 * @return
	 */
	public static String getjsApiSignature(String nonceStr, String timeStamp) {
		
		StringBuffer signatureSource = new StringBuffer();
		
		String requestUrl = "http://" + ConfKit.get("jsapi_domain_weixin")
				+ "/org.ishanglife.weixin/getJSAPI_Ticket.jsp";
		
		String getJSAPI_Ticket = HttpHandler.sendGet(requestUrl, "GET");
		
		System.out.println("get getJSAPI_Ticket:" + getJSAPI_Ticket);		
		signatureSource.append("jsapi_ticket=").append(getJSAPI_Ticket);
		signatureSource.append("&noncestr=").append(nonceStr);
		signatureSource.append("&timestamp=").append(timeStamp);
		//当前页面的URL
		signatureSource.append("&url=http://").append(ConfKit.get("domain_website"))
		.append("/ChiA/pages/front/pay!dispatcher");
		logger.info("jsapi sign source: " + signatureSource.toString());
		String signature = DigestUtils.sha256Hex(signatureSource.toString());
		
		// signature
		logger.info("构造签名: " + signature);

		return signature;
	}

}
