package cn.chia.pay.wechat.util.authorization.token.protool.get_access_token;

public class GetAccessTokenResponse {
	
	private String access_token;
	private Integer expires_in;
	private String errcode;
	private String errmsg;

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public Integer getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(Integer expires_in) {
		this.expires_in = expires_in;
	}

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
		sb.append("{");
		sb.append("\"access_token\"").append(":\"").append(access_token).append("\",");
		sb.append("\"expires_in\"").append(":\"").append(expires_in).append("\",");
		sb.append("\"errcode\"").append(":\"").append(errcode).append("\",");
		sb.append("\"errmsg\"").append(":\"").append(errmsg);
		sb.append("}");
		return sb.toString();
	}
	
	

}
