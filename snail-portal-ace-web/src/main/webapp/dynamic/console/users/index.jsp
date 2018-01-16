<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>user</title>
</head>
<jsp:include page="../../common/common.jsp" />
<body>
	<div class="page-content">
		<div class="widget-box" id="widget-box">
			<div class="widget-header">
				<h5 class="widget-title smaller">设置查询条件</h5>

				<div class="widget-toolbar"></div>
			</div>

			<div class="widget-body">
				<div class="widget-main padding-6">
					<form action="#" id="fm-search">
						用户名称： <input name="name" type="text" style="width: 200px;"
							placeholder="用户名称" />
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/users/findUsersList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-info" id="btn-view-add"
							authority="${pageContext.request.contextPath}/users/insertUsers.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-info" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/users/updateUsers.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-purple" id="btn-view-da"
							authority="${pageContext.request.contextPath}/users/insertUsersRole.do">
							<i
								class="ace-icon glyphicon  glyphicon-cog  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-initpwd"
							authority="${pageContext.request.contextPath}/users/updateUsersForInitPassword.do">
							<i
								class="ace-icon glyphicon  glyphicon-cog  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-del"
							authority="${pageContext.request.contextPath}/users/updateUsersStatusByPrimaryKey.do">
							<i
								class="ace-icon glyphicon  glyphicon-remove  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="paopao-btn">
							<i
								class="ace-icon glyphicon  glyphicon-remove  align-top bigger-125 icon-on-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>

		<table id="grid-table"></table>

		<div id="grid-pager"></div>


		<div id="dialog-message" class="hide">
			<table>
				<tr>
					<td align="center" valign="top">
						<table id="allrole-grid-table"></table>
						<div id="allrole-grid-pager"></div>
					</td>
					<td align="center" valign="middle">
						<button class="btn btn-info" id="btn-view-da-add"
							authority="${pageContext.request.contextPath}/users/insertUsersRole.do">
							分配<i
								class="ace-icon fa   fa-angle-double-right  align-top bigger-125 icon-on-right"></i>
						</button>
						<div style="height: 3px"></div>
						<button class="btn btn-info" id="btn-view-da-del"
							authority="${pageContext.request.contextPath}/users/insertUsersRole.do">
							移除<i
								class="ace-icon fa  fa-angle-double-left  align-top bigger-125 icon-on-right"></i>
						</button>
					</td>
					<td align="center" valign="top">
						<table id="myrole-grid-table"></table>
						<div id="myrole-grid-pager"></div>
					</td>
				</tr>
			</table>



		</div>
		<div id="dialog-message-initpwd" class="hide">
			<form action="/users/updateUsersForInitPassword.do" id="fm-initpwd">
				<fieldset>
					初始密码： <input id="init_passwd" type="password" style="width: 200px;" />
				</fieldset>
				<fieldset>
					重复输入： <input id="init_rpasswd" type="password"
						style="width: 200px;" />
				</fieldset>
			</form>
		</div>
		<div id="dialog-confirm" class="hide">
			<div class="alert alert-info bigger-110">
				重新分配角色后，分配此角色的用户将获取新的权限.</div>

			<div class="space-6"></div>

			<p class="bigger-110 bolder center grey">
				<i class="ace-icon fa fa-hand-o-right blue bigger-120"></i> 您确定吗?
			</p>
		</div>
		<div id="dialog-confirm-initpwd" class="hide">
			<div class="alert alert-info bigger-110">初始密码后，系统将启用新的密码.</div>

			<div class="space-6"></div>

			<p class="bigger-110 bolder center grey">
				<i class="ace-icon fa fa-hand-o-right blue bigger-120"></i> 您确定吗?
			</p>
		</div>
	</div>
	<jsp:include page="../../common/footer-1.jsp" />
	<script
		src="${pageContext.request.contextPath}/content/js/console/users/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/users/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/users/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/users/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />

	<script type="text/javascript">
	jQuery(function($) {
		$("#paopao-btn").attr("disabled",false);
		$("#paopao-btn").on('click', function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/weChat/weChatLogin.do',
				type : 'get',
				success : function(data) {
					console.log("weChat/weChatLogin.do");
				}
			})
		});
		})

		window.onresize = function() {
			//console.log('autoWidthJqgrid');
			$(cfg.grid_selector).jqGrid('setGridWidth',
					$(".page-content").width());
			$(cfg.grid_selector).jqGrid('setGridHeight',
					window.innerHeight - 320);
		}
	</script>
</body>
</html>