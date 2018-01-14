package org.platform.snail.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.utils.CommonKeys;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.opensymphony.xwork2.ActionContext;

public class BaseController implements java.io.Serializable {
	public Logger logger = LogManager.getLogger(this.getClass());
	private static final long serialVersionUID = 1L;

	protected HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}

	private int start;
	private int limit;
	private int totalRecord;
	private String orderBy;

	public int getStart() {
		return start + 1;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		if (limit <= 0) {
			limit = CommonKeys.GRID_DEFAULT_PAGE_SIZE;
		}
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	protected Object getSession(String name) {
		HttpSession se=this.getRequest().getSession();
		return se.getAttribute(name);
	}

	protected void setSession(String name, Object obj) {
		HttpServletRequest request = this.getRequest();
		HttpSession se = request.getSession();			
		se.setAttribute(name, obj);
	}

	protected SystemUser getSessionSystemUser() {
		Object obj = this.getSession(CommonKeys.SystemUser);
		SystemUser systemUser = (SystemUser) obj;
		return systemUser;
	}

	protected void setSessionSystemUser(SystemUser obj) {	
			this.setSession(CommonKeys.SystemUser, obj);	
	}
}
