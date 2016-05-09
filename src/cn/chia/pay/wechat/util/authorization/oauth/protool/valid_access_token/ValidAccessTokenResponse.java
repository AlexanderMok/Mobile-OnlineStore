package cn.chia.pay.wechat.util.authorization.oauth.protool.valid_access_token;

/**
 * 响应：检验授权凭证（access_token）是否有效
 * 
 */
public class ValidAccessTokenResponse {

    private String errcode;
    private String errmsg;

    public String getErrcode() {
        return errcode;
    }

    public void setErrcode(String errcode) {
        this.errcode = errcode;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public boolean ok(){
        return this.errmsg != null && "ok".equals(this.errmsg);
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"errcode\"").append(":\"").append(errcode).append("\",");
		sb.append("\"errmsg\"").append(":\"").append(errmsg);
		sb.append("}");
        return sb.toString();
    }
}
