package cn.chia.pay.wechat.util.authorization.token.protool.get_jsapi_ticket;

public class GetJsApiTicketResponse {

	private String errcode;
	private String errmsg;
	private String ticket;
	private String expires_in;

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

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(String expires_in) {
		this.expires_in = expires_in;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"errcode\"").append(":\"").append(errcode).append("\",");
		sb.append("\"errmsg\"").append(":\"").append(errmsg).append("\",");
		sb.append("\"ticket\"").append(":\"").append(ticket).append("\",");
		sb.append("\"expires_in\"").append(":\"").append(expires_in);
		sb.append("}");
		return sb.toString();
	}
	
}
