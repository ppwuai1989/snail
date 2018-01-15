package org.platform.snail.utils;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

public class HttpClientUtils {

	public static String doGet(String url) {
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpGet httpGet = new HttpGet(url);
		String result = "";
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(httpGet);
			// 4. 获取响应实体
			HttpEntity entity = response.getEntity();
			// 5. 处理响应实体
			if (entity != null) {
				result = EntityUtils.toString(entity);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 6. 释放资源
			try {
				response.close();
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
