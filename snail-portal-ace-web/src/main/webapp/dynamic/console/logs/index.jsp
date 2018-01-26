<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>logs</title>
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
							style="margin-left: 10px;">内容</span><input name="logs"
							type="text" style="width: 200px;" placeholder="内容" /><span
							class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">类别</span><input
							class="easyui-combobox"
							style="width: 200px; height: 30px; line-height: 30px;"
							name="logType" id="logType" data-options="panelHeight:'auto'">
						<span class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">时间</span><input class="easyui-datebox"
							name="startDate"
							style="width: 100px; height: 30px; line-height: 30px;"><span
							class="label label-sm label-primary arrowed arrowed-right"
							style="margin-left: 8px;">到</span> <input class="easyui-datebox"
							name="endDate"
							style="width: 100px; height: 30px; line-height: 30px;">
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/logs/findList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-info" id="btn-view-add"
							authority="${pageContext.request.contextPath}/logs/insertDict.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
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
		src="${pageContext.request.contextPath}/content/js/console/logs/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/logs/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/logs/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/logs/view.js"></script>
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
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/dict/findListByCategoryId.do?categoryId=05',
										type : 'post',
										success : function(data) {
											var themecombo2 = [ {
												'text' : '全部',
												'value' : ''
											} ];
											for (var i = 0; i < data.length; i++) {
												themecombo2.push({
													"text" : data[i].name,
													"value" : data[i].code
												});
											}
											$("#logType").combobox("loadData",
													themecombo2);

										}
									});
						});
	</script>

</body>
</html>