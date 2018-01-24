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
						代理编号： <input name="agentId" type="text" style="width: 100px;"
							placeholder="代理编号" /> 上级编号： <input name="parentAgentId"
							type="text" style="width: 100px;" placeholder="上级编号" />代理等级：<input
							class="easyui-combobox" id="agentLevel"
							style="width: 50px; height: 30px; line-height: 30px;"
							name="agentLevel"
							data-options="
                    panelHeight:'auto'
            ">
						昵称： <input name="name" type="text" style="width: 100px;"
							placeholder="昵称" /> 手机号： <input name="mobile" type="text"
							style="width: 100px;" placeholder="手机号" />
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/agent/findAgentList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>
					</form>
					<div id="toolbar" class="toolbar">
						<button class="btn btn-success" id="btn-view-add"
							authority="${pageContext.request.contextPath}/agent/insertAgent.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/agent/updateAgent.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-danger" id="btn-view-del"
							authority="${pageContext.request.contextPath}/agent/updateAgentStatusByPrimaryKey.do">
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
		//给复选框赋值
		$(document).ready(function(){			//1:XX;2:XX;
							
		var data = odparse("STATIC_DATA_06").split(';');
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
			$("#agentLevel").combobox("loadData", themecombo2);
		})
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