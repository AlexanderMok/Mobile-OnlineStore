package cn.chia.pay.wechat.util.authorization.oauth.protool.get_userinfo;

/**
 * 请求：拉取用户信息(需scope为 snsapi_userinfo)
 * 
 */
public class GetUserinfoRequest {

    public GetUserinfoRequest(String access_token, String openid) {
        this.access_token = access_token;
        this.openid = openid;
    }

    public GetUserinfoRequest(String access_token, String openid, String lang) {
        this.access_token = access_token;
        this.openid = openid;
        this.lang = lang;
    }

    private String access_token;
    private String openid;
    private String lang = "zh_CN";

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

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"access_token\"").append(":\"").append(access_token).append("\",");
		sb.append("\"openid\"").append(":\"").append(openid).append("\",");
		sb.append("\"lang\"").append(":\"").append(lang);
		sb.append("}");
        return sb.toString();
    }
}
