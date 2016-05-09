package cn.chia.pay.wechat.protool.pay_result_notify;

import java.util.Arrays;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author 莫庆来, 2016年4月14日 下午5:02:00
 * 支付结果通知对象<p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_7">支付结果通用通知</p>
 */
@XmlRootElement(name = "xml")
public class PayResultNotifyResData {
	private String appid;
    private String mch_id;
    private String device_info;
    private String nonce_str;
    private String sign;
    private String result_code;
    private String err_code;
    private String err_code_des;
    private String openid;
    private String is_subscribe;
    private String trade_type;
    private String bank_type;
    private int total_fee;
    private String fee_type;
    private int cash_fee;
    private String cash_fee_type;
    private int coupon_fee;
    private int coupon_count;
    private String[] coupon_id_$n;
    private Integer[] coupon_fee_$n;
    private String transaction_id;
    private String out_trade_no;
    private String attach;
    private String time_end;

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

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getIs_subscribe() {
        return is_subscribe;
    }

    public void setIs_subscribe(String is_subscribe) {
        this.is_subscribe = is_subscribe;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getBank_type() {
        return bank_type;
    }

    public void setBank_type(String bank_type) {
        this.bank_type = bank_type;
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

    public String getCash_fee_type() {
        return cash_fee_type;
    }

    public void setCash_fee_type(String cash_fee_type) {
        this.cash_fee_type = cash_fee_type;
    }

    public int getCoupon_fee() {
        return coupon_fee;
    }

    public void setCoupon_fee(int coupon_fee) {
        this.coupon_fee = coupon_fee;
    }

    public int getCoupon_count() {
        return coupon_count;
    }

    public void setCoupon_count(int coupon_count) {
        this.coupon_count = coupon_count;
    }

    public String[] getCoupon_id_$n() {
        return coupon_id_$n;
    }

    public void setCoupon_id_$n(String[] coupon_id_$n) {
        this.coupon_id_$n = coupon_id_$n;
    }

    public Integer[] getCoupon_fee_$n() {
        return coupon_fee_$n;
    }

    public void setCoupon_fee_$n(Integer[] coupon_fee_$n) {
        this.coupon_fee_$n = coupon_fee_$n;
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

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }
    
    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("PayResultNotifyResData: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"device_info\"").append(":\"").append(device_info).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign).append("\",");
		sb.append("\"result_code\"").append(":\"").append(result_code).append("\",");
		sb.append("\"err_code\"").append(":\"").append(err_code).append("\",");
		sb.append("\"err_code_des\"").append(":\"").append(err_code_des).append("\",");
		sb.append("\"openid\"").append(":\"").append(openid).append("\",");
		sb.append("\"is_subscribe\"").append(":\"").append(is_subscribe).append("\",");
		sb.append("\"trade_type\"").append(":\"").append(trade_type).append("\",");
		sb.append("\"bank_type\"").append(":\"").append(bank_type).append("\",");
		sb.append("\"total_fee\"").append(":\"").append(total_fee).append("\",");
		sb.append("\"fee_type\"").append(":\"").append(fee_type).append("\",");
		sb.append("\"cash_fee\"").append(":\"").append(cash_fee).append("\",");
		sb.append("\"cash_fee_type\"").append(":\"").append(cash_fee_type).append("\",");
		sb.append("\"coupon_fee\"").append(":\"").append(coupon_fee).append("\",");
		sb.append("\"coupon_count\"").append(":\"").append(coupon_count).append("\",");
		sb.append("\"coupon_id_$n\"").append(":\"").append(Arrays.toString(coupon_id_$n)).append("\",");
		sb.append("\"coupon_fee_$n\"").append(":\"").append(Arrays.toString(coupon_fee_$n)).append("\",");
		sb.append("\"transaction_id\"").append(":\"").append(transaction_id).append("\",");
		sb.append("\"out_trade_no\"").append(":\"").append(out_trade_no).append("\",");
		sb.append("\"attach\"").append(":\"").append(attach).append("\",");
		sb.append("\"time_end\"").append(":\"").append(time_end);
		sb.append("}");
        return sb.toString();
    }
}
