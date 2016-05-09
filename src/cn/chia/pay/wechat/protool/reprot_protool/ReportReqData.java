package cn.chia.pay.wechat.protool.reprot_protool;

import javax.xml.bind.annotation.XmlRootElement;

import cn.chia.pay.wechat.util.common.Configure;


/**
 * 测速上报请求对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_8">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class ReportReqData {
	private String appid = Configure.getInstance().getAppId();
    private String mch_id = Configure.getInstance().getMchId();
    private String device_info;
    private String nonce_str;
    private String sign;
    private String interface_url;
    private int execute_time_;
    private String return_code;
    private String return_msg;
    private String result_code;
    private String err_code;
    private String err_code_des;
    private String out_trade_no;
    private String user_ip;
    private String time;
    
    public ReportReqData() {
	}
    
    //最少要求数据
	public ReportReqData(String nonce_str, String sign,
			String interface_url, int execute_time_, String return_code,
			String return_msg, String result_code, String err_code,
			String err_code_des, String out_trade_no, String user_ip,
			String time) {
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.interface_url = interface_url;
		this.execute_time_ = execute_time_;
		this.return_code = return_code;
		this.result_code = result_code;
		this.user_ip = user_ip;
	}

	//全部数据
	public ReportReqData(String device_info, String nonce_str, String sign,
			String interface_url, int execute_time_, String return_code,
			String return_msg, String result_code, String err_code,
			String err_code_des, String out_trade_no, String user_ip,
			String time) {
		this.device_info = device_info;
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.interface_url = interface_url;
		this.execute_time_ = execute_time_;
		this.return_code = return_code;
		this.return_msg = return_msg;
		this.result_code = result_code;
		this.err_code = err_code;
		this.err_code_des = err_code_des;
		this.out_trade_no = out_trade_no;
		this.user_ip = user_ip;
		this.time = time;
	}

	public String getAppid() {
        return appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public String getDevice_info() {
        return device_info;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getInterface_url() {
        return interface_url;
    }

    public void setInterface_url(String interface_url) {
        this.interface_url = interface_url;
    }

    public int getExecute_time_() {
        return execute_time_;
    }

    public void setExecute_time_(int execute_time_) {
        this.execute_time_ = execute_time_;
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

    public String getResult_code() {
        return result_code;
    }

    public void setResult_code(String result_code) {
        this.result_code = result_code;
    }

    public String getErr_code() {
        return err_code;
    }

    public void setErr_code(String err_code) {
        this.err_code = err_code;
    }

    public String getErr_code_des() {
        return err_code_des;
    }

    public void setErr_code_des(String err_code_des) {
        this.err_code_des = err_code_des;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getUser_ip() {
        return user_ip;
    }

    public void setUser_ip(String user_ip) {
        this.user_ip = user_ip;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    @Override
    public String toString() {
	    StringBuffer sb = new StringBuffer();
		sb.append("ReportReqData: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"device_info\"").append(":\"").append(device_info).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign).append("\",");
		sb.append("\"interface_url\"").append(":\"").append(interface_url).append("\",");
		sb.append("\"execute_time_\"").append(":\"").append(execute_time_).append("\",");
		sb.append("\"return_code\"").append(":\"").append(return_code).append("\",");
		sb.append("\"return_msg\"").append(":\"").append(return_msg).append("\",");
		sb.append("\"result_code\"").append(":\"").append(result_code).append("\",");
		sb.append("\"err_code\"").append(":\"").append(err_code).append("\",");
		sb.append("\"err_code_des\"").append(":\"").append(err_code_des).append("\",");
		sb.append("\"out_trade_no\"").append(":\"").append(out_trade_no).append("\",");
		sb.append("\"user_ip\"").append(":\"").append(user_ip).append("\",");
		sb.append("\"time\"").append(":\"").append(time);
		sb.append("}");
	    return sb.toString();
    }
}
