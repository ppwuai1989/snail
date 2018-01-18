<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>member</title>
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
						会员编号： <input name="userId" type="text" style="width: 100px;"
							placeholder="会员编号" /> 用户名称： <input name="name" type="text"
							style="width: 150px;" placeholder="用户名称" /> 手机号： <input
							name="mobile" type="text" style="width: 100px;" placeholder="手机号" />
						<button class="btn btn-info" id="btn-search"
							authority="${pageContext.request.contextPath}/member/findMemberList.do">
							<i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>
						<!--  -->
						<div id="agent-account-info" style="float: right;margin-right: 150px;display:none;">
							<span class="btn btn-purple no-border " > <i
								class="ace-icon fa fa-money bigger-130"></i> <span
								class="bigger-110">账户信息：</span>
							</span> <span class="btn btn-app btn-sm btn-pink no-hover" style="width: auto;min-width: 80px;"> <span
								class="line-height-1 bigger-170" id="agent-account-coins" ></span> <br> <span
								class="line-height-1 smaller-90">金币</span>
							</span> <span class="btn btn-app btn-sm btn-grey no-hover"  style="width: auto;min-width: 80px;"> <span
								class="line-height-1 bigger-170" id="agent-account-gems"></span> <br> <span
								class="line-height-1 smaller-90">房卡</span>
							</span> <span class="btn btn-app btn-sm btn-success no-hover"  style="width: auto;min-width: 80px;"> <span
								class="line-height-1 bigger-170" id="agent-account-pkCard"></span> <br> <span
								class="line-height-1 smaller-90">比武卡</span>
							</span>
						</div>
					</form>
					<div id="toolbar" class="toolbar">

						<button class="btn btn-info" id="btn-view-add"
							authority="${pageContext.request.contextPath}/member/insertMember.do">
							<i
								class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-info" id="btn-view-edit"
							authority="${pageContext.request.contextPath}/member/updateMember.do">
							<i
								class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
						</button>
						<button class="btn btn-warning" id="btn-view-del"
							authority="${pageContext.request.contextPath}/member/updateMemberStatusByPrimaryKey.do">
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
		src="${pageContext.request.contextPath}/content/js/console/member/config.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/member/model.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/member/controller.js"></script>
	<script
		src="${pageContext.request.contextPath}/content/js/console/member/view.js"></script>
	<jsp:include page="../../common/footer-2.jsp" />

	<script type="text/javascript">
	//加载账户信息
	$(document).ready(
				function(){
					$
					.ajax({
						url : '${pageContext.request.contextPath}/member/findMemberAccountInfo.do',
						type : 'get',
						success : function(data) {
							if (data.state) {
								var coins = convertZero(data.response.coins);
								var gems = convertZero(data.response.gems);
								var pkCard = convertZero(data.response.pkCard);
								$("#agent-account-coins").text(coins);
								$("#agent-account-gems").text(gems);
								$("#agent-account-pkCard").text(pkCard);
								$("#agent-account-info").show();
							}
						}
					})
				}
			);
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