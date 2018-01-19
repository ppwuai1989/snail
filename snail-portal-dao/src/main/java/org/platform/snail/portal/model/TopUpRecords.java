package org.platform.snail.portal.model;

import java.io.Serializable;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class TopUpRecords implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

	private String way;

	private String cost;

	private String coins;

	private String gems;

	private String pkCard;

	private String userId;

	private String agentId;
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}


	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "TopUpRecords [id=" + id + ", way=" + way + ", cost=" + cost + ", coins=" + coins + ", gems=" + gems
				+ ", pkCard=" + pkCard + ", userId=" + userId + ", agentId=" + agentId + ", createTime="
				+ createTime + "]";
	}

}
