package cn.chia.pay.wechat.util.common;

import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

/**
 * @author 莫庆来, 2016年4月16日 上午11:36:54
 * 
 * 微信证书管理器
 */
public class WeChatTrustManger implements X509TrustManager {

//	private X509TrustManager weChatX509TrustManager;
	
	

	public WeChatTrustManger() {
	}

//	public WeChatTrustManger(KeyStore keyStore) throws NoSuchAlgorithmException,KeyStoreException {
//		TrustManagerFactory tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
//		tmf.init(keyStore);
//		TrustManager tms[] = tmf.getTrustManagers();
//		for (int i = 0; i < tms.length; i++) {
//			if (tms[i] instanceof X509TrustManager) {
//				weChatX509TrustManager = (X509TrustManager) tms[i];
//				return;
//			}
//		}
//		throw new RuntimeException("WeChatTrustManger Couldn't initialize, check apiclient_cert.p12");
//	}

	public void checkClientTrusted(X509Certificate[] chain, String authType)
			throws CertificateException {
//		weChatX509TrustManager.checkClientTrusted(chain, authType);
	}

	public void checkServerTrusted(X509Certificate[] chain, String authType)
			throws CertificateException {
//		weChatX509TrustManager.checkServerTrusted(chain, authType);
	}

	public X509Certificate[] getAcceptedIssuers() {
//		return weChatX509TrustManager.getAcceptedIssuers();
		return null;
	}

}
