package org.platform.snail.portal.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.portal.service.DictService;
import org.platform.snail.utils.CommonKeys;



public class AutoLoadDictListener implements ServletContextListener {

	private DictService dictService;
	Logger logger = LogManager.getLogger(this.getClass());

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent arg0) {
		logger.info("LoadAutoLoadDictListener start");
		this.initService(arg0.getServletContext());

		dictService.flushJavaScriptFile(arg0.getServletContext().getRealPath("/"), CommonKeys.dictPath,
				arg0.getServletContext());

	}

	private void initService(javax.servlet.ServletContext servletContext) {
		org.springframework.web.context.WebApplicationContext webApplicationContext = org.springframework.web.context.support.WebApplicationContextUtils
				.getRequiredWebApplicationContext(servletContext);
		if (this.dictService == null) {
			this.dictService = (DictService) webApplicationContext.getBean("dictService");
		}
	}

}
