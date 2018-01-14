package org.platform.snail.beans;

import java.io.Serializable;

public class Leader implements Serializable {
	private static final long serialVersionUID = 1L;
	private String leaderId;
	private String leaderName;
	private String departmentName;
	private String departmentLevel;

	public String getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDepartmentLevel() {
		return departmentLevel;
	}

	public void setDepartmentLevel(String departmentLevel) {
		this.departmentLevel = departmentLevel;
	}

	@Override
	public String toString() {
		return "Leader [leaderId=" + leaderId + ", leaderName=" + leaderName + ", departmentName=" + departmentName
				+ ", departmentLevel=" + departmentLevel + "]";
	}

}
