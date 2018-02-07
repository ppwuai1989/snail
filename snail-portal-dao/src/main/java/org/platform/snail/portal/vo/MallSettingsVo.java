package org.platform.snail.portal.vo;

import org.platform.snail.portal.model.MallSettings;

public class MallSettingsVo extends MallSettings {

	private String rate;

	private String realAmount;

	public String getRealAmount() {
		return realAmount;
	}

	public void setRealAmount(String realAmount) {
		this.realAmount = realAmount;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

}
