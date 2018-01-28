package org.platform.snail.portal.model;

import java.io.Serializable;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class SystemState implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;

	private String gameType;

	private String income;

	private String state;

	@JsonSerialize(using = CustomDateSerializer.class)
	private Date updateTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGameType() {
		return gameType;
	}

	public void setGameType(String gameType) {
		this.gameType = gameType;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "SystemState [id=" + id + ", gameType=" + gameType + ", income=" + income + ", state=" + state
				+ ", updateTime=" + updateTime + "]";
	}

}
