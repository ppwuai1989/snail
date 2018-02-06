package org.platform.snail.beans;

import java.io.Serializable;

public class ValidateResult implements Serializable {

	private boolean success;
	private String errMsg;

	public ValidateResult() {
		this.success = true;
		this.errMsg = "";
	}

	public ValidateResult(boolean success, String errMsg) {
		this.success = success;
		this.errMsg = errMsg;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

}
