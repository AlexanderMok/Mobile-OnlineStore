package cn.chia.pay.wechat;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author 莫庆来, 2016年4月20日 上午10:45:43
 *
 */
@XmlRootElement(name = "xml")
public class PayApiException extends Exception{
	
	private static final long serialVersionUID = 4776256305579977843L;
	private String return_code;
	private String return_msg;
	protected static String CODE_SUCCESS = "SUCCESS";
	protected static String CODE_FAIL = "FAIL";
	
	public PayApiException() {
    }
	
	public PayApiException(String return_code, String return_msg) {
        this.return_code = return_code;
        this.return_msg = return_msg;
    }


    public String getReturn_code() {
        return return_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public String getReturn_msg() {
        return return_msg;
    }

    public void setReturn_msg(String return_msg) {
        this.return_msg = return_msg;
    }

    @Override
    public String toString() {
    	StringBuffer sb=new StringBuffer();
    	sb.append("PayApiException {");
    	sb.append("\"return_code=\"").append(":\"").append(return_code).append("\",");
    	sb.append("\"return_msg\"").append(":\"").append(return_msg);
    	sb.append("}");
        return sb.toString();
    }
}
