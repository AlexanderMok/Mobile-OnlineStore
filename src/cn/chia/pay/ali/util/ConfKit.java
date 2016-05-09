package cn.chia.pay.ali.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * @author Administrator, 2016年4月21日 上午9:58:54
 * 
 */
public class ConfKit {
	private static Properties properties = new Properties();

	static {
		try {
			properties.load(Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("/wechat.properties"));
//			properties.load(ConfKit.class.getResourceAsStream("/wechat.properties"));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String get(String key) {
		return properties.getProperty(key);
	}

	public static void setProps(Properties p) {
		properties = p;
	}
}
