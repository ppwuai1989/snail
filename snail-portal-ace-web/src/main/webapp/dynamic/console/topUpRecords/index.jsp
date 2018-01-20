<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>充值记录</title>
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
					<form action="#" id="fm-search" style="padding-left: 10px;">
						玩家编号： <input
							name="userId" type="text" style="width: 100px;"
							placeholder="玩家编号" /> 充值方式<input class="easyui-combobox"
							id="topUpWay"
							style="width: 100px; height: 30px; line-height: 30px;" name="way"
							data-options="
                    panelHeight:'auto'
            ">代理编号：
						<input name="agentId" type="text" style="width: 100px;"
							placeholder="代理编号" /> 充值日期: <input class="easyui-datebox"
							name="startDate"
							style="width: 200px; height: 30px; line-height: 30px;">到
						<input class="easyui-datebox" name="endDate"
							style="width: 200px; height: 30px; line-height: 30px;">

						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/topUpRecords/findRecordsList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar"></div>
				</div>
			</div>
		</div>

		<table id="grid-table"></table>

		<div id="grid-pager"></div>


	</div>
	<jsp:include page="../../common/footer-1.jsp" />
	<script
		src="${pageContext.request.contextPath}/content/js/console/topUpRecords/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/topUpRecords/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/topUpRecords/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/topUpRecords/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />
	<script type="text/javascript">
		//给复选框赋值
		$(document).ready(function() { //1:XX;2:XX;

			var data = odparse("STATIC_DATA_07").split(';');
			var themecombo2 = [ {
				'text' : '全部',
				'value' : ''
			} ];
			for (var i = 0; i < data.length; i++) {
				themecombo2.push({
					"text" : data[i].split(':')[1],
					"value" : data[i].split(':')[0]
				});
			}
			$("#topUpWay").combobox("loadData", themecombo2);
		})
		window.onresize = function() {
			console.log('autoWidthJqgrid');
			$(cfg.grid_selector).jqGrid('setGridWidth',
					$(".page-content").width());
			$(cfg.grid_selector).jqGrid('setGridHeight',
					window.innerHeight - 310);
		}
	</script>


</body>
</html>