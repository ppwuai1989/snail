<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.platform.snail.model.Resources"%>
<%@page import="org.platform.snail.utils.CommonKeys"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>企业资源管理-users</title>
</head>
<jsp:include page="../../common/common.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/content/report/CreateControl.js"></script>
<body  >
<!--ReportURL - 获取报表模板的URL   -->
<!--DataURL - 获取报表数据的URL   -->
 <script type="text/javascript"> 
 		var screenHeight=window.innerHeight-50;
 		CreateDisplayViewerEx("100%", screenHeight, "report.txt", "data.txt", true, "");
	  
    </script>


   <!--<object id="ReportViewer" type="application/x-grplugin6-displayviewer" width="100%" height="400">
    <param name="ReportURL" value="http://www.rubylong.cn/WebReport/grf/1a.txt">
    <param name="DataURL" value="data.txt">
    <param name="AutoRun" value="true"><param name="SerialNo" value="GA1F6NS5D6CPYN6FD1G6061B8EFLI5KI0L4Y1233TR5C74WND6898W9DJRJ9Y0AR69VTS4FNJN8K2SD5X92B8U5XI3TGTG4RTEZ46KB98F0RC699289LZ098X59F632R665D29885LD69KIM38GCN4P9BR4"><param name="UserName" value="广州锐浪软件技术有限公司"></object>
 -->
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>