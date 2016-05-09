package cn.chia.pay.wechat.util.authorization.oauth.protool.refresh_access_token;

import cn.chia.pay.wechat.util.common.Configure;

/**
 * 响应：刷新access_token（如果需要）
 * 
 */
public class RefreshAccessTokenRequest {

    public RefreshAccessTokenRequest(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    private String appid = Configure.getInstance().getAppId();
    private String grant_type = "refresh_token";
    private String refresh_token;

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getGrant_type() {
        return grant_type;
    }

    public void setGrant_type(String grant_type) {
        this.grant_type = grant_type;
    }

    public String getRefresh_token() {
        return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"grant_type\"").append(":\"").append(grant_type).append("\",");
		sb.append("\"refresh_token\"").append(":\"").append(refresh_token);
		sb.append("}");
        return sb.toString();
    }
}
