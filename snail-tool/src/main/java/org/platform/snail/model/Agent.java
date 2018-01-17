package org.platform.snail.model;

import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Agent implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String agentId;

	private String parentAgentId;

	private String agentLevel;

	private String name;

	private String sex;

	private String coins;

	private String gems;

	private String pkCard;

	private String weChatId;

	private String province;

	private String city;

	private String country;

	private String unionId;

	private String mobile;

	private String account;

	private String status;
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date lastLoginTime;
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUnionId() {
		return unionId;
	}

	public void setUnionId(String unionId) {
		this.unionId = unionId;
	}

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCoins() {
		return coins;
	}

	public void setCoins(String coins) {
		this.coins = coins;
	}

	public String getGems() {
		return gems;
	}

	public void setGems(String gems) {
		this.gems = gems;
	}

	public String getPkCard() {
		return pkCard;
	}

	public void setPkCard(String pkCard) {
		this.pkCard = pkCard;
	}

	public String getWeChatId() {
		return weChatId;
	}

	public void setWeChatId(String weChatId) {
		this.weChatId = weChatId;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getParentAgentId() {
		return parentAgentId;
	}

	public void setParentAgentId(String parentAgentId) {
		this.parentAgentId = parentAgentId;
	}

	public String getAgentLevel() {
		return agentLevel;
	}

	public void setAgentLevel(String agentLevel) {
		this.agentLevel = agentLevel;
	}

	@Override
	public String toString() {
		return "Agent [agentId=" + agentId + ", parentAgentId=" + parentAgentId + ", agentLevel=" + agentLevel
				+ ", name=" + name + ", sex=" + sex + ", coins=" + coins + ", gems=" + gems + ", pkCard=" + pkCard
				+ ", weChatId=" + weChatId + ", mobile=" + mobile + ", account=" + account + ", status=" + status
				+ ", lastLoginTime=" + lastLoginTime + ", createTime=" + createTime + "]";
	}

}
