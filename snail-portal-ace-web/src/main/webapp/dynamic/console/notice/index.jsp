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
<script type="text/javascript">
	var urlid = '${param.id}';
	var edit = false;
</script>
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
						标题： <input name="title" type="text" style="width: 200px;" /> 
						类别：<input
							class="easyui-combobox"
							style="width: 200px; height: 30px; line-height: 30px;"
							name="noticeCategory"
							id="noticeCategory"
							data-options="panelHeight:'auto'
            ">
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/notice/findNoticeList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-info" id="btn-view-add"
							authority="${pageContext.request.contextPath}/notice/insertNotice.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-info" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/notice/updateNotice.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-del"
							authority="${pageContext.request.contextPath}/notice/deleteNoticeByNoticeId.do">
							<i
								class="ace-icon glyphicon  glyphicon-remove  align-top bigger-125 icon-on-right"></i>
						</button>
						
						<button class="btn btn-purple" id="btn-view-top"
							authority="${pageContext.request.contextPath}/notice/updateForTopByPrimaryKey.do">
							<i
								class="ace-icon glyphicon  glyphicon-cog  align-top bigger-125 icon-on-right"></i>
						</button>
                         <button class="btn btn-warning" id="btn-view-push"
							authority="${pageContext.request.contextPath}/notice/updateForStatusByPrimaryKey.do">
							<i
								class="ace-icon glyphicon  glyphicon-cog  align-top bigger-125 icon-on-right"></i>
							</button>	
					</div>
				</div>
			</div>
		</div>

		<table id="grid-table"></table>

		<div id="grid-pager"></div>


	</div>
	<div id="dialog-message" class="hide">
	 <div class="alert alert-info bigger-110">
							该公告将会发布
							</div>
		<!--  <div class="profile-info-row">
			<div class="profile-info-name">自由组</div>

			<div class="profile-info-value">
				<input class="easyui-combobox"
					style="width: 100px; height: 30px; line-height: 30px;"
					name="groupId"
					data-options="
                    url:'${pageContext.request.contextPath}/dict/findListByCategoryId.do?categoryId=20&selected=false',
                    method:'get',
                    valueField:'code',
                    textField:'name',
                    panelHeight:'auto'
            ">
			</div>
		</div>
		<div class="profile-info-row">
			<div class="profile-info-name">部门</div>

			<div class="profile-info-value">
				<input name="departmentId" class="easyui-combotree"
					data-options="url:'${pageContext.request.contextPath}/system/selectDepartmentTreeList.do?id=01',method:'get',animate: true,
                lines:false,"
					style='width: 200px; line-height: 30px; height: 30px;'>
			</div>
		</div>-->
	</div>
	<jsp:include page="../../common/footer-1.jsp" />
	<script
		src="${pageContext.request.contextPath}/content/js/console/notice/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/notice/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/notice/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/notice/view.js"></script>
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
$(document).ready(
		function(){
			$.ajax({
			 url:'${pageContext.request.contextPath}/dict/findListByCategoryId.do?categoryId=21', 
			 type:'post',
			 success:function(data){
			 	var themecombo2 =[{ 'text':'全部','value':''}];
					for(var i=0;i<data.length;i++){
					themecombo2.push({"text":data[i].name,"value":data[i].code});
					}
				$("#noticeCategory").combobox("loadData", themecombo2);
				
			 }
			});}
		);
</script>
	
</body>
</html>