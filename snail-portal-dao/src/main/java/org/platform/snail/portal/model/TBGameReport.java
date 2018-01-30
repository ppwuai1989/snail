package org.platform.snail.portal.model;

import java.io.Serializable;

public class TBGameReport implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String name;
	
	private String playTimes;
	
	private String bankerTimes;
	
	private String chuTimes;
	
	private String chuNum;
	
	private String tianTimes;
	
	private String tianNum;
	
	private String moTimes;
	
	private String moNum;
	
	private String resultNum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlayTimes() {
		return playTimes;
	}

	public void setPlayTimes(String playTimes) {
		this.playTimes = playTimes;
	}

	public String getBankerTimes() {
		return bankerTimes;
	}

	public void setBankerTimes(String bankerTimes) {
		this.bankerTimes = bankerTimes;
	}

	public String getChuTimes() {
		return chuTimes;
	}

	public void setChuTimes(String chuTimes) {
		this.chuTimes = chuTimes;
	}

	public String getChuNum() {
		return chuNum;
	}

	public void setChuNum(String chuNum) {
		this.chuNum = chuNum;
	}

	public String getTianTimes() {
		return tianTimes;
	}

	public void setTianTimes(String tianTimes) {
		this.tianTimes = tianTimes;
	}

	public String getTianNum() {
		return tianNum;
	}

	public void setTianNum(String tianNum) {
		this.tianNum = tianNum;
	}

	public String getMoTimes() {
		return moTimes;
	}

	public void setMoTimes(String moTimes) {
		this.moTimes = moTimes;
	}

	public String getMoNum() {
		return moNum;
	}

	public void setMoNum(String moNum) {
		this.moNum = moNum;
	}

	public String getResultNum() {
		return resultNum;
	}

	public void setResultNum(String resultNum) {
		this.resultNum = resultNum;
	}

	@Override
	public String toString() {
		return "TBGameReport [id=" + id + ", name=" + name + ", playTimes=" + playTimes + ", bankerTimes=" + bankerTimes
				+ ", chuTimes=" + chuTimes + ", chuNum=" + chuNum + ", tianTimes=" + tianTimes + ", tianNum=" + tianNum
				+ ", moTimes=" + moTimes + ", moNum=" + moNum + ", resultNum=" + resultNum + "]";
	}

}
