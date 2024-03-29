package cn.chia.pay.wechat.protool.refund_query_protool;

import java.util.Arrays;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Administrator, 2016年4月14日 下午4:56:56
 * 查询退款响应对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_5">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class RefundQueryResData {
	
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
    private int total_fee;
    private String fee_type = "CNY";
    private int cash_fee;
    private int refund_count;
    private String[] out_refund_no_$n;
    private String[] refund_id_$n;
    private String[] refund_channel_$n;
    private Integer[] refund_fee_$n;
    private Integer[] coupon_refund_fee_$n;
    private Integer[] coupon_refund_count_$n;
    private String[][] coupon_refund_batch_id_$n_$m;
    private String[][] coupon_refund_id_$n_$m;
    private Integer[][] coupon_refund_fee_$n_$m;
    private String[] refund_status_$n;

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

    public int getRefund_count() {
        return refund_count;
    }

    public void setRefund_count(int refund_count) {
        this.refund_count = refund_count;
    }

    public String[] getOut_refund_no_$n() {
        return out_refund_no_$n;
    }

    public void setOut_refund_no_$n(String[] out_refund_no_$n) {
        this.out_refund_no_$n = out_refund_no_$n;
    }

    public String[] getRefund_id_$n() {
        return refund_id_$n;
    }

    public void setRefund_id_$n(String[] refund_id_$n) {
        this.refund_id_$n = refund_id_$n;
    }

    public String[] getRefund_channel_$n() {
        return refund_channel_$n;
    }

    public void setRefund_channel_$n(String[] refund_channel_$n) {
        this.refund_channel_$n = refund_channel_$n;
    }

    public Integer[] getRefund_fee_$n() {
        return refund_fee_$n;
    }

    public void setRefund_fee_$n(Integer[] refund_fee_$n) {
        this.refund_fee_$n = refund_fee_$n;
    }

    public Integer[] getCoupon_refund_fee_$n() {
        return coupon_refund_fee_$n;
    }

    public void setCoupon_refund_fee_$n(Integer[] coupon_refund_fee_$n) {
        this.coupon_refund_fee_$n = coupon_refund_fee_$n;
    }

    public Integer[] getCoupon_refund_count_$n() {
        return coupon_refund_count_$n;
    }

    public void setCoupon_refund_count_$n(Integer[] coupon_refund_count_$n) {
        this.coupon_refund_count_$n = coupon_refund_count_$n;
    }

    public String[][] getCoupon_refund_batch_id_$n_$m() {
        return coupon_refund_batch_id_$n_$m;
    }

    public void setCoupon_refund_batch_id_$n_$m(String[][] coupon_refund_batch_id_$n_$m) {
        this.coupon_refund_batch_id_$n_$m = coupon_refund_batch_id_$n_$m;
    }

    public String[][] getCoupon_refund_id_$n_$m() {
        return coupon_refund_id_$n_$m;
    }

    public void setCoupon_refund_id_$n_$m(String[][] coupon_refund_id_$n_$m) {
        this.coupon_refund_id_$n_$m = coupon_refund_id_$n_$m;
    }

    public Integer[][] getCoupon_refund_fee_$n_$m() {
        return coupon_refund_fee_$n_$m;
    }

    public void setCoupon_refund_fee_$n_$m(Integer[][] coupon_refund_fee_$n_$m) {
        this.coupon_refund_fee_$n_$m = coupon_refund_fee_$n_$m;
    }

    public String[] getRefund_status_$n() {
        return refund_status_$n;
    }

    public void setRefund_status_$n(String[] refund_status_$n) {
        this.refund_status_$n = refund_status_$n;
    }
    
    @Override
    public String toString() {
	    StringBuffer sb = new StringBuffer();
		sb.append("RefundQueryResData: {");
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
		sb.append("\"total_fee\"").append(":\"").append(total_fee).append("\",");
		sb.append("\"fee_type\"").append(":\"").append(fee_type).append("\",");
		sb.append("\"cash_fee\"").append(":\"").append(cash_fee).append("\",");
		sb.append("\"refund_count\"").append(":\"").append(refund_count).append("\",");
		sb.append("\"out_refund_no_$n\"").append(":\"").append(Arrays.toString(out_refund_no_$n)).append("\",");
		sb.append("\"refund_id_$n\"").append(":\"").append(Arrays.toString(refund_id_$n)).append("\",");
		sb.append("\"refund_channel_$n=\"").append(":\"").append(Arrays.toString(refund_channel_$n)).append("\",");
		sb.append("\"refund_fee_$n\"").append(":\"").append(Arrays.toString(refund_fee_$n)).append("\",");
		sb.append("\"coupon_refund_fee_$n\"").append(":\"").append(Arrays.toString(coupon_refund_fee_$n)).append("\",");
		sb.append("\"coupon_refund_count_$n\"").append(":\"").append(Arrays.toString(coupon_refund_count_$n)).append("\",");
		sb.append("\"coupon_refund_batch_id_$n_$m\"").append(":\"").append(Arrays.toString(coupon_refund_batch_id_$n_$m)).append("\",");
		sb.append("\"coupon_refund_id_$n_$m\"").append(":\"").append(Arrays.toString(coupon_refund_id_$n_$m)).append("\",");
		sb.append("\"coupon_refund_id_$n_$m\"").append(":\"").append(Arrays.toString(coupon_refund_id_$n_$m)).append("\",");
		sb.append("\"coupon_refund_fee_$n_$m\"").append(":\"").append(Arrays.toString(coupon_refund_fee_$n_$m)).append("\",");
		sb.append("\"coupon_refund_id_$n_$m\"").append(":\"").append(Arrays.toString(coupon_refund_id_$n_$m)).append("\",");
		sb.append("\"refund_status_$n\"").append(":\"").append(Arrays.toString(refund_status_$n));
		sb.append("}");
	    return sb.toString();
    }

}
