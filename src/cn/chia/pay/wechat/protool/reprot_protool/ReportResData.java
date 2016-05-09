package cn.chia.pay.wechat.protool.reprot_protool;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Administrator, 2016年4月20日 上午11:42:06
 * 测速上报响应对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_8">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class ReportResData {
	
	private String result_code;

	public String getResult_code() {
		return result_code;
	}

	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("ReportResData: {");
		sb.append("\"result_code\"").append(":\"").append(result_code);
		sb.append("}");
	    return sb.toString();
	}
}
