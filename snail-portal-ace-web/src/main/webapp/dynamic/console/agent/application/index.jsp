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
					代理申请表 <small> <i
						class="ace-icon fa fa-angle-double-right"></i> 请填写申请信息
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
								for="form-field-1"> Text Field </label>

							<div class="col-sm-9">
								<input type="text" id="form-field-1" placeholder="Username"
									class="col-xs-10 col-sm-5">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-1-1"> Full Length </label>

							<div class="col-sm-9">
								<input type="text" id="form-field-1-1" placeholder="Text Field"
									class="form-control">
							</div>
						</div>

						<div class="space-4"></div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-2"> Password Field </label>

							<div class="col-sm-9">
								<input type="password" id="form-field-2" placeholder="Password"
									class="col-xs-10 col-sm-5"> <span
									class="help-inline col-xs-12 col-sm-7"> <span
									class="middle">Inline help text</span>
								</span>
							</div>
						</div>

						<div class="space-4"></div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-input-readonly"> Readonly field </label>

							<div class="col-sm-9">
								<input readonly="" type="text" class="col-xs-10 col-sm-5"
									id="form-input-readonly" value="This text field is readonly!">
								<span class="help-inline col-xs-12 col-sm-7"> <label
									class="middle"> <input class="ace" type="checkbox"
										id="id-disable-check"> <span class="lbl">
											Disable it!</span>
								</label>
								</span>
							</div>
						</div>

						<div class="space-4"></div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-4">Relative Sizing</label>

							<div class="col-sm-9">
								<input class="input-sm" type="text" id="form-field-4"
									placeholder=".input-sm">
								<div class="space-2"></div>

								<div
									class="help-block ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
									id="input-size-slider" style="width: 200px;">
									<div
										class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min"
										style="width: 0%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0" style="left: 0%;"></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-5">Grid Sizing</label>

							<div class="col-sm-9">
								<div class="clearfix">
									<input class="col-xs-1" type="text" id="form-field-5"
										placeholder=".col-xs-1">
								</div>

								<div class="space-2"></div>

								<div
									class="help-block ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
									id="input-span-slider">
									<div
										class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min"
										style="width: 0%;"></div>
									<span class="ui-slider-handle ui-state-default ui-corner-all"
										tabindex="0" style="left: 0%;"></span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Input
								with Icon</label>

							<div class="col-sm-9">
								<span class="input-icon"> <input type="text"
									id="form-field-icon-1"> <i
									class="ace-icon fa fa-leaf blue"></i>
								</span> <span class="input-icon input-icon-right"> <input
									type="text" id="form-field-icon-2"> <i
									class="ace-icon fa fa-leaf green"></i>
								</span>
							</div>
						</div>

						<div class="space-4"></div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-6">Tooltip and help button</label>

							<div class="col-sm-9">
								<input data-rel="tooltip" type="text" id="form-field-6"
									placeholder="Tooltip on hover" title="" data-placement="bottom"
									data-original-title="Hello Tooltip!"> <span
									class="help-button" data-rel="popover" data-trigger="hover"
									data-placement="left" data-content="More details." title=""
									data-original-title="Popover on hover">?</span>
							</div>
						</div>

						<div class="space-4"></div>

						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right"
								for="form-field-tags">Tag input</label>

							<div class="col-sm-9">
								<div class="inline">
									<div class="tags">
										<span class="tag">Tag Input Control
											<button type="button" class="close">×</button>
										</span><span class="tag">Programmatically Added
											<button type="button" class="close">×</button>
										</span><input type="text" name="tags" id="form-field-tags"
											value="Tag Input Control" placeholder="Enter tags ..."
											style="display: none;"><input type="text"
											placeholder="Enter tags ...">
									</div>

								</div>
							</div>
						</div>

						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button">
									<i class="ace-icon fa fa-check bigger-110"></i> Submit
								</button>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
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