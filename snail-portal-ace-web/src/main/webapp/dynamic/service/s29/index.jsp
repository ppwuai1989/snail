<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="overview &amp; stats" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>企业资源管理-users</title>
</head>
<jsp:include page="../../common/common.jsp" />


<script type="text/javascript" src="${pageContext.request.contextPath}/content/fusioncharts/js/gz/fusioncharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/fusioncharts/js/themes/fusioncharts.theme.fint.js"></script>

<body>
<div class="page-content">
<div class="widget-box">
									<div class="widget-header">
											<h5 class="widget-title smaller">地区查询</h5>

											<div class="widget-toolbar">
												
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-6">
												所属地区：
												<select class="easyui-combotree" style="width:200px;" data-options="url:'${pageContext.request.contextPath}/system/selectProvinceTreeList.do?pid=522635',required:false">
												</select>
												机构级别：
												<select class="easyui-combobox"  >
															
															<option value="5">省</option>
															<option value="4">市</option>
															<option value="3">县</option>
															<option value="2">乡</option>
															<option value="1">村</option>											
												</select>
												住院天数：
												<input type="text" class="easyui-numberbox" value="100" data-options="min:0,precision:0">
												<button class="btn btn-info">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
											</div>
										</div>
									</div>


<div class="row">
								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												在院病人
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<div id="chart-container">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "麻江县在院病人",
                    "subCaption": "2014年",
                    "xAxisname": "医院",
                    "yAxisName": "在院病人",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "人民医院"
                }, {
                    "label": "博爱医院"
                }, {
                    "label": "杏山镇中心卫生院"
                }, {
                    "label": "谷硐镇中心卫生院"
                }, {
                    "label": "仁康医院"
                }, {
                    "label": "宣威镇中心卫生院"
                }, {
                    "label": "景阳乡卫生院"
                }, {
                    "label": "贵阳医学院第二附属医院"
                }, {
                    "label": "坝芒乡乐坪分院"
                }, {
                    "label": "坝芒乡卫生院"
                }]
            }],
                "dataset": [{
                "seriesname": "在院病人",
                    "data": [{
                    "value": "190"
                }, {
                    "value": "91"
                }, {
                    "value": "89"
                }, {
                    "value": "79"
                }, {
                    "value": "61"
                }, {
                    "value": "37"
                }, {
                    "value": "30"
                }, {
                    "value": "18"
                }, {
                    "value": "13"
                }, {
                    "value": "11"
                }]
            }]
        }
    });

    revenueChart.render();
});
</script>
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->

								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												在院病人住院天数
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<table class="table table-bordered table-striped">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>姓名
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>住院天数
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>医院
															</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>李田间</td>

															<td>
																<small>
																	<s class="red">93</s>
																</small>
																
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">麻江县人民医院</span>
															</td>
														</tr>

														<tr>
															<td>张小娴</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">45</b>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">麻江县华康医院</span>
															</td>
														</tr>

														<tr>
															<td>王汉</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">80</b>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">坝芒乡卫生院</span>
															</td>
														</tr>

														<tr>
															<td>田甜</td>

															<td>
																<small>
																	<s class="red">90</s>
																</small>
																<b class="green"></b>
															</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	<s>龙山乡卫生院</s>
																</span>
															</td>
														</tr>

														<tr>
															<td>赵坎坎</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">98</b>
															</td>

															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">景阳乡卫生院</span>
															</td>
														</tr>
													</tbody>
												</table>
												
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->
							</div><!-- /.row -->




		
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>