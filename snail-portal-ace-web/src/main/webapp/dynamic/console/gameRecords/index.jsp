<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>游戏记录</title>
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
						会员编号： <input name="id" type="text" style="width: 100px;"
							placeholder="会员编号" /> 会员昵称： <input name="name" type="text"
							style="width: 100px;" placeholder="会员昵称" /> 局数：<input
							class="easyui-combobox" id="round"
							style="width: 100px; height: 30px; line-height: 30px;"
							name="round"
							data-options="
                    panelHeight:'auto'
            ">回合数：<input
							class="easyui-combobox" id="gameIndex"
							style="width: 100px; height: 30px; line-height: 30px;"
							name="gameIndex"
							data-options="
                    panelHeight:'auto'
            ">庄家：<input
							class="easyui-combobox" id="isBanker"
							style="width: 100px; height: 30px; line-height: 30px;"
							name="isBanker"
							data-options="
                    panelHeight:'auto'
            ">
						游戏时间: <input class="easyui-datebox" name="startDate"
							style="width: 200px; height: 30px; line-height: 30px;">到
						<input class="easyui-datebox" name="endDate"
							style="width: 200px; height: 30px; line-height: 30px;">

						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/gameRecords/findRecordsList.do">
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
		src="${pageContext.request.contextPath}/content/js/console/gameRecords/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/gameRecords/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/gameRecords/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/gameRecords/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />
	<script type="text/javascript">
		$(document).ready(function() { //1:XX;2:XX;
			//给局数赋值			
			var themeComboRound = [ {
				'text' : '全部',
				'value' : ''
			}, ];
			for (var i = 0; i < 12; i++) {
				themeComboRound.push({
					"text" : i,
					"value" : i
				});
			}
			$("#round").combobox("loadData", themeComboRound);

			//给回合数赋值
			var themeComboGameIndex = [ {
				'text' : '全部',
				'value' : ''
			}, ];
			for (var i = 0; i < 5; i++) {
				themeComboGameIndex.push({
					"text" : i,
					"value" : i
				});
			}
			$("#gameIndex").combobox("loadData", themeComboGameIndex);

			//给庄家标识赋值
			var data = odparse("STATIC_DATA_02").split(';');
			var themeComboIsBanker = [ {
				'text' : '全部',
				'value' : ''
			} ];
			for (var i = 0; i < data.length; i++) {
				themeComboIsBanker.push({
					"text" : data[i].split(':')[1],
					"value" : data[i].split(':')[0]
				});
			}
			$("#isBanker").combobox("loadData", themeComboIsBanker);
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