package cn.chia.pay.wechat.util.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * @author 莫庆来, 2016年4月16日 上午11:18:08
 * @desctiption 读取基础配置
 */
public class Configure {
	
	private static Logger logger = Logger.getLogger(Configure.class);
	
	private static final Configure configure = new Configure();
	
	private final String configFile = "/wechat.properties";
	/**
	 * 这个就是自己要保管好的私有Key了（切记只能放在自己的后台代码里，不能放在任何可能被看到源代码的客户端程序中）
	 * 每次自己Post数据给API的时候都要用这个key来对所有字段进行签名，生成的签名会放在Sign这个字段，API收到Post数据的时候也会用同样的签名算法对Post过来的数据进行签名和验证
	 * 收到API的返回的时候也要用这个key来对返回的数据算下签名，跟API的Sign数据进行比较，如果值不一致，有可能数据被第三方给篡改
	 */
	private String key;

	//微信分配的公众号ID（开通公众号之后可以获取到）
	private String appId;
	//第三方用户唯一凭证密钥
	private String appSecret;

	//微信支付分配的商户号ID（开通公众号的微信支付功能之后可以获取到）
	private String mchId;

	//HTTPS证书的本地路径
	private String certLocalPath;

	//HTTPS证书密码，默认密码等于商户号MCHID
	private String certPassword;

	//是否使用异步线程的方式来上报API测速，默认为异步模式
//	private static boolean useThreadToDoReport = true;

	//公众号服务器IP
	private String url = "";
	
	private String paySignKey;

	private String notify_url;
	
	//私有化构造方法
	private Configure(){
		try {
			Properties p = new Properties();
			InputStream inStream = this.getClass().getResourceAsStream(configFile);
			if(inStream == null){
				logger.error("Cofigure-->Configure(). wechat.properties can not be found");
				return;
			}
		
			p.load(inStream);
			this.key = p.getProperty("key");
			this.appId = p.getProperty("AppId");
			this.appSecret = p.getProperty("appSecret");
			this.mchId = p.getProperty("mchId");
			this.url = p.getProperty("url");
			this.certLocalPath = p.getProperty("certLocalPath");
			this.certPassword = p.getProperty("certPassword");
			this.paySignKey = p.getProperty("paySignKey");
			this.notify_url = p.getProperty("notify_url");
			
			
		} catch (IOException e) {
			logger.error("wechat.properties can not be found. error:" + e.getMessage());
			System.out.println("Cofigure-->Configure()" + e.getStackTrace());
		}
		logger.info("load wechat.properties succeeded.");
	}
	
	public static Configure getInstance(){
		return configure;
	}
	
	public String getKey() {
		return key;
	}

	public String getAppId() {
		return appId;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public String getMchId() {
		return mchId;
	}

	public String getCertLocalPath() {
		return certLocalPath;
	}

	public String getCertPassword() {
		return certPassword;
	}

	public String getUrl() {
		return url;
	}

	public String getPaySignKey() {
		return paySignKey;
	}

	public String getNotify_url() {
		return notify_url;
	}
}
