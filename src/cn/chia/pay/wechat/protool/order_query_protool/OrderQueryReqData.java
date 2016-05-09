package cn.chia.pay.wechat.protool.order_query_protool;

import javax.xml.bind.annotation.XmlRootElement;

import cn.chia.pay.wechat.util.common.Configure;

/**
 * @author 莫庆来, 2016年4月14日 下午4:40:54
 * 查询订单请求对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_2">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class OrderQueryReqData {
	private String appid = Configure.getInstance().getAppId();
    private String mch_id = Configure.getInstance().getMchId();
    private String transaction_id;
    private String out_trade_no;
    private String nonce_str;
    private String sign;

    public OrderQueryReqData() {
	}
    
    /**
     * 最少要求数据
     */
	public OrderQueryReqData(String out_trade_no, String nonce_str, String sign) {
		this.out_trade_no = out_trade_no;
		this.nonce_str = nonce_str;
		this.sign = sign;
	}
	
	/**
	 * 全部数据，transaction_id,out_trade_no 二选一
	 * @param transaction_id
	 * @param out_trade_no
	 * @param nonce_str
	 * @param sign
	 */
	public OrderQueryReqData(String transaction_id, String out_trade_no,
			String nonce_str, String sign) {
		this.transaction_id = transaction_id;
		this.out_trade_no = out_trade_no;
		this.nonce_str = nonce_str;
		this.sign = sign;
	}

	public String getAppid() {
        return appid;
    }

    public String getMch_id() {
        return mch_id;
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
    
    @Override
    public String toString() {
	    StringBuffer sb = new StringBuffer();
		sb.append("OrderQueryReqData: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"transaction_id\"").append(":\"").append(transaction_id).append("\",");
		sb.append("\"out_trade_no\"").append(":\"").append(out_trade_no).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign);
		sb.append("}");
	    return sb.toString();
    }
    
}
