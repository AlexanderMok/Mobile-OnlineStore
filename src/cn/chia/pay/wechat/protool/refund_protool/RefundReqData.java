package cn.chia.pay.wechat.protool.refund_protool;

import javax.xml.bind.annotation.XmlRootElement;

import cn.chia.pay.wechat.util.common.Configure;


/**
 * @author Administrator, 2016年4月14日 下午4:55:58
 * 申请退款请求对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_5">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class RefundReqData {
	private String appid = Configure.getInstance().getAppId();
    private String mch_id = Configure.getInstance().getMchId();
    private String device_info;
    private String nonce_str;
    private String sign;
    private String transaction_id;
    private String out_trade_no;
    private String out_refund_no;
    private int total_fee;
    private int refund_fee;
    private String refund_fee_type = "CNY";
    private String op_user_id;
    
    public RefundReqData() {
	}
    
    /**
     * 最少要求数据
     */
	public RefundReqData(String nonce_str, String sign, String out_trade_no,
			String out_refund_no, int total_fee, int refund_fee,
			String op_user_id) {
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.out_trade_no = out_trade_no;
		this.out_refund_no = out_refund_no;
		this.total_fee = total_fee;
		this.refund_fee = refund_fee;
		this.op_user_id = op_user_id;
	}
	/**
	 * 全部数据
	 */
	public RefundReqData(String device_info, String nonce_str, String sign,
			String transaction_id, String out_trade_no, String out_refund_no,
			int total_fee, int refund_fee, String op_user_id) {
		this.device_info = device_info;
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.transaction_id = transaction_id;
		this.out_trade_no = out_trade_no;
		this.out_refund_no = out_refund_no;
		this.total_fee = total_fee;
		this.refund_fee = refund_fee;
		this.op_user_id = op_user_id;
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

	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	public String getOut_trade_no() {
		return out_trade_no;
	}

	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}

	public String getOut_refund_no() {
		return out_refund_no;
	}

	public void setOut_refund_no(String out_refund_no) {
		this.out_refund_no = out_refund_no;
	}

	public int getTotal_fee() {
		return total_fee;
	}

	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}

	public int getRefund_fee() {
		return refund_fee;
	}

	public void setRefund_fee(int refund_fee) {
		this.refund_fee = refund_fee;
	}

	public String getRefund_fee_type() {
		return refund_fee_type;
	}

	public String getOp_user_id() {
		return op_user_id;
	}

	public void setOp_user_id(String op_user_id) {
		this.op_user_id = op_user_id;
	}

	@Override
    public String toString() {
	    StringBuffer sb = new StringBuffer();
		sb.append("RefundReqData: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"device_info\"").append(":\"").append(device_info).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign).append("\",");
		sb.append("\"transaction_id\"").append(":\"").append(transaction_id).append("\",");
		sb.append("\"out_trade_no\"").append(":\"").append(out_trade_no).append("\",");
		sb.append("\"out_refund_no\"").append(":\"").append(out_refund_no).append("\",");
		sb.append("\"refund_fee_type\"").append(":\"").append(refund_fee_type).append("\",");
		sb.append("\"total_fee\"").append(":\"").append(total_fee).append("\",");
		sb.append("\"refund_fee\"").append(":\"").append(refund_fee).append("\",");
		sb.append("\"op_user_id\"").append(":\"").append(op_user_id);
		sb.append("}");
	    return sb.toString();
    }
}
