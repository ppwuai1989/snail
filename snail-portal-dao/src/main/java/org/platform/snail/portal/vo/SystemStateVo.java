package org.platform.snail.portal.vo;

import org.platform.snail.portal.model.SystemState;

public class SystemStateVo extends SystemState {
	
	private String nextSwitchTime;

	public String getNextSwitchTime() {
		return nextSwitchTime;
	}

	public void setNextSwitchTime(String nextSwitchTime) {
		this.nextSwitchTime = nextSwitchTime;
	}

}
