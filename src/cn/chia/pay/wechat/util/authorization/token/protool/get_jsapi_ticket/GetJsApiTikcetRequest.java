package cn.chia.pay.wechat.util.authorization.token.protool.get_jsapi_ticket;

public class GetJsApiTikcetRequest {

	private String access_token;
	private final String type = "jsapi";

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getType() {
		return type;
	}

}
