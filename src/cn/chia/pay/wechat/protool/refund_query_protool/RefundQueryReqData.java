package cn.chia.pay.wechat.protool.refund_query_protool;

import javax.xml.bind.annotation.XmlRootElement;

import cn.chia.pay.wechat.util.common.Configure;


/**
 * @author Administrator, 2016年4月14日 下午4:56:43
 * 查询退款请求对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_5">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class RefundQueryReqData {
    private String appid = Configure.getInstance().getAppId();
    private String mch_id = Configure.getInstance().getMchId();
    private String device_info;
    private String nonce_str;
    private String sign;
    //下面参数四选一post给微信
    private String transaction_id;
    private String out_trade_no;
    private String out_refund_no;
    private String refund_id;
    
    public RefundQueryReqData() {
	}
    
    /**
     * 最少要求数据
     */
	public RefundQueryReqData(String appid, String mch_id,
			String nonce_str, String sign, String out_trade_no) {
		this.appid = appid;
		this.mch_id = mch_id;
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.out_trade_no = out_trade_no;
	}
	
	/**
     * 全部数据
     */
	public RefundQueryReqData(String device_info, String nonce_str,
			String sign, String transaction_id, String out_trade_no,
			String out_refund_no, String refund_id) {
		this.device_info = device_info;
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.transaction_id = transaction_id;
		this.out_trade_no = out_trade_no;
		this.out_refund_no = out_refund_no;
		this.refund_id = refund_id;
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

    public String getRefund_id() {
        return refund_id;
    }

    public void setRefund_id(String refund_id) {
        this.refund_id = refund_id;
    }

    
    @Override
    public String toString() {
	    StringBuffer sb = new StringBuffer();
		sb.append("RefundQueryReqData: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"device_info\"").append(":\"").append(device_info).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign).append("\",");
		sb.append("\"transaction_id\"").append(":\"").append(transaction_id).append("\",");
		sb.append("\"out_trade_no\"").append(":\"").append(out_trade_no).append("\",");
		sb.append("\"out_refund_no\"").append(":\"").append(out_refund_no).append("\",");
		sb.append("\"refund_id\"").append(":\"").append(refund_id);
		sb.append("}");
	    return sb.toString();
    }
}
