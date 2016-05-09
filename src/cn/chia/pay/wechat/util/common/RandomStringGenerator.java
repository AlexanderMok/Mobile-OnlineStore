package cn.chia.pay.wechat.util.common;

import java.util.Random;

/**
 * @author 莫庆来, 2016年4月14日 上午9:11:05
 * @description generate random string for WeChat signature
 */
public class RandomStringGenerator {

	private static final Integer LENGTH = 32;
	private static final String CHARACTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	/**
	 * 
	 * @return 默认长度的随机字符串,32字节
	 */
	public static String generateString() {
		return generateString(LENGTH);
	}

	/**
	 * 
	 * @param length 指定字符串长度，不长于32
	 * @return 一定长度的随机字符串；若长度超出32字节，返回默认长度随机字符串
	 */
	public static String generateString(Integer length) {

		if (length > 32) {
			generateString();
		}

		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(CHARACTERS.length());
			sb.append(CHARACTERS.charAt(number));
		}
		return sb.toString();
	}

}
