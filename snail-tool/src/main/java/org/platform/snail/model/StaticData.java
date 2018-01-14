package org.platform.snail.model;

import java.io.Serializable;

public class StaticData implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 * 字典编码
	 */
	private String code;
	/**
	 * 字典名称
	 */
	private String name;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
