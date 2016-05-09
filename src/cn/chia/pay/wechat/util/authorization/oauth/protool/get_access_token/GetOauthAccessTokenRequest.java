package cn.chia.pay.wechat.util.authorization.oauth.protool.get_access_token;

import cn.chia.pay.wechat.util.common.Configure;


/**
 * 请求：通过code换取网页授权access_token
 * 
 */
public class GetOauthAccessTokenRequest {

    public GetOauthAccessTokenRequest(String code) {
        this.code = code;
    }

    private String appid = Configure.getInstance().getAppId();
    private String secret = Configure.getInstance().getAppSecret();
    private String code;
    private String grant_type = "authorization_code";

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getGrant_type() {
        return grant_type;
    }

    public void setGrant_type(String grant_type) {
        this.grant_type = grant_type;
    }
}
