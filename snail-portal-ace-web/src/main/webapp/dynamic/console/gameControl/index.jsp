<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>dict</title>
</head>
<jsp:include page="../../common/common.jsp" />
<script type="text/javascript">
	
</script>
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
						<span class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">游戏类型</span><input
							class="easyui-combobox" id="gameType"
							style="width: 100px; height: 30px; line-height: 30px;"
							name="gameType" data-options="panelHeight:'auto'"> <span
							class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">状态</span><input
							class="easyui-combobox" id="status"
							style="width: 100px; height: 30px; line-height: 30px;"
							name="status" data-options="panelHeight:'auto'">
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/gameControl/findControlList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-success" id="btn-view-add"
							authority="${pageContext.request.contextPath}/gameControl/insertControl.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/gameControl/updateControl.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>

						<button class="btn btn-danger" id="btn-view-del"
							authority="${pageContext.request.contextPath}/gameControl/deleteControl.do">
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
		src="${pageContext.request.contextPath}/content/js/console/gameControl/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/gameControl/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/gameControl/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/gameControl/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />
	<script type="text/javascript">
		window.onresize = function() {
			console.log('autoWidthJqgrid');
			$(cfg.grid_selector).jqGrid('setGridWidth',
					$(".page-content").width());
			$(cfg.grid_selector).jqGrid('setGridHeight',
					window.innerHeight - 310);
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			//游戏类型
			var gameType = odparse("STATIC_DATA_09").split(';');
			var themeComboGameType = [ {
				'text' : '全部',
				'value' : ''
			} ];
			for (var i = 0; i < gameType.length; i++) {
				themeComboGameType.push({
					"text" : gameType[i].split(':')[1],
					"value" : gameType[i].split(':')[0]
				});
			}
			$("#gameType").combobox("loadData", themeComboGameType);

			//状态		
			var themeComboGameType = [ {
				'text' : '全部',
				'value' : ''
			}, {
				'text' : '启用',
				'value' : '1'
			}, {
				'text' : '禁用',
				'value' : '0'
			} ];

			$("#status").combobox("loadData", themeComboGameType);
		});
	</script>

</body>
</html>