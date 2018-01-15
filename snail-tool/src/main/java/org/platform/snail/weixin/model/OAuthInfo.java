package org.platform.snail.weixin.model;

import java.io.Serializable;

public class OAuthInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String accessToke;
	private String expiresIn;

	private String refreshToken;

	private String openId;

	private String scope;

	public String getAccessToke() {
		return accessToke;
	}

	public void setAccessToke(String accessToke) {
		this.accessToke = accessToke;
	}

	public String getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(String expiresIn) {
		this.expiresIn = expiresIn;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}
}
