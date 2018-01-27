package org.platform.snail.portal.model;

import java.io.Serializable;

public class GameControl implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	//0--麻将 1--普通房推饼2---万人房推饼
	private String gameType;
	
	private String robotBankerRate;
	
	private String playerBankerRate;
	
	private String areaWarningLine;
	
	private String areaOverlineChangeRate;
	
	private String takeBankerRate;
	
	private String takePlayerRate;
	
	private String sysWinUpperLimit;
	
	private String sysLoseLowerLimit;
	
	private String sysStatusSwitchTime;
	
	private String status;

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

	public String getRobotBankerRate() {
		return robotBankerRate;
	}

	public void setRobotBankerRate(String robotBankerRate) {
		this.robotBankerRate = robotBankerRate;
	}

	public String getPlayerBankerRate() {
		return playerBankerRate;
	}

	public void setPlayerBankerRate(String playerBankerRate) {
		this.playerBankerRate = playerBankerRate;
	}

	public String getAreaWarningLine() {
		return areaWarningLine;
	}

	public void setAreaWarningLine(String areaWarningLine) {
		this.areaWarningLine = areaWarningLine;
	}

	

	public String getAreaOverlineChangeRate() {
		return areaOverlineChangeRate;
	}

	public void setAreaOverlineChangeRate(String areaOverlineChangeRate) {
		this.areaOverlineChangeRate = areaOverlineChangeRate;
	}

	public String getTakeBankerRate() {
		return takeBankerRate;
	}

	public void setTakeBankerRate(String takeBankerRate) {
		this.takeBankerRate = takeBankerRate;
	}

	public String getTakePlayerRate() {
		return takePlayerRate;
	}

	public void setTakePlayerRate(String takePlayerRate) {
		this.takePlayerRate = takePlayerRate;
	}

	public String getSysWinUpperLimit() {
		return sysWinUpperLimit;
	}

	public void setSysWinUpperLimit(String sysWinUpperLimit) {
		this.sysWinUpperLimit = sysWinUpperLimit;
	}

	public String getSysLoseLowerLimit() {
		return sysLoseLowerLimit;
	}

	public void setSysLoseLowerLimit(String sysLoseLowerLimit) {
		this.sysLoseLowerLimit = sysLoseLowerLimit;
	}

	public String getSysStatusSwitchTime() {
		return sysStatusSwitchTime;
	}

	public void setSysStatusSwitchTime(String sysStatusSwitchTime) {
		this.sysStatusSwitchTime = sysStatusSwitchTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "GameControl [id=" + id + ", gameType=" + gameType + ", robotBankerRate=" + robotBankerRate
				+ ", playerBankerRate=" + playerBankerRate + ", areaWarningLine=" + areaWarningLine
				+ ", areaOverlineChangeRate=" + areaOverlineChangeRate + ", takeBankerRate=" + takeBankerRate
				+ ", takePlayerRate=" + takePlayerRate + ", sysWinUpperLimit=" + sysWinUpperLimit
				+ ", sysLoseLowerLimit=" + sysLoseLowerLimit + ", sysStatusSwitchTime=" + sysStatusSwitchTime
				+ ", status=" + status + "]";
	}

}
