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

	private String openid;

	private String nickname;

	// 1--男性，2--女性，0--未知
	private String sex;

	private String language;

	private String city;

	private String province;

	private String country;

	private String headimgurl;

	private String privilege;

	private String unionid;

	private Long errcode;

	private String errmsg;

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	/**
	 * @param sex
	 *            对应微信接口转换
	 */
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

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	public Long getErrcode() {
		return errcode;
	}

	public void setErrcode(Long errcode) {
		this.errcode = errcode;
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}

	public String getUnionid() {
		return unionid;
	}

	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}

	@Override
	public String toString() {
		return "UserInfo [openid=" + openid + ", nickname=" + nickname + ", sex=" + sex + ", language=" + language
				+ ", city=" + city + ", province=" + province + ", country=" + country + ", headimgurl=" + headimgurl
				+ ", privilege=" + privilege + ", unionid=" + unionid + ", errcode=" + errcode + ", errmsg=" + errmsg
				+ "]";
	}

}
