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
<jsp:include page="../../../common/common.jsp" />
<body>
	<div class="main-content-inner">
		<div class="page-content">
			<!-- /.ace-settings-container -->

			<div class="page-header">
				<h1>
					代理申请表 <small> <i class="ace-icon fa fa-angle-double-right"></i>
						请填写申请信息
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-1"> 会员编号： </label>

							<div class="col-sm-9">
								<input type="text" id="form-field-1" placeholder="请输入玩家的8位会员编号"
									class="col-xs-10 col-sm-3">
							</div>
						</div>
						<div class="space-4"></div>
						<div class="clearfix form-actions" style="">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button" disabled="">
									<i class="ace-icon fa fa-check bigger-110"></i> Submit
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset" disabled="">
									<i class="ace-icon fa fa-undo bigger-110"></i> Reset
								</button>
							</div>
						</div>

					</form>

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
	<jsp:include page="../../../common/footer-1.jsp" />

	<jsp:include page="../../../common/footer-2.jsp" />

	<script type="text/javascript">
		//给复选框赋值
		$(document).ready(function() { //1:XX;2:XX;

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
	</script>
</body>
</html>