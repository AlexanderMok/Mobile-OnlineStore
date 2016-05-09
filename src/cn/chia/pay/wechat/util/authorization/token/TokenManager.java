package cn.chia.pay.wechat.util.authorization.token;


import cn.chia.pay.wechat.util.authorization.token.protool.get_access_token.GetAccessTokenRequest;
import cn.chia.pay.wechat.util.authorization.token.protool.get_access_token.GetAccessTokenResponse;
import cn.chia.pay.wechat.util.authorization.token.protool.get_jsapi_ticket.GetJsApiTicketResponse;
import cn.chia.pay.wechat.util.common.Charsets;
import cn.chia.pay.wechat.util.common.Configure;
import cn.chia.pay.wechat.util.common.HttpHandler;
import cn.chia.pay.wechat.util.common.RequestCheck;

import com.alibaba.fastjson.JSONObject;

/**
 * @author 莫庆来, 2016年4月17日 下午4:29:32
 * @decription 获取全局access_token,jsApi_ticket
 */
public class TokenManager {
	
	private static String HTTPS_ACCESS_TOKEN_API = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
	private static String HTTPS_JSAPI_TICKET_API = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?";

	private static String generateAccessTokenURL() {
		StringBuffer sb = new StringBuffer(HTTPS_ACCESS_TOKEN_API);
		sb.append("&appid=").append(
				Charsets.urlEncode(Configure.getInstance().getAppId()));
		sb.append("&secret=").append(
				Charsets.urlEncode(Configure.getInstance().getAppSecret()));
		// example:
		// https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
		return sb.toString();

	}

	private static String generateTikcetURL(String access_token) {
		StringBuffer sb = new StringBuffer(HTTPS_JSAPI_TICKET_API);
		sb.append("access_token=").append(access_token);
		sb.append("&type=jsapi");
		// example
		// https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi
		return sb.toString();
	}
	
	
	/**
	 * @author 莫庆来  
	 * @param GetOauthAccessTokenRequest
	 * @return AccessToken实体类，可以toString()获取相应json
	 */
	protected static GetAccessTokenResponse getAccessToken(GetAccessTokenRequest request) {
		String response = HttpHandler.httpsGetRequest(generateAccessTokenURL());
		RequestCheck.isSuccess(response, GetAccessTokenResponse.class, "getAccessToken()");
		return JSONObject.parseObject(response, GetAccessTokenResponse.class);
	}
	/**
	 * 
	 * @param GetJsApiTikcetRequest
	 * @param access_token
	 * @return JsApiTicket实体类,可以toString()获取相应json 
	 */
	protected static GetJsApiTicketResponse getTicket(String access_token) {
		String response = HttpHandler.httpsGetRequest(generateTikcetURL(access_token));
		RequestCheck.isSuccess(response, GetJsApiTicketResponse.class, "getTicket()");
		return JSONObject.parseObject(response, GetJsApiTicketResponse.class);
	}
	
	/**
	 * 
	 * @param access_token
	 * @return true if it is expired or false if it is still useful
	 */
	protected static Boolean isTokenExpired(String access_token) {
		Boolean flag = true;
		String response = HttpHandler.httpsGetRequest(generateTikcetURL(access_token));
		
		if(RequestCheck.isSuccess(response, GetAccessTokenResponse.class, "getAccessToken()")){
			flag = false;
		}
		return flag;
	}
}
