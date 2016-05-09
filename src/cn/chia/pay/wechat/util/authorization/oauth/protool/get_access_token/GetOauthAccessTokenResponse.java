package cn.chia.pay.wechat.util.authorization.oauth.protool.get_access_token;


/**
 * 响应：通过code换取网页授权access_token
 * 
 */
public class GetOauthAccessTokenResponse {

    private String access_token;
    private Integer expires_in;
    private String refresh_token;
    private String openid;
    private String scope;
    private String unionid;

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public int getExpires_in() {
        return expires_in;
    }

    public void setExpires_in(Integer expires_in) {
        this.expires_in = expires_in;
    }

    public String getRefresh_token() {
        return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"access_token\"").append(":\"").append(access_token).append("\",");
		sb.append("\"expires_in\"").append(":\"").append(expires_in).append("\",");
		sb.append("\"refresh_token\"").append(":\"").append(refresh_token).append("\",");
		sb.append("\"openid\"").append(":\"").append(openid).append("\",");
		sb.append("\"scope\"").append(":\"").append(scope).append("\",");
		sb.append("\"unionid\"").append(":\"").append(unionid);
		sb.append("}");
        return sb.toString();
    }
}
