package cn.chia.pay.wechat.util.authorization.token.protool.get_access_token;

import cn.chia.pay.wechat.util.common.Configure;


public class GetAccessTokenRequest {

	private String appid = Configure.getInstance().getAppId();
	private String appsecret = Configure.getInstance().getAppSecret();

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getAppsecret() {
		return appsecret;
	}

	public void setAppsecret(String appsecret) {
		this.appsecret = appsecret;
	}

}
