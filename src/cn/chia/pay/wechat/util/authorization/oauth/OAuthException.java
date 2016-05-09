package cn.chia.pay.wechat.util.authorization.oauth;

/**
 * OAuth API 调用异常
 * 
 */
public class OAuthException extends Exception {

	private static final long serialVersionUID = -5695298469161916726L;

	public OAuthException() {
    }

    public OAuthException(String errcode, String errmsg) {
        this.errcode = errcode;
        this.errmsg = errmsg;
    }

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

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("OAuthException {");
		sb.append("\"errcode\"").append(":\"").append(errcode).append("\",");
		sb.append("\"errmsg\"").append(":\"").append(errmsg);
		sb.append("}");
        return sb.toString();
    }
}
