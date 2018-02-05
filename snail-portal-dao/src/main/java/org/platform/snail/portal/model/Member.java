package org.platform.snail.portal.model;

import java.io.Serializable;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;
import org.platform.snail.utils.SnailUtils;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Member implements Serializable {

	private static final long serialVersionUID = 1L;

	private String userId;
	private String account;
	private String password;
	private String name;
	private String sex;
	private String headImg;
	private String level;
	private String experience;
	private String coins;
	private String gems;
	private String pkCard;
	private String score;//新增score
	private String roomId;
	private String gameType;
	private String history;
	private String weChatId;
	private String province;
	private String language;
	private String city;
	private String country;
	private String unionId;
	private String privilege;
	private String introducer;
	private String mobile;
	private String isAgent;
	private String agentId;
	private String agentLevel;
	private String parentAgentId;

	@JsonSerialize(using = CustomDateSerializer.class)
	private Date lastLoginTime;

	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	private String status;
	
	private String isOperator;

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

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	public String getIntroducer() {
		return introducer;
	}

	public void setIntroducer(String introducer) {
		this.introducer = introducer;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getHeadImg() {		
		return headImg;
	}

	public void setHeadImg(String headImg) {
		if (SnailUtils.isBlankString(headImg)) {
			//this.headImg = "https://open.weixin.qq.com/zh_CN/htmledition/res/assets/res-design-download/icon32_appwx_logo.png";
		} else {
			this.headImg = headImg;
		}
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience == "" ? null : experience;
	}

	public String getCoins() {
		return coins;
	}

	public void setCoins(String coins) {
		this.coins = coins == "" ? null : coins;
	}

	public String getGems() {
		return gems;
	}

	public void setGems(String gems) {
		this.gems = gems == "" ? null : gems;
	}

	public String getPkCard() {
		return pkCard;
	}

	public void setPkCard(String pkCard) {
		this.pkCard = pkCard == "" ? null : pkCard;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getGameType() {
		return gameType;
	}

	public void setGameType(String gameType) {
		this.gameType = gameType;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
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

	public String getIsAgent() {
		return isAgent;
	}

	public void setIsAgent(String isAgent) {
		this.isAgent = isAgent;
	}

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId == "" ? null : agentId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreatTime(Date createTime) {
		this.createTime = createTime;
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

	public String getAgentLevel() {
		return agentLevel;
	}

	public void setAgentLevel(String agentLevel) {
		this.agentLevel = agentLevel;
	}

	public String getParentAgentId() {
		return parentAgentId;
	}

	public void setParentAgentId(String parentAgentId) {
		this.parentAgentId = parentAgentId == "" ? null : parentAgentId;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", sex=" + sex + ", headImg=" + headImg + ", level=" + level + ", experience=" + experience
				+ ", coins=" + coins + ", gems=" + gems + ", pkCard=" + pkCard + ", roomId=" + roomId + ", gameType="
				+ gameType + ", history=" + history + ", weChatId=" + weChatId + ", province=" + province + ", city="
				+ city + ", country=" + country + ", unionId=" + unionId + ", privilege=" + privilege + ", introducer="
				+ introducer + ", mobile=" + mobile + ", isAgent=" + isAgent + ", agentId=" + agentId + ", agentLevel="
				+ agentLevel + ", parent_agent_id=" + parentAgentId + ", lastLoginTime=" + lastLoginTime
				+ ", createTime=" + createTime + ", status=" + status + "]";
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getIsOperator() {
		return isOperator;
	}

	public void setIsOperator(String isOperator) {
		this.isOperator = isOperator;
	}

}
