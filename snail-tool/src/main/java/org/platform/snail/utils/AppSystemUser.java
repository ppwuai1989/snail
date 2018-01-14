package org.platform.snail.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.SystemUser;

public class AppSystemUser {
	public AppSystemUser() {

	}

	Logger logger = LogManager.getLogger(this.getClass());
	private static AppSystemUser instance;

	public static synchronized AppSystemUser getInstance() {
		if (instance == null) {
			instance = new AppSystemUser();
		}
		return instance;
	}

	public SystemUser getSystemUser(HttpServletRequest request) {
		return (SystemUser) request.getSession().getAttribute(CommonKeys.SystemUser);

	}

	public void setSystemUser(SystemUser systemUser, HttpServletRequest request) {
		logger.info("----> " + systemUser.getUsers().getAccount() + " in session from ");
		request.getSession().setAttribute(CommonKeys.SystemUser, systemUser);
	}

}
