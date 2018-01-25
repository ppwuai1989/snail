package org.platform.snail.portal.vo;

import org.platform.snail.extra.CustomDateSerializer;
import org.platform.snail.portal.model.GameRecords;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class GameRecordsVo extends GameRecords {
	
	@JsonSerialize(using = CustomDateSerializer.class)
	private String startDate;
	@JsonSerialize(using = CustomDateSerializer.class)
	private String endDate;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
