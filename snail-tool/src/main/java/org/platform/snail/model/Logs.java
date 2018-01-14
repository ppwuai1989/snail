package org.platform.snail.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Logs implements Serializable {

	private static final long serialVersionUID = 1L;
	private BigDecimal id;

	private String log;

	private String userId;

	private String userName;
	
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	private String objectValue;

	private String old;

	private String news;

	private String name;

	private String ip;
	
	private String logType;

	public BigDecimal getId() {
		return id;
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId == null ? null : userId.trim();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getObjectValue() {
		return objectValue;
	}

	public void setObjectValue(String objectValue) {
		this.objectValue = objectValue == null ? null : objectValue.trim();
	}

	public String getOld() {
		return old;
	}

	public void setOld(String old) {
		this.old = old == null ? null : old.trim();
	}

	public String getNews() {
		return news;
	}

	public void setNews(String news) {
		this.news = news == null ? null : news.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getLogType() {
		return logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}
	@Override
	public String toString() {
		return "Logs [id=" + id + ", log=" + log + ", userId=" + userId + ", userName=" + userName + ", createTime="
				+ createTime + ", objectValue=" + objectValue + ", old=" + old + ", news=" + news + ", name=" + name
				+ ", ip=" + ip + ", logType=" + logType + "]";
	}

	

}
