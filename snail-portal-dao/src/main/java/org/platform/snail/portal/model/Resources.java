package org.platform.snail.portal.model;

import java.io.Serializable;
import java.util.Date;

import org.platform.snail.extra.CustomDateSerializer;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Resources implements Serializable {

	private static final long serialVersionUID = 1L;

	private String resourcesId;

	private String parentResourcesId;

	private String resourcesName;

	private String resourcesUrl;

	private String resourcesPath;

	private String resourcesIcon;

	private String resourcesType;
	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	private String createUserId;

	private String remark;

	private String status;

	public String getResourcesId() {
		return resourcesId;
	}

	public void setResourcesId(String resourcesId) {
		this.resourcesId = resourcesId == null ? null : resourcesId.trim();
	}

	public String getParentResourcesId() {
		return parentResourcesId;
	}

	public void setParentResourcesId(String parentResourcesId) {
		this.parentResourcesId = parentResourcesId == null ? null : parentResourcesId.trim();
	}

	public String getResourcesName() {
		return resourcesName;
	}

	public void setResourcesName(String resourcesName) {
		this.resourcesName = resourcesName == null ? null : resourcesName.trim();
	}

	public String getResourcesUrl() {
		return resourcesUrl;
	}

	public void setResourcesUrl(String resourcesUrl) {
		this.resourcesUrl = resourcesUrl == null ? null : resourcesUrl.trim();
	}

	public String getResourcesPath() {
		return resourcesPath;
	}

	public void setResourcesPath(String resourcesPath) {
		this.resourcesPath = resourcesPath == null ? null : resourcesPath.trim();
	}

	public String getResourcesIcon() {
		return resourcesIcon;
	}

	public void setResourcesIcon(String resourcesIcon) {
		this.resourcesIcon = resourcesIcon == null ? null : resourcesIcon.trim();
	}

	public String getResourcesType() {
		return resourcesType;
	}

	public void setResourcesType(String resourcesType) {
		this.resourcesType = resourcesType == null ? null : resourcesType.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId == null ? null : createUserId.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	@Override
	public String toString() {
		return "Resources [resourcesId=" + resourcesId + ", parentResourcesId=" + parentResourcesId + ", resourcesName="
				+ resourcesName + ", resourcesUrl=" + resourcesUrl + ", resourcesPath=" + resourcesPath
				+ ", resourcesIcon=" + resourcesIcon + ", resourcesType=" + resourcesType + ", createTime=" + createTime
				+ ", createUserId=" + createUserId + ", remark=" + remark + ", status=" + status + "]";
	}

}
