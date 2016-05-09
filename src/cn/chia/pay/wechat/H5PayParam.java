package cn.chia.pay.wechat;


import javax.xml.bind.annotation.XmlElement;

import cn.chia.pay.wechat.util.common.Configure;
/**
 * H5调起支付API的参数对象
 * <p><a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_7&index=6">开发文档</p>
 * <p/>
 * 
 */
public class H5PayParam {
    private final String appid = Configure.getInstance().getAppId();
    private String timeStamp;
    private String nonceStr;
    private String packageWithPrepayId; // 参数名package
    private final String signType = "MD5";
    private String paySign;

    @XmlElement(name = "appId")
    public String getAppid() {
        return appid;
    }


    public String getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getNonceStr() {
        return nonceStr;
    }

    public void setNonceStr(String nonceStr) {
        this.nonceStr = nonceStr;
    }

    @XmlElement(name = "package")
    public String getPackageWithPrepayId() {
        return packageWithPrepayId;
    }

    public void setPackageWithPrepayId(String packageWithPrepayId) {
        this.packageWithPrepayId = packageWithPrepayId;
    }

    public String getSignType() {
        return signType;
    }

    public String getPaySign() {
        return paySign;
    }

    public void setPaySign(String paySign) {
        this.paySign = paySign;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("H5PayConfig: {");
		sb.append("\"appid\"").append(":\"").append(appid).append("\",");
		sb.append("\"timeStamp\"").append(":\"").append(timeStamp).append("\",");
		sb.append("\"nonceStr\"").append(":\"").append(nonceStr).append("\",");
		sb.append("\"packageWithPrepayId\"").append(":\"").append(packageWithPrepayId).append("\",");
		sb.append("\"signType\"").append(":\"").append(signType).append("\",");
		sb.append("\"paySign\"").append(":\"").append(paySign);
        return sb.toString();
    }
}
