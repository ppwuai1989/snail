package org.platform.snail.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Resources;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.service.SystemService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailUtils;

import java.util.List;

public class SystemUserFilter implements Filter {

	Logger logger = LogManager.getLogger(this.getClass());
	private SystemService systemService;
	private String portalContextPath;
	private List<Resources> sysResources;
	private DataBaseLogService dataBaseLogService;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse res = (HttpServletResponse) arg1;

		if (req.getSession().getAttribute("portalContextPath") == null) {
			portalContextPath = req.getSession().getServletContext().getInitParameter("portal.contextPath");
			req.getSession().setAttribute("portalContextPath", portalContextPath);
			this.logger.info("load portal.contextPath :" + portalContextPath);
		}
		if (req.getServletPath().endsWith("/checkLogin.do")) {
			filterChain.doFilter(arg0, arg1);
			return;
		}
		if (req.getServletPath().endsWith("/weChatLogin.do")) {
			res.setHeader("Access-Control-Allow-Origin", "*");
			res.setHeader("Access-Control-Allow-Headers", "Origin,x-requested-with,Content-Type,Accept,X-Cookie");
			res.setHeader("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS");			
			filterChain.doFilter(arg0, arg1);
			return;
		}
		try {
			if (req.getSession().getAttribute(CommonKeys.SystemUser) != null) {
				// 是否有权限进入系统
				boolean skip = false;
				this.initService(req);
				// 1.权限逻辑首先要判断该请求是否属于系统保护资源
				// 2如果不是系统保护资源直接跳过，否则要在用户权限资源中检索是否拥有该请求的权限，如果没有则踢出系统
				//System.out.println("请求地址[" + req.getRequestURI() + "]");
				String requestUrl = req.getRequestURI().replace("/portal", "");			
				// 如果系统保护资源中含有该请求地址isHaveResource()返回true，则需要进行权限认证，不能跳过且skip为false。
				skip = !this.isHaveResource(requestUrl, sysResources);
				if (skip) {
					filterChain.doFilter(arg0, arg1);
					return;
				} else {
					// 判断当前请求是否在用户权限列表中，如果isHaveResource为true，则用户有权进行操作
					//为了防止用户在登录状态下，被管理员调整了权限，改为从数据库中获取权限而非取session--2018.1.11
					SystemUser systemUser = (SystemUser) req.getSession().getAttribute(CommonKeys.SystemUser);
						SystemUser nowSystemUser=this.systemService.getSystemUser(systemUser.getUsers().getUserId());
					boolean hasRight = isHaveResource(requestUrl, nowSystemUser.getResources());
					if (hasRight) {
						filterChain.doFilter(arg0, arg1);
						return;
					} else {
						// 记录到系统日志中
						String log = "id为[" + nowSystemUser.getUsers().getUserId() + "]的用户["
								+ nowSystemUser.getUsers().getName() + "]，越权访问系统保护资源[" + req.getRequestURI() + "]，被强制登出！";
						this.dataBaseLogService.log(log, "越权访问被踢出", "", req.getRequestURI(), "系统日志", nowSystemUser);
						String type = req.getHeader("X-Requested-With") == null ? ""
								: req.getHeader("X-Requested-With");
						if (StringUtils.equals(type, "XMLHttpRequest")) {
							res.setHeader("KICKED", "KICKED");
							res.setHeader("KICKEDPATH", "/portal/dynamic/common/kicked.jsp");
							res.setStatus(HttpServletResponse.SC_FORBIDDEN);
							return;
						} else {
							res.sendRedirect("/portal/dynamic/common/kicked.jsp");	
							return;
						}
					}
				}
			} else {
				String type = req.getHeader("X-Requested-With") == null ? ""
						: req.getHeader("X-Requested-With");
				if (StringUtils.equals(type, "XMLHttpRequest")) {
					res.setHeader("UNLOGIN", "UNLOGIN");
					res.setHeader("UNLOGINPATH", "/portal/dynamic/common/unLogin.jsp");
					res.setStatus(HttpServletResponse.SC_FOUND);
					return;
				} else {
					res.sendRedirect("/portal/dynamic/common/unLogin.jsp");		
					return;
				}				
			}
		} catch (Exception e) {
			System.out.println(this.getClass().getName() + "出错啦" + e.getMessage());
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	private void initService(HttpServletRequest request) throws Exception {
		javax.servlet.ServletContext servletContext = request.getSession().getServletContext();
		org.springframework.web.context.WebApplicationContext webApplicationContext = org.springframework.web.context.support.WebApplicationContextUtils
				.getRequiredWebApplicationContext(servletContext);
		if (this.systemService == null) {
			this.systemService = (SystemService) webApplicationContext.getBean("systemService");
		}
		if (this.dataBaseLogService == null) {
			this.dataBaseLogService = (DataBaseLogService) webApplicationContext.getBean("dataBaseLogService");
		}
		// 初始化系统资源
		this.sysResources = this.systemService.findAllSystemResources();
	}

	private boolean isHaveResource(String requestUrl, List<Resources> list) throws Exception {
		if (list != null) {
			for (Resources r : list) {
				if (SnailUtils.isNotBlankString(r.getResourcesType()) && !r.getResourcesType().equals("1")) {
					String resourceUrl = r.getResourcesUrl();
					if (resourceUrl.indexOf("/portal") > -1) {
						resourceUrl = resourceUrl.replace("/portal", "");
					}
					if (resourceUrl.indexOf("?") > -1) {
						resourceUrl = resourceUrl.substring(0, resourceUrl.indexOf("?"));
					}
					if (requestUrl.trim().equals(resourceUrl.trim())) {
						return true;
					}
				}
			}
		}
		return false;
	}

}
