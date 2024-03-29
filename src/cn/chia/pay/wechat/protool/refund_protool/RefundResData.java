package cn.chia.pay.wechat.protool.refund_protool;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Administrator, 2016年4月14日 下午4:56:05
 * 申请退款响应对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_4">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class RefundResData {
	private String result_code;
    private String err_code;
    private String err_code_des;
    private String appid;
    private String mch_id;
    private String device_info;
    private String nonce_str;
    private String sign;
    private String transaction_id;
    private String out_trade_no;
    private String out_refund_no;
    private String refund_id;
    private String refund_channel;
    private int refund_fee;
    private int total_fee;
    private String fee_type = "CNY";
    private int cash_fee;
    private int cash_refund_fee;
    private int coupon_refund_fee;
    private int coupon_refund_count;
    private int coupon_refund_id;

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

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
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

    public String getRefund_id() {
        return refund_id;
    }

    public void setRefund_id(String refund_id) {
        this.refund_id = refund_id;
    }

    public String getRefund_channel() {
        return refund_channel;
    }

    public void setRefund_channel(String refund_channel) {
        this.refund_channel = refund_channel;
    }

    public int getRefund_fee() {
        return refund_fee;
    }

    public void setRefund_fee(int refund_fee) {
        this.refund_fee = refund_fee;
    }

    public int getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(int total_fee) {
        this.total_fee = total_fee;
    }

    public String getFee_type() {
        return fee_type;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public int getCash_fee() {
        return cash_fee;
    }

    public void setCash_fee(int cash_fee) {
        this.cash_fee = cash_fee;
    }

    public int getCash_refund_fee() {
        return cash_refund_fee;
    }

    public void setCash_refund_fee(int cash_refund_fee) {
        this.cash_refund_fee = cash_refund_fee;
    }

    public int getCoupon_refund_fee() {
        return coupon_refund_fee;
    }

    public void setCoupon_refund_fee(int coupon_refund_fee) {
        this.coupon_refund_fee = coupon_refund_fee;
    }

    public int getCoupon_refund_count() {
        return coupon_refund_count;
    }

    public void setCoupon_refund_count(int coupon_refund_count) {
        this.coupon_refund_count = coupon_refund_count;
    }

    public int getCoupon_refund_id() {
        return coupon_refund_id;
    }

    public void setCoupon_refund_id(int coupon_refund_id) {
        this.coupon_refund_id = coupon_refund_id;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("RefundResData: {");
		sb.append("\"result_code\"").append(":\"").append(result_code).append("\",");
		sb.append("\"err_code\"").append(":\"").append(err_code).append("\",");
		sb.append("\"err_code_des\"").append(":\"").append(err_code_des).append("\",");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"device_info\"").append(":\"").append(device_info).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign).append("\",");
		sb.append("\"transaction_id\"").append(":\"").append(transaction_id).append("\",");
		sb.append("\"out_trade_no\"").append(":\"").append(out_trade_no).append("\",");
		sb.append("\"out_refund_no\"").append(":\"").append(out_refund_no).append("\",");
		sb.append("\"refund_id\"").append(":\"").append(refund_id).append("\",");
		sb.append("\"refund_channel\"").append(":\"").append(refund_channel).append("\",");
		sb.append("\"refund_fee\"").append(":\"").append(refund_fee).append("\",");
		sb.append("\"total_fee\"").append(":\"").append(total_fee).append("\",");
		sb.append("\"fee_type\"").append(":\"").append(fee_type).append("\",");
		sb.append("\"cash_fee\"").append(":\"").append(cash_fee).append("\",");
		sb.append("\"cash_refund_fee\"").append(":\"").append(cash_refund_fee).append("\",");
		sb.append("\"coupon_refund_fee\"").append(":\"").append(coupon_refund_fee).append("\",");
		sb.append("\"coupon_refund_count\"").append(":\"").append(coupon_refund_count).append("\",");
		sb.append("\"coupon_refund_id\"").append(":\"").append(coupon_refund_id);
        return sb.toString();
    }
}
