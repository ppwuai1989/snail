<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>deparment</title>
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
					所属地区：
					<select name="areaCode" class="easyui-combotree" style="width:150px;height:30px" value="${SystemUser.department.areaCode}"  data-options="url:'${pageContext.request.contextPath}/system/selectProvinceTreeList.do',required:true"
												>
												</select>
						机构名称： <input name="departmentName" type="text" placeholder="机构名称"
							style="width: 200px;"/>
								<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/department/findDepartmentList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-info" id="btn-view-add"
							authority="${pageContext.request.contextPath}/department/insertDepartment.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-info" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/department/updateDepartment.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
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
		src="${pageContext.request.contextPath}/content/js/console/department/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/department/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/department/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/department/view.js"></script>

	<jsp:include page="../../common/footer-2.jsp" />

<script type="text/javascript">
window.onresize = function () {	
	$(cfg.grid_selector).jqGrid('setGridWidth', $(".page-content").width());
}
</script>


</body>
</html>