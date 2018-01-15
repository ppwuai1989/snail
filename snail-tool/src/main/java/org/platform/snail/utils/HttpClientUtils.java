package org.platform.snail.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import net.sf.json.JSONObject;

public class HttpClientUtils {

	public static JSONObject doGet(String url) {
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpGet httpGet = new HttpGet(url);
		JSONObject result = null;
		CloseableHttpResponse response = null;
		try {
			response = httpClient.execute(httpGet);

			HttpEntity entity = response.getEntity();

			if (entity != null) {
				result = JSONObject.fromObject(EntityUtils.toString(entity));
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

			try {
				response.close();
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static JSONObject doPost(String url, List<NameValuePair> params) {
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(url);
		JSONObject result = null;
		try {
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params);
			post.setEntity(entity);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			CloseableHttpResponse response = httpClient.execute(post);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				result = JSONObject.fromObject(EntityUtils.toString(entity));
			}
			response.close();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

			try {
				httpClient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
