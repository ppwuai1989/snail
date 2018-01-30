package org.platform.snail.portal.model;

import java.io.Serializable;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class TBCoinsGameRecords implements Serializable {
	

	private static final long serialVersionUID = 1L;	

	
	private String id;
	
	private String name;
	
	private String gameIndex;
	
	private String round;
	
	private String isBanker;
	
	private String baseInfo;
	
	private String chu;
	
	private String tian;
	
	private String mo;
	
	private String snapshots;
	
	private String coins;
	
	private String result;
	
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGameIndex() {
		return gameIndex;
	}

	public void setGameIndex(String gameIndex) {
		this.gameIndex = gameIndex;
	}

	public String getRound() {
		return round;
	}

	public void setRound(String round) {
		this.round = round;
	}

	public String getIsBanker() {
		return isBanker;
	}

	public void setIsBanker(String isBanker) {
		this.isBanker = isBanker;
	}

	public String getBaseInfo() {
		return baseInfo;
	}

	public void setBaseInfo(String baseInfo) {
		this.baseInfo = baseInfo;
	}

	public String getChu() {
		return chu;
	}

	public void setChu(String chu) {
		this.chu = chu;
	}

	public String getTian() {
		return tian;
	}

	public void setTian(String tian) {
		this.tian = tian;
	}

	public String getMo() {
		return mo;
	}

	public void setMo(String mo) {
		this.mo = mo;
	}

	public String getSnapshots() {
		return snapshots;
	}

	public void setSnapshots(String snapshots) {
		this.snapshots = snapshots;
	}

	public String getCoins() {
		return coins;
	}

	public void setCoins(String coins) {
		this.coins = coins;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "GameRecords [id=" + id + ", gameIndex=" + gameIndex + ", round=" + round
				+ ", isBanker=" + isBanker + ", baseInfo=" + baseInfo + ", chu=" + chu + ", tian=" + tian + ", mo=" + mo
				+ ", snapshots=" + snapshots + ", coins=" + coins + ", result=" + result + ", createTime=" + createTime
				+ "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
