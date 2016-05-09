package cn.chia.pay.wechat.util.authorization.token;

import java.util.Date;

/**
 * Token entity. @author 莫庆来
 * 单例模式，不提供对外访问
 */

public class Token implements java.io.Serializable {

	// Fields

	
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String newAccessToken;
	private String oldAccessToken;
	private String newJsapiTicket;
	private String oldJsapiTicket;
	private Date time;
	
	private static Token token = new Token();
	
	
	// Constructors

	/** default constructor */
	private Token() {
	}

	protected static Token getInstance() {
		return token;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNewAccessToken() {
		return newAccessToken;
	}

	public void setNewAccessToken(String newAccessToken) {
		this.newAccessToken = newAccessToken;
	}

	public String getOldAccessToken() {
		return oldAccessToken;
	}

	public void setOldAccessToken(String oldAccessToken) {
		this.oldAccessToken = oldAccessToken;
	}

	public String getNewJsapiTicket() {
		return newJsapiTicket;
	}

	public void setNewJsapiTicket(String newJsapiTicket) {
		this.newJsapiTicket = newJsapiTicket;
	}

	public String getOldJsapiTicket() {
		return oldJsapiTicket;
	}

	public void setOldJsapiTicket(String oldJsapiTicket) {
		this.oldJsapiTicket = oldJsapiTicket;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	
}