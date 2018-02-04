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
						<span class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">玩家编号</span><input name="userId"
							type="text" style="width: 100px;" placeholder="玩家编号" /> <span
							class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">充值方式</span><input
							class="easyui-combobox" id="topUpWay"
							style="width: 100px; height: 30px; line-height: 30px;" name="way"
							data-options="panelHeight:'auto'"> <span
							class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">支付状态</span><input
							class="easyui-combobox" id="payStatus"
							style="width: 100px; height: 30px; line-height: 30px;"
							name="payStatus" data-options="panelHeight:'auto'"> <span
							class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">代理编号</span> <input name="agentId"
							type="text" style="width: 100px;" placeholder="代理编号" /> <span
							class="label label-xlg label-primary arrowed-right"
							style="margin-left: 10px;">充值日期</span><input
							class="easyui-datebox" name="startDate"
							style="width: 100px; height: 30px; line-height: 30px;"><span
							class="label label-sm label-primary arrowed arrowed-right"
							style="margin-left: 8px;">到</span> <input class="easyui-datebox"
							name="endDate"
							style="width: 100px; height: 30px; line-height: 30px;">

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
		$(document).ready(function() { //1:XX;2:XX;
			//充值方式
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

			//支付状态
			var payStatus=odparse("STATIC_DATA_08").split(';');
			var themeComboStatus = [ {
				'text' : '全部',
				'value' : ''
			} ];
			for (var i = 0; i < payStatus.length; i++) {
				themeComboStatus.push({
					"text" : payStatus[i].split(':')[1],
					"value" : payStatus[i].split(':')[0]
				});
			}
			$("#payStatus").combobox("loadData", themeComboStatus);
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