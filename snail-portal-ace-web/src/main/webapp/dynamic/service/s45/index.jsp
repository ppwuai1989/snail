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
<script type="text/javascript">document.write(breadcrumbs());</script>

 <script type="text/javascript"> 
 		var screenHeight=window.innerHeight-50;
 		CreateDisplayViewerEx("100%", screenHeight, "report.txt", "", true, "");
	  

    </script>

<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>