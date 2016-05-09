package cn.chia.pay.wechat.util.common;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期格式化
 * @author 莫庆来
 */
public class DateTool {
	
	/**
	 * 
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String dateToString(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	/**
	 * 
	 * @param date
	 * @return yyyyMMddHHmmss
	 */
	public static String date2String(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(date);
	}
	
	public static String getTimeStamp() {
		return String.valueOf(System.currentTimeMillis() / 1000);
	}
}
