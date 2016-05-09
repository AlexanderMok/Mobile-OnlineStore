package cn.chia.pay.wechat.util.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import org.apache.http.Consts;

/**
 * @author 莫庆来, 2016年4月16日 下午8:42:34
 * @description configure charsets here
 */
public class Charsets {
	public static final Charset UTF8 = Charset.forName("UTF-8");
	
    /**
     * 使用UTF-8进行URL编码
     * @param str
     * @return
     */
    public static String urlEncode(String str) {
        String result = null;
        try {
            result = URLEncoder.encode(str, Consts.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
            // never throws
        }
        return result;
    }
}
