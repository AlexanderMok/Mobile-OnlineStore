package cn.chia.pay.wechat.util.common;

import org.apache.log4j.Logger;
import com.alibaba.fastjson.JSONObject;

/**
 * @author 莫庆来, 2016年4月16日 下午10:29:42 校验微信返回的结果
 */
public class RequestCheck {

	private static Logger log = Logger.getLogger(RequestCheck.class);

	public static boolean isSuccess(String resultStr, Class<?> claz, String methodName) {
		JSONObject jsonObject = JSONObject.parseObject(resultStr);
		log.info("isSuccess:" + jsonObject);
		System.out.println("isSuccess:" + jsonObject);
		Integer errCode = jsonObject.getInteger("errcode");
		StringBuffer sb = new StringBuffer();
		if (errCode != null && errCode != 0) {
			String errMsg = WeChatReturnCode.getReturnCodeFromWeChat(errCode);
			//若错误记录中没有，返回当前得到的errMsg
			if (errMsg.equals("")) {
				errMsg = jsonObject.getString("errmsg");
			}
			sb.append(claz.getName()).append("-->")
			.append(methodName).append("\n 异常码: ").append(errCode)
			.append("\n 异常说明: ").append(errMsg);
			log.error(sb.toString());
			System.out.println(sb.toString());
			return false;
		}
		sb.append(claz.getName()).append("-->")
		.append(methodName).append("恭喜，返回结果正常！不含错误！No error code. \n");
		log.info(sb.toString());
		System.out.println("恭喜，返回结果正常！不含错误！No error code. \n" + sb.toString() + resultStr);
		return true;
	}
	
	public static boolean isAccessOK(String xmlString, Class<?> claz, String methodName){

		JSONObject jsonObject = XMLTool.XmlToJson(xmlString);
		log.info("\n isAccessOK:" + jsonObject);
		System.out.println("\n isAccessOK:" + jsonObject);
		String return_code = jsonObject.getString("return_code");
		
		
		if(!return_code.equals("FAIL")) {
			log.debug("恭喜，通信成功！恭喜，业务处理成功！返回数据：" + jsonObject);
			return true;
		}
		
		StringBuffer sb = new StringBuffer();
		String return_msg = jsonObject.getString("return_msg");
		sb.append(claz.getName()).append("-->")
		.append(methodName).append("\n 异常说明: ").append(return_msg);
		log.error(sb.toString());
		return false;
	}
	
	public static boolean isBusinessOK(String xmlString, Class<?> claz, String methodName){
		JSONObject jsonObject = XMLTool.XmlToJson(xmlString);
		log.info("isBusinesOk:" + jsonObject);
		System.out.println("isBusinesOk:" + jsonObject);
		String return_code = jsonObject.getString("return_code");
		String result_code = jsonObject.getString("result_code");
		if(!return_code.equals("FAIL")) {
			
			if(!result_code.equals("FAIL")) {
				log.info("恭喜，业务处理成功！返回数据：" + jsonObject);
				return true;
			}
			//return_code为SUCCESS时
			StringBuffer sb = new StringBuffer();
			String errCode = jsonObject.getString("err_code");
			String errCodeDes = jsonObject.getString("err_code_des");
			sb.append(claz.getName()).append("-->")
			.append(methodName).append("\n 异常码: ").append(errCode)
			.append("\n 异常说明: ").append(errCodeDes);
			log.error(sb.toString());
		}
		return false;
	}
	
	
}
