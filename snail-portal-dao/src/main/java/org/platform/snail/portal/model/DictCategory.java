package org.platform.snail.portal.model;

import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class DictCategory implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String categoryId;
	private String name;
	private String remark;
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId == null ? null : categoryId.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "DictCategory [categoryId=" + categoryId + ", name=" + name + ", remark=" + remark + ", createTime="
				+ createTime + "]";
	}

}
