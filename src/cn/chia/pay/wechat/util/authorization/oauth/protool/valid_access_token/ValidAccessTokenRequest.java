package cn.chia.pay.wechat.util.authorization.oauth.protool.valid_access_token;

/**
 * 响应：检验授权凭证（access_token）是否有效
 * 
 */
public class ValidAccessTokenRequest {

    public ValidAccessTokenRequest(String access_token, String openid) {
        this.access_token = access_token;
        this.openid = openid;
    }

    private String access_token;
    private String openid;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"access_token\"").append(":\"").append(access_token).append("\",");
		sb.append("\"openid\"").append(":\"").append(openid);
		sb.append("}");
        return sb.toString();
    }
}
