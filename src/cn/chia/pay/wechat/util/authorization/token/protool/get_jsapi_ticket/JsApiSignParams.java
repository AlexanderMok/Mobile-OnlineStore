package cn.chia.pay.wechat.util.authorization.token.protool.get_jsapi_ticket;

import cn.chia.pay.wechat.util.common.Configure;


/**
 * @author 莫庆来, 2016年4月19日 上午10:28:17
 * 
 */
public class JsApiSignParams {
	private String appid = Configure.getInstance().getAppId();
	private String url;
	private String jsapiTicket;
	private String nonceStr;
	private String timeStamp;
	private String signature;

	public JsApiSignParams(String url, String jsapiTicket, String nonceStr,
			String timeStamp, String signature) {
		this.url = url;
		this.jsapiTicket = jsapiTicket;
		this.nonceStr = nonceStr;
		this.timeStamp = timeStamp;
		this.signature = signature;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getJsapiTicket() {
		return jsapiTicket;
	}

	public void setJsapiTicket(String jsapiTicket) {
		this.jsapiTicket = jsapiTicket;
	}

	public String getNonceStr() {
		return nonceStr;
	}

	public void setNonceStr(String nonceStr) {
		this.nonceStr = nonceStr;
	}

	public String getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	@Override
	public String toString() {
		StringBuffer sb= new StringBuffer();
		sb.append("{");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"url\"").append(":\"").append(url).append("\",");
		sb.append("\"jsapiTicket\"").append(":\"").append(jsapiTicket).append("\",");
		sb.append("\"nonceStr\"").append(":\"").append(nonceStr).append("\",");
		sb.append("\"timeStamp\"").append(":\"").append(timeStamp).append("\",");
		sb.append("\"signature\"").append(":\"").append(signature);
		sb.append("}");
		return sb.toString();
	}
}
