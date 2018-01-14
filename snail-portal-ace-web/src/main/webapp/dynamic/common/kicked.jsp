<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	session.invalidate();
	String kicked = org.platform.snail.utils.Config.getProperty("login.url");
	//response.sendRedirect(exit+"/logout");
%>
<!-- basic scripts -->
<!--[if lte IE 8]>
			<script type="text/javascript" src="${pageContext.request.contextPath}/content/assets/js/gz/jquery1x.min.js"></script>
		<![endif]-->
<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/content/assets/js/gz/jquery.min.js'>"+"<"+"/script>");
		</script>
<script>
jQuery(function($) {
		var basePath="/dynamic/common/kicked.jsp";
		var url="/portal"+basePath;		
		kicked(url);		
		location.href="<%=kicked%>/dynamic/common/kickedOut.jsp";
		
});
function kicked(url){
	$.ajax({
		type : "post",
		url : url,
		data:{time:new Date()},
		beforeSend : function(XMLHttpRequest) {
			
		},
		success : function(rst, textStatus) {
			console.log(rst);
		},
		complete : function(XMLHttpRequest, textStatus) {
			
		},
		error : function() {
			
		}
	});
}
</script>
