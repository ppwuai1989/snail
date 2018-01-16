<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.platform.snail.beans.SystemUser"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="org.platform.snail.model.Resources"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	HttpSession sessions = request.getSession();
	SystemUser systemUser = (SystemUser) sessions.getAttribute("SystemUser");
	Map<String, Resources> map = systemUser.getMap();
	String url_Btn1 = getBtnUrl("3", map);
	String url_Btn2 = getBtnUrl("4", map);
	String url_Btn3 = getBtnUrl("5", map);
	String url_Btn4 = getBtnUrl("22", map);
%>
<%!public String getBtnUrl(String p, Map<String, Resources> urlMap) {
		String str_Url = "";
		if (urlMap.containsKey(p)) {
			str_Url = urlMap.get(p).getResourcesName() + "|" + urlMap.get(p).getResourcesUrl();
		}
		return str_Url;
	}%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>后台管理系统</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript">
		var contextPath='${pageContext.request.contextPath}';
		</script>
<!-- bootstrap & fontawesome -->
<script
	src="${pageContext.request.contextPath}/content/js/common/base.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/ace.min.css" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/content/assets/css/ace-part2.min.css" />
		<![endif]-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/ace-skins.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/content/assets/css/ace-ie.min.css" />
		<![endif]-->




<!-- ace settings handler -->
<script
	src="${pageContext.request.contextPath}/content/assets/js/gz/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="${pageContext.request.contextPath}/content/assets/js/gz/html5shiv.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/gz/respond.min.js"></script>
		<![endif]-->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/content/jquery-easyui-1.3.6/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/content/jquery-easyui-1.3.6/themes/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/content/assets/css/jquery-ui.min.css" />
<style>
html {
	position: relative;
}

body {
	font-family: "微软雅黑";
	font-size: 12px;
}
</style>
</head>

<body class="no-skin">
	<!-- #section:basics/navbar.layout -->
	<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

		<div class="navbar-container" id="navbar-container">
			<!-- #section:basics/sidebar.mobile.toggle -->
			<button type="button" class="navbar-toggle menu-toggler pull-left"
				id="menu-toggler">
				<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>

			<!-- /section:basics/sidebar.mobile.toggle -->
			<div class="navbar-header pull-left">
				<!-- #section:basics/navbar.layout.brand -->
				<a href="#" class="navbar-brand"> <small> <i
						class="fa fa-leaf"></i> 胜讯网络后台管理系统
				</small>
				</a>

				<!-- /section:basics/navbar.layout.brand -->

				<!-- #section:basics/navbar.toggle -->

				<!-- /section:basics/navbar.toggle -->
			</div>

			<!-- #section:basics/navbar.dropdown -->
			<div class="navbar-buttons navbar-header pull-right"
				role="navigation" id="navigation">
				<ul class="nav ace-nav">
					<!-- 						<li class="grey"> -->
					<!-- 							<a data-toggle="dropdown" class="dropdown-toggle" href="#"> -->
					<!-- 								<i class="ace-icon fa fa-tasks"></i> -->
					<!-- 								<span class="badge badge-grey" id="workflow-task-list-point">4</span> -->
					<!-- 							</a> -->

					<!-- 							<ul id="workflow-task-list" class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close"> -->
					<!-- 								<li class="dropdown-header"> -->
					<!-- 									<i class="ace-icon fa fa-check"></i> -->
					<!-- 									4 Tasks to complete -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left">Software Update</span> -->
					<!-- 											<span class="pull-right">65%</span> -->
					<!-- 										</div> -->

					<!-- 										<div class="progress progress-mini"> -->
					<!-- 											<div style="width:65%" class="progress-bar"></div> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left">Hardware Upgrade</span> -->
					<!-- 											<span class="pull-right">35%</span> -->
					<!-- 										</div> -->

					<!-- 										<div class="progress progress-mini"> -->
					<!-- 											<div style="width:35%" class="progress-bar progress-bar-danger"></div> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left">Unit Testing</span> -->
					<!-- 											<span class="pull-right">15%</span> -->
					<!-- 										</div> -->

					<!-- 										<div class="progress progress-mini"> -->
					<!-- 											<div style="width:15%" class="progress-bar progress-bar-warning"></div> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left">Bug Fixes</span> -->
					<!-- 											<span class="pull-right">90%</span> -->
					<!-- 										</div> -->

					<!-- 										<div class="progress progress-mini progress-striped active"> -->
					<!-- 											<div style="width:90%" class="progress-bar progress-bar-success"></div> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li class="dropdown-footer"> -->
					<!-- 									<a href="#"> -->
					<!-- 										See tasks with details -->
					<!-- 										<i class="ace-icon fa fa-arrow-right"></i> -->
					<!-- 									</a> -->
					<!-- 								</li> -->
					<!-- 							</ul> -->
					<!-- 						</li> -->

					<!-- 						<li class="purple"> -->
					<!-- 							<a data-toggle="dropdown" class="dropdown-toggle" href="#"  id="notification"> -->
					<!-- 								<i class="ace-icon fa fa-bell icon-animated-bell"></i> -->
					<!-- 								<span class="badge badge-important">8</span> -->
					<!-- 							</a> -->

					<!-- 							<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close"> -->
					<!-- 								<li class="dropdown-header"> -->
					<!-- 									<i class="ace-icon fa fa-exclamation-triangle"></i> -->
					<!-- 									8 Notifications -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left"> -->
					<!-- 												<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i> -->
					<!-- 												New Comments -->
					<!-- 											</span> -->
					<!-- 											<span class="pull-right badge badge-info">+12</span> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<i class="btn btn-xs btn-primary fa fa-user"></i> -->
					<!-- 										Bob just signed up as an editor ... -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left"> -->
					<!-- 												<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i> -->
					<!-- 												New Orders -->
					<!-- 											</span> -->
					<!-- 											<span class="pull-right badge badge-success">+8</span> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li> -->
					<!-- 									<a href="#"> -->
					<!-- 										<div class="clearfix"> -->
					<!-- 											<span class="pull-left"> -->
					<!-- 												<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i> -->
					<!-- 												Followers -->
					<!-- 											</span> -->
					<!-- 											<span class="pull-right badge badge-info">+11</span> -->
					<!-- 										</div> -->
					<!-- 									</a> -->
					<!-- 								</li> -->

					<!-- 								<li class="dropdown-footer"> -->
					<!-- 									<a href="#"> -->
					<!-- 										See all notifications -->
					<!-- 										<i class="ace-icon fa fa-arrow-right"></i> -->
					<!-- 									</a> -->
					<!-- 								</li> -->
					<!-- 							</ul> -->
					<!-- 						</li> -->

					<!-- 						<li class="green"> -->
					<!-- 							<a data-toggle="dropdown" class="dropdown-toggle" href="#" id="message"> -->
					<!-- 								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i> -->
					<!-- 								<span class="badge badge-success">5</span> -->
					<!-- 							</a> -->

					<!-- 							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close"> -->
					<!-- 								<li class="dropdown-header" > -->
					<!-- 									<i class="ace-icon fa fa-envelope-o"></i> -->
					<!-- 									5 Messages -->
					<!-- 								</li> -->

					<!-- 								<li class="dropdown-content"> -->
					<!-- 									<ul class="dropdown-menu dropdown-navbar"> -->
					<!-- 										<li> -->
					<!-- 											<a href="#"> -->
					<%-- 												<img src="${pageContext.request.contextPath}/content/assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" /> --%>
					<!-- 												<span class="msg-body"> -->
					<!-- 													<span class="msg-title"> -->
					<!-- 														<span class="blue">Alex:</span> -->
					<!-- 														Ciao sociis natoque penatibus et auctor ... -->
					<!-- 													</span> -->

					<!-- 													<span class="msg-time"> -->
					<!-- 														<i class="ace-icon fa fa-clock-o"></i> -->
					<!-- 														<span>a moment ago</span> -->
					<!-- 													</span> -->
					<!-- 												</span> -->
					<!-- 											</a> -->
					<!-- 										</li> -->

					<!-- 										<li> -->
					<!-- 											<a href="#"> -->
					<%-- 												<img src="${pageContext.request.contextPath}/content/assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" /> --%>
					<!-- 												<span class="msg-body"> -->
					<!-- 													<span class="msg-title"> -->
					<!-- 														<span class="blue">Susan:</span> -->
					<!-- 														Vestibulum id ligula porta felis euismod ... -->
					<!-- 													</span> -->

					<!-- 													<span class="msg-time"> -->
					<!-- 														<i class="ace-icon fa fa-clock-o"></i> -->
					<!-- 														<span>20 minutes ago</span> -->
					<!-- 													</span> -->
					<!-- 												</span> -->
					<!-- 											</a> -->
					<!-- 										</li> -->

					<!-- 										<li> -->
					<!-- 											<a href="#"> -->
					<%-- 												<img src="${pageContext.request.contextPath}/content/assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" /> --%>
					<!-- 												<span class="msg-body"> -->
					<!-- 													<span class="msg-title"> -->
					<!-- 														<span class="blue">Bob:</span> -->
					<!-- 														Nullam quis risus eget urna mollis ornare ... -->
					<!-- 													</span> -->

					<!-- 													<span class="msg-time"> -->
					<!-- 														<i class="ace-icon fa fa-clock-o"></i> -->
					<!-- 														<span>3:15 pm</span> -->
					<!-- 													</span> -->
					<!-- 												</span> -->
					<!-- 											</a> -->
					<!-- 										</li> -->

					<!-- 										<li> -->
					<!-- 											<a href="#"> -->
					<%-- 												<img src="${pageContext.request.contextPath}/content/assets/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar" /> --%>
					<!-- 												<span class="msg-body"> -->
					<!-- 													<span class="msg-title"> -->
					<!-- 														<span class="blue">Kate:</span> -->
					<!-- 														Ciao sociis natoque eget urna mollis ornare ... -->
					<!-- 													</span> -->

					<!-- 													<span class="msg-time"> -->
					<!-- 														<i class="ace-icon fa fa-clock-o"></i> -->
					<!-- 														<span>1:33 pm</span> -->
					<!-- 													</span> -->
					<!-- 												</span> -->
					<!-- 											</a> -->
					<!-- 										</li> -->

					<!-- 										<li> -->
					<!-- 											<a href="#"> -->
					<%-- 												<img src="${pageContext.request.contextPath}/content/assets/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar" /> --%>
					<!-- 												<span class="msg-body"> -->
					<!-- 													<span class="msg-title"> -->
					<!-- 														<span class="blue">Fred:</span> -->
					<!-- 														Vestibulum id penatibus et auctor  ... -->
					<!-- 													</span> -->

					<!-- 													<span class="msg-time"> -->
					<!-- 														<i class="ace-icon fa fa-clock-o"></i> -->
					<!-- 														<span>10:09 am</span> -->
					<!-- 													</span> -->
					<!-- 												</span> -->
					<!-- 											</a> -->
					<!-- 										</li> -->
					<!-- 									</ul> -->
					<!-- 								</li> -->

					<!-- 								<li class="dropdown-footer"> -->
					<!-- 									<a href="inbox.html"> -->
					<!-- 										See all messages -->
					<!-- 										<i class="ace-icon fa fa-arrow-right"></i> -->
					<!-- 									</a> -->
					<!-- 								</li> -->
					<!-- 							</ul> -->
					<!-- 						</li> -->

					<!-- #section:basics/navbar.user_menu -->
					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="${pageContext.request.contextPath}/content/assets/avatars/user.jpg"
							alt="Jason's Photo" /> <span class="user-info"> <!-- <small>department</small> -->
								${SystemUser.users.name}
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<!-- 		<li>
																<a href="#">
																	<i class="ace-icon fa fa-cog"></i>
																	Settings
																</a>
															</li> -->

							<li><a href="javascript:modifyPasswd();"
								id="btn-view-modify-passwd"> <i class="ace-icon fa fa-cog"></i>
									密码修改
							</a></li>

							<li class="divider"></li>

							<li><a
								href="${pageContext.request.contextPath}/dynamic/common/exit.jsp">
									<i class="ace-icon fa fa-power-off"></i> 安全退出
							</a></li>
						</ul></li>

					<!-- /section:basics/navbar.user_menu -->
				</ul>
			</div>

			<!-- /section:basics/navbar.dropdown -->
		</div>
		<!-- /.navbar-container -->
	</div>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

		<!-- #section:basics/sidebar -->
		<div id="sidebar" class="sidebar                  responsive">
			<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

			<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					<button class="btn btn-success" id="btn1" onclick="">
						<i class="ace-icon glyphicon glyphicon-check"></i>
					</button>

					<button class="btn btn-info" id="btn2" onclick="">
						<i class="ace-icon glyphicon glyphicon-pencil"></i>
					</button>

					<!-- #section:basics/sidebar.layout.shortcuts -->
					<button class="btn btn-warning" id="btn3" onclick="">
						<i class="ace-icon glyphicon glyphicon-user"></i>
					</button>

					<button class="btn btn-danger" id="btn4" onclick="">
						<i class="ace-icon glyphicon glyphicon-home"></i>
					</button>

					<!-- /section:basics/sidebar.layout.shortcuts -->
				</div>

				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>

					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts -->

			<ul class="nav nav-list" id="menu">

			</ul>
			<!-- /.nav-list -->

			<!-- #section:basics/sidebar.layout.minimize -->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left"
					onclick="setTimeout('autoWidth()',100)"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>

			<!-- /section:basics/sidebar.layout.minimize -->
			<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
		</div>

		<!-- /section:basics/sidebar -->
		<div class="main-content" id="main-content">

			<!-- #section:settings.box -->
			<div class="ace-settings-container" id="ace-settings-container"
				style="display: none">
				<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
					id="ace-settings-btn">
					<i class="ace-icon fa fa-cog bigger-150"></i>
				</div>

				<div class="ace-settings-box clearfix" id="ace-settings-box">
					<div class="pull-left width-50">
						<!-- #section:settings.skins -->
						<div class="ace-settings-item">
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="no-skin" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<!-- /section:settings.skins -->

						<!-- #section:settings.navbar -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-navbar" /> <label class="lbl"
								for="ace-settings-navbar"> Fixed Navbar</label>
						</div>

						<!-- /section:settings.navbar -->

						<!-- #section:settings.sidebar -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-sidebar" /> <label class="lbl"
								for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<!-- /section:settings.sidebar -->

						<!-- #section:settings.breadcrumbs -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-breadcrumbs" /> <label class="lbl"
								for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<!-- /section:settings.breadcrumbs -->

						<!-- #section:settings.rtl -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-rtl" /> <label class="lbl"
								for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>

						<!-- /section:settings.rtl -->

						<!-- #section:settings.container -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-add-container" /> <label class="lbl"
								for="ace-settings-add-container"> Inside <b>.container</b>
							</label>
						</div>

						<!-- /section:settings.container -->
					</div>
					<!-- /.pull-left -->

					<div class="pull-left width-50">
						<!-- #section:basics/sidebar.options -->
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-hover" /> <label class="lbl"
								for="ace-settings-hover"> Submenu on Hover</label>
						</div>

						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-compact" /> <label class="lbl"
								for="ace-settings-compact"> Compact Sidebar</label>
						</div>

						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-highlight" /> <label class="lbl"
								for="ace-settings-highlight"> Alt. Active Item</label>
						</div>

						<!-- /section:basics/sidebar.options -->
					</div>
					<!-- /.pull-left -->
				</div>
				<!-- /.ace-settings-box -->
			</div>
			<!-- /.ace-settings-container -->

			<script type="text/javascript">
		var screenHeight=window.innerHeight-46;
		console.log(screenHeight);
		document.write('<div id="tt" class="easyui-tabs"  style="height:'+screenHeight+'px" fit="true"></div>');
		</script>
		</div>
		<!-- /.main-content -->


	</div>
	<!-- /.main-container -->

	</div>
	<!-- /.main-container -->
	<div id="dialog-message" class="hide">
		<form id="fm-password">
			<fieldset>
				新设密码： <input id="password" type="password" style="width: 200px;" />
			</fieldset>
			<fieldset>
				重复输入： <input id="repassword" type="password" style="width: 200px;" />
			</fieldset>
		</form>
	</div>


	<!--[if lte IE 8]>
			<script type="text/javascript" src="${pageContext.request.contextPath}/content/assets/js/gz/jquery1x.min.js"></script>
		<![endif]-->
	<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/content/assets/js/gz/jquery.min.js'>"+"<"+"/script>");
		</script>



	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/content/assets/js/gz/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script
		src="${pageContext.request.contextPath}/content/assets/js/gz/bootstrap.min.js"></script>
	<!--
		<script src="${pageContext.request.contextPath}/content/assets/js/gz/jquery-ui.custom.min.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/gz/jquery.ui.touch-punch.min.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/gz/jquery.easypiechart.min.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/gz/jquery.sparkline.min.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/flot/jquery.flot.min.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="${pageContext.request.contextPath}/content/assets/js/flot/jquery.flot.resize.min.js"></script>
	 -->
	<!-- ace scripts -->
	<script
		src="${pageContext.request.contextPath}/content/assets/js/gz/ace-elements.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/assets/js/gz/ace.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/assets/js/gz/jquery-ui.min.js"></script>
	<!--
		<link rel="stylesheet" href="${pageContext.request.contextPath}/content/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/content/docs/assets/js/themes/sunburst.css" />
	    
		<script type="text/javascript"> ace.vars['base'] = '${pageContext.request.contextPath}/content/'; </script>
		<script src="${pageContext.request.contextPath}/content/assets/js/ace/ace.onpage-help.js"></script>
		<script src="${pageContext.request.contextPath}/content/docs/assets/js/rainbow.js"></script>
		<script src="${pageContext.request.contextPath}/content/docs/assets/js/language/generic.js"></script>
		<script src="${pageContext.request.contextPath}/content/docs/assets/js/language/html.js"></script>
		<script src="${pageContext.request.contextPath}/content/docs/assets/js/language/css.js"></script>
		<script src="${pageContext.request.contextPath}/content/docs/assets/js/language/javascript.js"></script>
		-->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/content/jquery-easyui-1.3.6/gz/jquery.easyui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/common/errorAccess.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/main/portal.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/common/dict.js"></script>

	<script type="text/javascript">
		window.onresize = function () {
			var h=window.innerHeight-46;
			var w=window.innerWidth-150;
			$('#tt').css("height",h);
			$('#tt').css("width",w);
			
			$('.tabs-header').css("width",w);
			$('.panel').css("width",w);
			
			$('.tabs-panels').css("height",h);
			$('.tabs-panels').css("width",w);
			
			$('.panel-body-noborder').css("height",h);
			$('.panel-body-noborder').css("width",w);
			
			
			
			$('iframe').height(h-20);
			$('iframe').width(w);
			
		}
		jQuery(function($){
			$('#sidebar-collapse').bind('click', function() {
				//alert(1);
				//setTimeout("autoWidth()",100);
			});				
			var bt1 = "<%=url_Btn1%>";		
			var bt2 = "<%=url_Btn2%>";	
			var bt3 = "<%=url_Btn3%>";	
			var bt4 = "<%=url_Btn4%>";
			makeBtn("btn1", bt1);
			makeBtn("btn2", bt2);
			makeBtn("btn3", bt3);
			makeBtn("btn4", bt4);
		})
		function makeBtn(id, btn) {
			if (btn == "") {
				$("#" + id).attr("disabled", true);
			} else {
				$("#" + id).attr(
						"onclick",
						"addPanel(\"" + btn.split('|')[0] + "\",\""
								+ contextPath + btn.split('|')[1] + "\",true)");
				$("#" + id).attr("title", btn.split('|')[0]);
			}
		}
		function autoWidth() {
			var w = $('#main-content').width();
			$('#tt').css("width", w);

			$('.tabs-header').css("width", w);
			$('.panel').css("width", w);

			$('.tabs-panels').css("width", w);
			$('.panel-body-noborder').css("width", w);
			$('iframe').width(w);

			setTimeout("autobell()", 1000);

		}
	</script>

	<script type="text/javascript">
		function autobell() {
			var t1 = Math.floor(Math.random() * 10 + 1);
			var t2 = Math.floor(Math.random() * 10 + 1);
			notification(t1);
			message(t2);
		}
		function notification(t) {
			$('#notification')
					.html(
							'<i class="ace-icon fa fa-bell icon-animated-bell"></i><span class="badge badge-important">'
									+ t + '</span>');
		}
		function message(t) {
			$('#message')
					.html(
							'<i class="ace-icon fa fa-envelope icon-animated-vertical"></i><span class="badge badge-success">'
									+ t + '</span>');
		}
	</script>

</body>
</html>
