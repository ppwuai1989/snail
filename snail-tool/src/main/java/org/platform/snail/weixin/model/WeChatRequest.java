package org.platform.snail.weixin.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class WeChatRequest implements Serializable {
	private static final long serialVersionUID = 1L;

	private String getCode = "https://open.weixin.qq.com/connect/oauth2/authorize?" + "appid=wxe96bbd4187ab4e71"
			+ "&redirect_uri=http://paopao.viphk.ngrok.org/portal/weChat/weChatLogin.do" + "&response_type=code"
			+ "&scope=snsapi_userinfo" + "&state=123" + "#wechat_redirect";

	public String getOAuthInfo() {
		String url = accessTokenUrl + "?appid=" + appId + "&secret=" + appSecret + "&code=" + code + "&grant_type="
				+ grantType;
		url = url.trim();
		return url;
	}

	// "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";

	public List<NameValuePair> getParamsForUser(OAuthInfo oAuthInfo) {
		List<NameValuePair> list = new ArrayList();
		list.add(new BasicNameValuePair("access_token", oAuthInfo.getAccess_token()));
		list.add(new BasicNameValuePair("openid", oAuthInfo.getOpenid()));
		list.add(new BasicNameValuePair("lang", "zh_CN"));
		return list;
	}

	private String accessTokenUrl;

	private String userInfoUrl;

	private String code;

	private String appId;

	private String loginRedirectUri;

	private String responseType;

	private String scope;

	private String state;

	private String appSecret;

	private String weChatRedirect = "#wechat_redirect";

	private String grantType;

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getLoginRedirectUri() {
		return loginRedirectUri;
	}

	public void setLoginRedirectUri(String loginRedirectUri) {
		this.loginRedirectUri = loginRedirectUri;
	}

	public String getResponseType() {
		return responseType;
	}

	public void setResponseType(String responseType) {
		this.responseType = responseType;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getWeChatRedirect() {
		return weChatRedirect;
	}

	public void setWeChatRedirect(String weChatRedirect) {
		this.weChatRedirect = weChatRedirect;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getGrantType() {
		return grantType;
	}

	public void setGrantType(String grantType) {
		this.grantType = grantType;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}

	public String getAccessTokenUrl() {
		return accessTokenUrl;
	}

	public void setAccessTokenUrl(String accessTokenUrl) {
		this.accessTokenUrl = accessTokenUrl;
	}

	public String getUserInfoUrl() {
		return userInfoUrl;
	}

	public void setUserInfoUrl(String userInfoUrl) {
		this.userInfoUrl = userInfoUrl;
	}

}
