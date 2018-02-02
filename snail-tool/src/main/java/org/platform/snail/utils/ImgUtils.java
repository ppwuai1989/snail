package org.platform.snail.utils;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.io.IOUtils;
import org.apache.commons.net.util.Base64;

public class ImgUtils {

	/**
	 * 跨域访问图片 获取base64图片字符串
	 * 
	 * @param url-图片地址
	 *
	 */
	public static String getBase64ImgString(String url) {
		try {
			String imgString = "";
			URL imgUrl = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) imgUrl.openConnection();
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.connect();
			conn.getResponseCode();
			if (conn.getResponseCode() == 200) {
				InputStream is = conn.getInputStream();
				imgString = "data:image/png;base64," + Base64.encodeBase64String(IOUtils.toByteArray(is));			
			}
			return imgString;
		} catch (Exception e) {
			return "";
		}
	}

}
