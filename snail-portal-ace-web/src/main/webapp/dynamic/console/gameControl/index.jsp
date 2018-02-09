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
						<!--系统状态信息  -->
						<div id="system-state-info"
							style="float: right; margin-right: 150px;">
							<span class="btn btn-purple no-border "> <i
								class="ace-icon fa fa-money bigger-130"></i> <span
								class="bigger-110">系统信息：</span>
							</span><span class="label label-xlg label-primary arrowed-right"
								style="margin-left: 10px;">游戏类型</span><input
								class="easyui-combobox" id="system-gameType"
								style="width: 100px; height: 30px; line-height: 30px;"
								name="system-gameType" data-options="panelHeight:'auto'">
							<span class="btn btn-app btn-sm btn-success no-hover"
								style="width: auto; min-width: 80px;"> <span
								class="line-height-1 bigger-170" id="system-income"></span> <br>
								<span class="line-height-1 smaller-90">系统入账</span>
							</span> <span class="btn btn-app btn-sm btn-danger no-hover"
								style="width: auto; min-width: 80px; display: none;"> <span
								class="line-height-1 bigger-170" id="system-state"></span> <br>
								<span class="line-height-1 smaller-90">系统状态</span>
							</span> <span class="btn btn-app btn-sm btn-grey no-hover"
								style="width: auto; min-width: 80px; display: none;"> <span
								class="line-height-1 bigger-170" id="switch-leftTime"
								name="switch-leftTime"></span> <br> <span
								class="line-height-1 smaller-90">下次转换时间</span>
							</span>
						</div>
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
		var leftTimer = null;
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
			$("#system-gameType").combobox("loadData", themeComboGameType);

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

			/*加载或更新系统状态信息begin*/
			getSystemState("");
			$("#system-gameType").combobox({
				onSelect : function(e) {
					getSystemState(e.value);
				}
			});
			/*加载或更新系统状态信息end*/
		});
		function getSystemState(type) {
			$
					.ajax({
						url : '${pageContext.request.contextPath}/gameControl/selectSystemState.do?gameType='
								+ type,
						type : 'get',
						success : function(rst) {
							if (rst.state == true) {
								$("#system-income").text(rst.response.income);
								if (rst.response.gameType != null
										&& rst.response.gameType != "") {
									var stateText = "";
									if (rst.response.state == '1') {
										stateText = '放水期';
									} else {
										stateText = '蓄水期';
									}
									$("#system-state").text(stateText);
									var leftTime = rst.response.nextSwitchTime / 1000;
									getLeftTime(leftTime);
									$("#system-state").parent().show();
									$("#switch-leftTime").parent().show();
								} else {
									$("#system-state").parent().hide();
									$("#switch-leftTime").parent().hide();
								}
							} else {
								$("#system-state").parent().hide();
								$("#switch-leftTime").parent().hide();
							}
						}
					});
		}
		function getLeftTime(count) {
			window.clearInterval(leftTimer);
			var which = "#switch-leftTime";
			$(which).text(timeMaker(count));
			leftTimer = window.setInterval(function() {
				count--;
				if (count > 0) {
					var leftTime = timeMaker(count);
					$(which).text(leftTime);
				} else {
					$(which).text("转换启动！");
				}
			}, 1000);
		}
		function timeMaker(count) {
			var leftTime = {
				hour : 0,
				minute : 0,
				second : 0,
				getTime : function() {
					return leftTime.hour + ":" + leftTime.minute + ":"
							+ leftTime.second;
				}
			}
			if (count > 0) {
				leftTime.hour = Math.floor(count / (60 * 60));
				leftTime.minute = Math.floor(count / 60) - (leftTime.hour * 60);
				leftTime.second = Math.floor(count) - (leftTime.hour * 60 * 60)
						- (leftTime.minute * 60);
			}
			if (leftTime.hour <= 9)
				leftTime.hour = '0' + leftTime.hour;
			if (leftTime.minute <= 9)
				leftTime.minute = '0' + leftTime.minute;
			if (leftTime.second <= 9)
				leftTime.second = '0' + leftTime.second;
			return leftTime.getTime();
		}
	</script>

</body>
</html>