package org.platform.snail.portal.model;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Agent implements java.io.Serializable {
	
	// 游戏相关
	// t_users.agent_id agentId---代理编号对应
	// t_users.name--游戏昵称
	// t_users.sex--游戏性别
	// t_users.coins--金币
	// t_users.gems--房卡
	// t_users.pk_card--比武卡
	// t_users.wechat_id--微信号 t_users.mobile--手机号
	// 后台相关
	// users.account---管理平台登陆账号
	// users.status---账号状态0--禁用，1--启用，用来判断是否可以登录管理平台
	// users.last_login_time--最后登录平台时间
	// users.create_time--平台账号创建时间	

	private static final long serialVersionUID = 1L;

	private String agentId;

	private String name;

	private String sex;

	private String coins;

	private String gems;

	private String pkCard;

	private String weChatId;

	private String mobile;

	private String account;

	private String status;
	@JsonSerialize(using=CustomDateSerializer.class)
	private String lastLoginTime;
	@JsonSerialize(using=CustomDateSerializer.class)
	private String createTime;
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
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Agent [agentId=" + agentId + ", name=" + name + ", sex=" + sex + ", coins=" + coins + ", gems=" + gems
				+ ", pkCard=" + pkCard + ", weChatId=" + weChatId + ", mobile=" + mobile + ", account=" + account
				+ ", status=" + status + ", lastLoginTime=" + lastLoginTime + ", createTime=" + createTime + "]";
	}
	

}
