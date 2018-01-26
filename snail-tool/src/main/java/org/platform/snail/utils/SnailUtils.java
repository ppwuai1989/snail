package org.platform.snail.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.CharUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SnailUtils {

	public Logger logger = LogManager.getLogger(this.getClass());
	/**
	 * 一次性判断多个或单个对象为空。
	 * 
	 * @param objects
	 * @author ztt
	 * @return 只要有一个元素为Blank，则返回true
	 */
	public static boolean isBlank(Object... objects) {
		Boolean result = false;
		for (Object object : objects) {
			if (null == object || "".equals(object.toString().trim()) || "null".equals(object.toString().trim())) {
				result = true;
				break;
			}
		}
		return result;
	}

	/**
	 * 一次性判断多个或单个对象不为空。
	 * 
	 * @param objects
	 * @author ztt
	 * @return 只要有一个元素不为Blank，则返回true
	 */
	public static boolean isNotBlank(Object... objects) {
		return !isBlank(objects);
	}

	public static boolean isBlank(String... objects) {
		Object[] object = objects;
		return isBlank(object);
	}

	public static boolean isNotBlank(String... objects) {
		Object[] object = objects;
		return !isBlank(object);
	}

	public static boolean isBlank(String str) {
		Object object = str;
		return isBlank(object);
	}

	public static boolean isNotBlank(String str) {
		Object object = str;
		return !isBlank(object);
	}


	public static double parseDouble(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return Double.parseDouble(arg);
		} catch (Exception e) {

			return 0;
		}

	}

	public static Double getDouble(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return new Double(Double.parseDouble(arg));
		} catch (Exception e) {

			return new Double(0);
		}

	}

	public static double parseDouble(int arg) {

		try {
			return (double) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public static double parseDouble(float arg) {
		try {
			return (double) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public double parseDouble(long arg) {
		try {
			return (double) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public static long parseLong(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return Long.parseLong(arg);
		} catch (Exception e) {
			return 0;
		}

	}

	public static Long getLong(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return new Long(Long.parseLong(arg));
		} catch (Exception e) {
			return new Long(0);
		}

	}

	public static long parseLong(int arg) {
		try {
			return (long) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public static long parseLong(float arg) {
		try {
			return (long) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public long parseLong(double arg) {
		try {
			return (long) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public static int parseInt(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return Integer.parseInt(arg);
		} catch (Exception e) {
			return 0;
		}

	}

	public static int parseInt(long arg) {
		try {
			return (int) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public static int parseInt(float arg) {
		try {
			return (int) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public int parseInt(double arg) {
		try {
			return (int) arg;
		} catch (Exception e) {
			return 0;
		}

	}

	public static float parseFloat(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return Float.parseFloat(arg);
		} catch (Exception e) {
			return 0;
		}

	}

	public static Float getFloat(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return new Float(Float.parseFloat(arg));
		} catch (Exception e) {
			return new Float(0);
		}

	}

	public static Boolean parseBoolean(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return Boolean.valueOf(arg);
		} catch (Exception e) {
			return new Boolean(false);
		}

	}

	public static boolean parseBooleanValue(String arg) {
		if (arg != null) {
			arg = arg.trim();
		}
		try {
			return Boolean.valueOf(arg).booleanValue();
		} catch (Exception e) {
			return false;
		}

	}

	public static Long[] parseLong(String args[]) {
		if (args != null) {
			Long temp[] = new Long[args.length];
			for (int i = 0; i < args.length; i++) {
				try {
					temp[i] = new Long(Long.parseLong(args[i]));
				} catch (Exception e) {
					temp[i] = new Long(0);
				}
			}
			return temp;
		} else {
			return new Long[] { new Long(0) };
		}
	}

	public static double[] parseDouble(String args[]) {
		if (args != null) {
			double temp[] = new double[args.length];
			for (int i = 0; i < args.length; i++) {
				try {
					temp[i] = Double.parseDouble(args[i]);
				} catch (Exception e) {
					temp[i] = Double.parseDouble("0");
				}
			}
			return temp;
		} else {
			return new double[] { Double.parseDouble("0") };
		}
	}

	public static Date parseDate(String dateStr) {
		try {
			if (dateStr.length() > 10) {
				dateStr.substring(0, 10);
			}
			return (java.util.Date) java.sql.Date.valueOf(dateStr);
		} catch (Exception e) {
			return new java.util.Date();
		}
	}

	public static Date parseDate(String dateStr, String arg0) {
		try {
			if (dateStr.length() > 10) {
				dateStr.substring(0, 10);
			}
			return (java.util.Date) java.sql.Date.valueOf(dateStr);
		} catch (Exception e) {
			return new java.util.Date();
		}
	}

	public static String parseDate(Date date) {
		SimpleDateFormat sdf = null;
		try {
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	public static String parseDate(Date date, String arg0) {
		SimpleDateFormat sdf = null;
		try {
			sdf = new SimpleDateFormat(arg0);
			return sdf.format(date);
		} catch (Exception e) {
			return "";
		}
	}

	public static String getSqlInString(String[] obj) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < obj.length; i++) {
			sb.append("'");
			sb.append(obj[i]);
			sb.append("'");
			if (i != (obj.length - 1)) {
				sb.append(",");
			}
		}
		return sb.toString();
	}

	public static String getSqlInString(Long[] obj) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < obj.length; i++) {
			// sb.append("'");
			sb.append(obj[i]);
			// sb.append("'");
			if (i != (obj.length - 1)) {
				sb.append(",");
			}
		}
		return sb.toString();
	}

	public static String numToUpper(int num) {
		String u[] = { "零", "一", "二", "三", "四", "五", "六", "七", "八", "九" };
		char[] str = String.valueOf(num).toCharArray();
		String rstr = "";
		for (int i = 0; i < str.length; i++) {
			rstr = rstr + u[Integer.parseInt(str[i] + "")];
		}
		return rstr;
	}

	public String toStrings(String[] params_temp) {
		String param = null;
		try {
			param = params_temp[0];
			for (int i = 1; i < params_temp.length; i++) {
				param += "," + params_temp[i];
			}
		} catch (Exception e) {
			param = "";
		}
		return (param);
	}

	public String traceTextArea(String msg) {
		String message = new String();
		StringTokenizer stringTokenizer = new StringTokenizer(msg, "\n");
		while (stringTokenizer.hasMoreTokens()) {
			message = message + stringTokenizer.nextToken() + "<br>";
		}
		return message;
	}

	public static boolean isBlankString(String str) {
		boolean struts;
		struts = false;
		if (str == null) {
			struts = true;
		}
		if (str != null) {
			if (str.trim().equals("")) {
				struts = true;
			}
		}
		return (struts);
	}

	public static boolean isNotBlankString(String str) {
		boolean struts;
		struts = true;
		if (str == null) {
			struts = false;
		}
		if (str != null) {
			if (str.trim().equals("")) {
				struts = false;
			}
		}
		return (struts);
	}

	public static boolean isDouble(String str) {
		try {
			Double.parseDouble(str);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	public static boolean isFloat(String str) {
		try {
			Float.parseFloat(str);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	public static boolean isValidEmail(String paramStr) {
		String email = paramStr;
		String check = "\\w+@(\\w+.)+[a-z]{2,3}";
		check = "[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+\\.[a-z]+(\\.[a-z]+)?";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(email);
		boolean isMatched = matcher.matches();
		return (isMatched);
	}

	public static boolean isValidParam(String paramStr) {
		String email = paramStr;
		String check = "^([a-z0-9A-Z]+[-|\\.]?)";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(email);
		boolean isMatched = matcher.matches();
		return (isMatched);
	}

	public static boolean isValidTel(String paramStr) {
		String str = paramStr;
		String check = "([0-9]{3,4})-([0-9]{7,8})";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return (isMatched);
	}

	public static boolean isValidFigures(String paramStr) {
		String str = paramStr;
		String check = "[0-9]{1,50}";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return (isMatched);
	}

	public static boolean isValidQQ(String paramStr) {
		String str = paramStr;
		String check = "[0-9]{4,11}";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return (isMatched);
	}

	public static boolean isValidMobile(String paramStr) {
		String str = paramStr;
		String check = "^0?1[3,5][0-9]\\d{8}$";
		check = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return (isMatched);
	}

	public static boolean isValidMinLength(String paramStr, int paramMin) {
		String str = paramStr;
		int min = paramMin;
		boolean isValidMinLength;
		isValidMinLength = false;
		if (str != null) {
			if (str.length() >= min) {
				isValidMinLength = true;
			}
		}
		return (isValidMinLength);
	}

	public static boolean isValidMaxLength(String paramStr, int paramMax) {
		String str = paramStr;
		int max = paramMax;
		boolean isValidMaxLength;
		isValidMaxLength = false;
		if (str != null) {
			if (str.length() <= max) {
				isValidMaxLength = true;
			}
		}
		return (isValidMaxLength);
	}

	public static boolean isValidUrl(String paramStr, String[] endStr) {
		paramStr = paramStr.toLowerCase();
		if (paramStr.indexOf("http://") != 0) {
			return false;
		}
		for (int i = 0; i < endStr.length; i++) {

			if (paramStr.endsWith(endStr[i])) {
				return true;
			}
		}
		return false;
	}

	public static boolean isValidDate(String dateStr) {
		try {
			if (dateStr.length() > 10) {
				dateStr.substring(0, 10);
			}
			java.sql.Date.valueOf(dateStr);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static String getMd5(String plainText) {
		StringBuffer buf = new StringBuffer("");
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[] = md.digest();

			int i;

			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return buf.toString();
	}

	/**
	 * 将首字母大字
	 * 
	 * @param str
	 * @return 转化后后字符
	 */
	public static String firstToUpper(String str) {
		char[] chs = str.toCharArray();
		chs[0] = Character.toUpperCase(chs[0]);
		return new String(chs);
	}

	/**
	 * 首字母小字
	 * 
	 * @param str
	 * @return 转化后后字符
	 */
	public static String firstToLower(String str) {
		char[] chs = str.toCharArray();
		chs[0] = Character.toLowerCase(chs[0]);
		return new String(chs);
	}

	public static String getJavaName(String column) {
		if (column == null) {
			return "";
		}
		if (!column.contains("_")) {
			return column.toLowerCase();
		}
		String[] names = column.toLowerCase().split("_");
		StringBuilder sb = new StringBuilder(names[0]);
		for (int i = 1; i < names.length; i++) {
			sb.append(SnailUtils.firstToUpper(names[i]));
		}
		return sb.toString();
	}

	public static boolean isValidIdCard(String idCard) {
		if (idCard.length() == 15 || idCard.length() == 18) {
			String temp = null;
			if (idCard.length() == 15) {
				temp = "19" + idCard.substring(6, 6 + 6);
			} else {
				temp = idCard.substring(6, 6 + 8);
			}
			String dateStr = temp.substring(0, 4) + "-" + temp.substring(4, 6) + "-" + temp.substring(6, 8);
			SimpleDateFormat sdf = null;
			try {
				sdf = new SimpleDateFormat("yyyy-MM-dd");
				return true;
			} catch (Exception e) {
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * 对象属性转换为字段 例如：userName to user_name
	 * 
	 * @param property
	 *            字段名
	 * @return
	 */
	public static String propertyToField(String property) {
		if (null == property) {
			return "";
		}
		char[] chars = property.toCharArray();
		StringBuffer sb = new StringBuffer();
		for (char c : chars) {
			if (CharUtils.isAsciiAlphaUpper(c)) {
				sb.append("_" + StringUtils.lowerCase(CharUtils.toString(c)));
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

	/**
	 * 字段转换成对象属性 例如：user_name to userName
	 * 
	 * @param field
	 * @return
	 */
	public static String fieldToProperty(String field) {
		if (null == field) {
			return "";
		}
		char[] chars = field.toCharArray();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < chars.length; i++) {
			char c = chars[i];
			if (c == '_') {
				int j = i + 1;
				if (j < chars.length) {
					sb.append(StringUtils.upperCase(CharUtils.toString(chars[j])));
					i++;
				}
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

	public static String genRandomNum(int pwd_len) {
		// 35是因为数组是从0开始的，26个字母+10个数字
		final int maxNum = 36;
		int i; // 生成的随机数
		int count = 0; // 生成的密码的长度
		char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
				't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

		StringBuffer pwd = new StringBuffer("");
		Random r = new Random();
		while (count < pwd_len) {
			// 生成随机数，取绝对值，防止生成负数，

			i = Math.abs(r.nextInt(maxNum)); // 生成的数最大为36-1

			if (i >= 0 && i < str.length) {
				pwd.append(str[i]);
				count++;
			}
		}

		return pwd.toString();
	}

	public static String replaceByRegex(String expression, String regex, Map<String, Object> valueMap) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(expression);
		String paramKey;
		while (m.find()) {
			paramKey = m.group(0);
			paramKey = paramKey.substring(2, paramKey.length() - 1);
			Object paramValue = valueMap.get(paramKey);
			expression = m.replaceFirst(String.valueOf(paramValue));
			m = p.matcher(expression);
		}
		return expression;
	}

	public static void main(String args[]) {
		// boolean rs = SnailUtils.isValidEmail("364325668@qq.com");
		String rs = numToUpper(20150405);
		System.out.println(rs);
	}

}
