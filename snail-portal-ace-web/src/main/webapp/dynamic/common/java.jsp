<%@page import="org.platform.snail.beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="org.platform.snail.portal.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	javax.servlet.ServletContext servletContext = request.getSession()
			.getServletContext();
	org.springframework.web.context.WebApplicationContext webApplicationContext = org.springframework.web.context.support.WebApplicationContextUtils
			.getRequiredWebApplicationContext(servletContext);
	BaseDao baseDao = (BaseDao) webApplicationContext
			.getBean("baseDao");
	request.setAttribute("list", baseDao.selectList());
%>
<c:forEach var="o" items="${list}" varStatus="status">
	<tr>
					<td>${o.成员编号}</td>

					<td>${o.姓名}</td>

					<td>${o.性别}</td>
					<td>${o.出生日期}</td>
					<td>${o.与户主关系}</td>
					<td>${o.身份证号}</td>
					<td>${o.成员属性}</td>
					<td>${o.成员属性}</td>
					<td>${o.医疗证号}</td>
					<td>${o.地址}</td>
				</tr>
</c:forEach>