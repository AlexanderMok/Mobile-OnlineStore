package cn.chia.pay.wechat.util.common;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URL;
import java.net.URLConnection;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;



/**
 * @author 莫庆来, 2016年4月15日 上午11:27:29
 *
 */
public class HttpHandler {
	
	private static Logger log = Logger.getLogger(HttpHandler.class);
	
	
    //连接超时时间，默认10秒
    private static int socketTimeout = 10000;

    //传输超时时间，默认30秒
    private static int connectTimeout = 30000;

    //请求器的配置
    private static RequestConfig requestConfig;

    //HTTP请求器
    private CloseableHttpClient httpClient;
    
    //初始化,私有化构造方法
	private HttpHandler() throws UnrecoverableKeyException, KeyManagementException, KeyStoreException, NoSuchAlgorithmException, IOException {
//		init();
		 //根据默认超时限制初始化requestConfig
        requestConfig = RequestConfig.custom().setSocketTimeout(socketTimeout).setConnectTimeout(connectTimeout).build();
	}
    
    /**
     * @author 微信scan-pay demo
     * @throws KeyStoreException
     * @throws IOException
     * @throws KeyManagementException
     * @throws UnrecoverableKeyException
     * @throws NoSuchAlgorithmException
     */
	private void init() throws KeyStoreException, IOException, KeyManagementException, UnrecoverableKeyException, NoSuchAlgorithmException {
		
		KeyStore keyStore = KeyStore.getInstance("PKCS12");
		//加载本地的证书,封装https加密传输,证书路径在配置文件设置
        FileInputStream instream = new FileInputStream(new File(Configure.getInstance().getCertLocalPath()));
        try {
        	keyStore.load(instream, Configure.getInstance().getCertPassword().toCharArray());
        } catch (CertificateException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
		} finally{
        	instream.close();
        }
        
     // Trust own CA and all self-signed certs
        SSLContext sslcontext = SSLContexts.custom()
                .loadKeyMaterial(keyStore, Configure.getInstance().getCertPassword().toCharArray())
                .build();
        // Allow TLSv1 protocol only
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
                sslcontext,
                new String[]{"TLSv1"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);

        httpClient = HttpClients.custom()
                .setSSLSocketFactory(sslsf)
                .build();

       
	}
	
	
	
    /**
     * @author 莫庆来
     * <p>Send Https Get request with HttpClient. 
     * Mostly use to request access_token, jsapi_ticket as a url for these variables shall be prepared.</p>
     * <p>可通过setXXTimeOut()改变默认连接时间</p>
     * @param url
     * @return JSONObject response result
     */
    public static JSONObject sendGetRequest(String url){
    	 
    	JSONObject jsonObject = null;
		CloseableHttpResponse httpResponse = null;
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpGet = new HttpGet(url);
		//加载请求器的配置
		httpGet.setConfig(requestConfig);
		try {
			
			// 创建SSLContext对象，并使用指定的信任管理器初始化
			TrustManager[] tm = { new WeChatTrustManger() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLConnectionSocketFactory ssf =  new SSLConnectionSocketFactory(sslContext);
			httpClient = HttpClients.custom().setSSLSocketFactory(ssf).build();  
			
			httpResponse = httpClient.execute(httpGet);
			
			int statusCode = httpResponse.getStatusLine().getStatusCode();
			
			log.info("HttpHandler-->sendGetRequest() connection status: " + httpResponse.getStatusLine());
			System.out.println("HttpHandler-->sendGetRequest() connection status: " + httpResponse.getStatusLine());
			if (statusCode == HttpStatus.SC_OK) {
				HttpEntity entity = httpResponse.getEntity();
				String result = EntityUtils.toString(entity,Charsets.UTF8);
				RequestCheck.isSuccess(result, HttpHandler.class,"sendGetRequest()");
				jsonObject = JSONObject.parseObject(result);			
				return jsonObject;
			} 
        } catch (Exception e) {
            log.error("http get throws Exception");
            e.printStackTrace();
            System.out.println("HttpHandler-->sendGetRequest()" + e.getStackTrace());
		} finally {
			try {
				httpGet.abort();
				httpResponse.close();
				httpClient.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return jsonObject;
    }
    
    
    /**
     * @author 莫庆来
     * <p>Send Https Get request with jdk java.net. 
     * Mostly use to request access_token, jsapi_ticket as a url for these variables shall be prepared.</p>
     * <p>原生，速度快，可通过setXXTimeOut()改变默认连接时间</p>
     * @param reqUrl
     * @return json字符串
     */
	public static String httpsGetRequest(String reqUrl) {

		String result = null;
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		HttpsURLConnection conn = null;
		try {
			// 创建SSLContext对象，并使用指定的信任管理器初始化
			TrustManager[] tm = { new WeChatTrustManger() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(reqUrl);
			conn = (HttpsURLConnection) url.openConnection();
			conn.setSSLSocketFactory(ssf);
			// 设置请求方式（GET）
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setReadTimeout(socketTimeout);
			conn.setConnectTimeout(connectTimeout);

			conn.connect();
//			int statusCode = conn.getResponseCode();
			String statusCode = conn.getResponseMessage();
			log.info("HttpHandler-->sendGetRequest() connection status: " + statusCode);
			System.out.println("HttpHandler-->sendGetRequest() connection status: " + statusCode);
			
			if (statusCode.equals("OK")) {
				// 从输入流读取返回内容
				inputStream = conn.getInputStream();
				inputStreamReader = new InputStreamReader(inputStream, Charsets.UTF8);
				bufferedReader = new BufferedReader(inputStreamReader);
				String str = null;
				StringBuffer buffer = new StringBuffer();
				while ((str = bufferedReader.readLine()) != null) {
					buffer.append(str);
				}
				result = buffer.toString();
				RequestCheck.isSuccess(result, HttpHandler.class,"httpsGetRequest()");
			}

			log.info("成功获取数据：" + result);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 释放资源
			try {
				bufferedReader.close();
				inputStreamReader.close();
				inputStream.close();
				inputStream = null;
				conn.disconnect();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
    
    
	/**
	 * 来自公司
	 */
	public static String sendGet(String url, String param) {
		String result = "";
		BufferedReader in = null;
		try {
			String urlNameString = url + "?" + param;
			URL realUrl = new URL(urlNameString);
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			// 设置通用的请求属性
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent",
					"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 建立实际的连接
			connection.connect();
			// 获取所有响应头字段
			Map<String, List<String>> map = connection.getHeaderFields();
			// 遍历所有的响应头字段
			for (String key : map.keySet()) {
				System.out.println(key + "--->" + map.get(key));
			}
			// 定义 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
    
   
	/**
	 * @author 莫庆来 rely on org.apache.http.client.fluent.Request;
	 * @param url
	 * @param xmlObj
	 * @return xml in String
	 */
    public static String sendPostRequest(String url, String xmlObj) {
    	String result = null;
    	try {
    		HttpResponse response = Request.Post(url)
			.socketTimeout(socketTimeout)
			.connectTimeout(connectTimeout)
			.bodyString(xmlObj, ContentType.create("text/xml", Charsets.UTF8))
			.execute().returnResponse();
    		
    		int statusCode = response.getStatusLine().getStatusCode();
    		log.info("HttpHandler-->sendGetRequest() connection status: " + response.getStatusLine());
			System.out.println("HttpHandler-->sendGetRequest() connection status: " + response.getStatusLine());
			
			if(statusCode == HttpStatus.SC_OK){
				HttpEntity entity = response.getEntity();
				result = EntityUtils.toString(entity, Charsets.UTF8);
				return result;
			}
		} catch (Exception e) {
			log.error("post请求异常，" + e.getMessage() + "\n post url:" + url);
			e.printStackTrace();
		}
    	return result;
    }
    
    
    
    /**
     * @author 莫庆来
     * <p>java.net原生</p>
     * @param url
     * @param xmlObj
     * @return
     */
    public static String httpsPostXmlRequest(String url, String xmlObj) { 
    	String result = null;
		OutputStream outputStream = null;
		OutputStreamWriter outputStreamWriter = null;
		Writer out = null;
		
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		
		HttpsURLConnection conn = null;
    	try{
			// 创建SSLContext对象，并使用指定的信任管理器初始化
			TrustManager[] tm = { new WeChatTrustManger() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();
    		
    		
    		URL reqUrl = new URL(url);
    		conn = (HttpsURLConnection) reqUrl.openConnection();
    		
    		conn.setRequestMethod("POST");
    		conn.setSSLSocketFactory(ssf);
    		conn.setReadTimeout(socketTimeout);
    		conn.setConnectTimeout(connectTimeout);
    		conn.setDoInput(true);//读取
    		conn.setDoOutput(true);//写入
    		conn.setUseCaches(false);
    		conn.setRequestProperty("Content-Type", "text/xml;charset:utf-8");
    		try {
    			
    			//写入post数据
    			outputStream = conn.getOutputStream();
    			outputStreamWriter = new OutputStreamWriter(outputStream, Charsets.UTF8);
    			out = new BufferedWriter(outputStreamWriter);
    			
    			out.write(xmlObj);
    			out.flush();
    		} finally {
    			out.close();
    			outputStreamWriter.close();
    			outputStream.close();
    		}
    		
    		conn.connect();
    		
    		String statusCode = conn.getResponseMessage();
			log.info("HttpHandler-->httpsPostXmlRequest() connection status: " + statusCode);
			System.out.println("HttpHandler-->httpsPostXmlRequest() connection status: " + statusCode);
			
			if (statusCode.equals("OK")) {
				//接收返回数据
	    		inputStream = conn.getInputStream();
	    		inputStreamReader = new InputStreamReader(inputStream, Charsets.UTF8);
	    		bufferedReader = new BufferedReader(inputStreamReader);
	    		
	    		String str = null;
				StringBuffer buffer = new StringBuffer();
				while ((str = bufferedReader.readLine()) != null) {
					buffer.append(str);
				}
				result = buffer.toString();
				RequestCheck.isAccessOK(result, HttpHandler.class,"httpsPostXmlRequest()");
				RequestCheck.isBusinessOK(result, HttpHandler.class,"httpsPostXmlRequest()");
    		}
        
        
        } catch (Exception e) {  
        	log.error("post请求异常，" + e.getMessage() + "\n post url:" + url);
            e.printStackTrace();
        } finally {
			try {
				bufferedReader.close();
				inputStreamReader.close();
				inputStream.close();
				inputStream = null;
				conn.disconnect();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }  
        return result;  
    }
    
    /**
     * 设置连接超时时间
     *
     * @param socketTimeout 连接时长，默认10秒
     */
    public void setSocketTimeout(int socketTimeout) {
        HttpHandler.socketTimeout = socketTimeout;
        resetRequestConfig();
    }

    /**
     * 设置传输超时时间
     *
     * @param connectTimeout 传输时长，默认30秒
     */
    public void setConnectTimeout(int connectTimeout) {
        HttpHandler.connectTimeout = connectTimeout;
        resetRequestConfig();
    }
    
    private void resetRequestConfig(){
        requestConfig = RequestConfig.custom().setSocketTimeout(socketTimeout).setConnectTimeout(connectTimeout).build();
    }
}
