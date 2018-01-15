package org.platform.snail.weixin.model;

import java.io.Serializable;

public class UserInfo implements Serializable {

	// "openid": "oLVPpjqs9BhvzwPj5A-vTYAX3GLc",
	// "nickname": "刺猬宝宝",
	// "sex": 1,
	// "language": "简体中文",
	// "city": "深圳",
	// "province": "广东",
	// "country": "中国",
	// "headimgurl":
	// "http://wx.qlogo.cn/mmopen/utpKYf69VAbCRDRlbUsPsdQN38DoibCkrU6SAMCSNx558eTaLVM8PyM6jlEGzOrH67hyZibIZPXu4BK1XNWzSXB3Cs4qpBBg18/0",
	// "privilege": []

	private static final long serialVersionUID = 1L;

	private String openId;

	private String nickName;

	// 与系统中不同，1--男性，2--女性，0--未知
	private String sex;

	private String language;

	private String city;

	private String province;

	private String country;

	private String headImgUrl;

	private String privilege;

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHeadImgUrl() {
		return headImgUrl;
	}

	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

}
