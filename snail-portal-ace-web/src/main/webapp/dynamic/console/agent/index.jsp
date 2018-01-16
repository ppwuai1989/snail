<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>agent</title>
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
						微信号： <input name="weChatId" type="text" style="width: 200px;"
							placeholder="微信号" /> 用户名称： <input name="name" type="text"
							style="width: 200px;" placeholder="用户名称" /> 手机号： <input
							name="mobile" type="text" style="width: 200px;" placeholder="手机号" />
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/agent/findMemberList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>
						
					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-info" id="btn-view-add"
							authority="${pageContext.request.contextPath}/agent/insertMember.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-info" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/agent/updateMember.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-del"
							authority="${pageContext.request.contextPath}/agent/updateMemberStatusByPrimaryKey.do">
							<i
								class="ace-icon glyphicon  glyphicon-remove  align-top bigger-125 icon-on-right"></i>
						</button>

					</div>
				</div>
			</div>
		</div>
		<table id="grid-table"></table>
		<div id="grid-pager"></div>
	</div>
	<jsp:include page="../../common/footer-1.jsp" />
	<script
		src="${pageContext.request.contextPath}/content/js/console/agent/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/agent/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/agent/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/agent/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />

	<script type="text/javascript">
	//加载账户信息
	$(document).ready(
				function(){
					$
					.ajax({
						url : '${pageContext.request.contextPath}/agent/findMemberAccountInfo.do',
						type : 'get',
						success : function(data) {
							if (data.state) {
							
							}
						}
					})
				}
			);
	function convertZero(value) {
		if (value == null || value == "") {
			value = 0;
		}
		return value;
	}
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