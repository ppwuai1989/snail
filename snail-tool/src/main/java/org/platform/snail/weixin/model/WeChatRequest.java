package org.platform.snail.weixin.model;

import java.io.Serializable;

public class WeChatRequest implements Serializable {
	private static final long serialVersionUID = 1L;

	private String getCode = "https://open.weixin.qq.com/connect/oauth2/authorize?" + "appid=wxe96bbd4187ab4e71"
			+ "&redirect_uri=http://paopao.viphk.ngrok.org/portal/weChat/weChatLogin.do" + "&response_type=code"
			+ "&scope=snsapi_userinfo" + "&state=123" + "#wechat_redirect";

	public String getOAuthInfo() {		
		String url = loginDomain + "?appid=" + appId + "&secret=" + appSecret + "&code=" + code + "&grant_type="
				+ grantType;
		return url;
	}

	private String getUserInfo = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID";

	private String loginDomain;

	private String apiDomain;

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

	public String getLoginDomain() {
		return loginDomain;
	}

	public void setLoginDomain(String loginDomain) {
		this.loginDomain = loginDomain;
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

	public String getApiDomain() {
		return apiDomain;
	}

	public void setApiDomain(String apiDomain) {
		this.apiDomain = apiDomain;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}

}
