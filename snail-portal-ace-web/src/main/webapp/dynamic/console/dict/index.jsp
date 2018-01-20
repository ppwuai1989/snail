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
						字典名称： <input name="name" type="text"
							style="width: 200px;" placeholder="字典名称"/>
							字典类型：<input class="easyui-combobox" id="categoryId" style="width:200px;height:30px;line-height: 30px;"
            name="categoryId"
            data-options="
                    panelHeight:'auto'
            ">
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/dict/findDictList.do">
							 <i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>

					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-success" id="btn-view-add"
							authority="${pageContext.request.contextPath}/dict/insertDict.do">
							 <i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/dict/updateDict.do">
							 <i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>
						
						<button class="btn btn-danger" id="btn-view-del"
							authority="${pageContext.request.contextPath}/dict/deleteDictByDictId.do">
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
		src="${pageContext.request.contextPath}/content/js/console/dict/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/dict/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/dict/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/dict/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />
	<script type="text/javascript">
window.onresize = function () {
	console.log('autoWidthJqgrid');
	$(cfg.grid_selector).jqGrid('setGridWidth', $(".page-content").width());
	$(cfg.grid_selector).jqGrid('setGridHeight', window.innerHeight-310);
}
</script>
<script type="text/javascript">
$(document).ready(
		function(){
			$.ajax({
			 url:'${pageContext.request.contextPath}/dictCategory/findDictCategoryListAll.do', 
			 type:'get',
			 success:function(data){
			 	var themecombo2 =[{ 'text':'全部','value':''}];
					for(var i=0;i<data.length;i++){
					themecombo2.push({"text":data[i].name,"value":data[i].categoryId});
					}
				$("#categoryId").combobox("loadData", themecombo2);
			 }
			});}
		);
</script>

</body>
</html>