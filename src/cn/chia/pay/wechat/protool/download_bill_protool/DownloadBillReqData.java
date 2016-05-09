package cn.chia.pay.wechat.protool.download_bill_protool;

import javax.xml.bind.annotation.XmlRootElement;

import cn.chia.pay.wechat.util.common.Configure;


/**
 * @author Administrator, 2016年4月14日 下午4:57:56
 * 下载对账单请求对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_6">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class DownloadBillReqData {
	private String appid = Configure.getInstance().getAppId();
    private String mch_id = Configure.getInstance().getMchId();
    private String device_info;
    private String nonce_str;
    private String sign;
    private String bill_date;
    private String bill_type;
    
    public DownloadBillReqData() {
	}
    
    /**
     * 最少要求数据
     */
	public DownloadBillReqData(String nonce_str,
			String sign, String bill_date) {
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.bill_date = bill_date;
	}
	/**
	 * 全部数据
	 */
	public DownloadBillReqData(String device_info, String nonce_str,
			String sign, String bill_date, String bill_type) {
		this.device_info = device_info;
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.bill_date = bill_date;
		this.bill_type = bill_type;
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

    public String getBill_date() {
        return bill_date;
    }

    public void setBill_date(String bill_date) {
        this.bill_date = bill_date;
    }

    public String getBill_type() {
        return bill_type;
    }

    public void setBill_type(String bill_type) {
        this.bill_type = bill_type;
    }
    
    @Override
    public String toString() {
	    StringBuffer sb = new StringBuffer();
		sb.append("DownloadBillReqData: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"mch_id\"").append(":\"").append(mch_id).append("\",");
		sb.append("\"device_info\"").append(":\"").append(device_info).append("\",");
		sb.append("\"nonce_str\"").append(":\"").append(nonce_str).append("\",");
		sb.append("\"sign\"").append(":\"").append(sign).append("\",");
		sb.append("\"bill_date\"").append(":\"").append(bill_date).append("\",");
		sb.append("\"bill_type\"").append(":\"").append(bill_type);
		sb.append("}");
	    return sb.toString();
    }
}
