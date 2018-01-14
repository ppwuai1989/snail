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
												账套年度：
												<select class="easyui-combobox">															
															<option value="2014">2014</option>
															<option value="2013">2013</option>
															<option value="2012">2012</option>										
												</select>
												<button class="btn btn-info">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
												<button class="btn btn-info ">
													创建帐套
													<i class="ace-icon fa fa-plus  align-top bigger-125 icon-on-right"></i>
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
												账户余额总览
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
																<i class="ace-icon fa fa-caret-right blue"></i>账户类型
															</th>

															

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>余额
															</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>专户总余额</td>

															

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">
																	56450628  元
																</span>
															</td>
														</tr>

														<tr>
															<td>家庭账户余额</td>												
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">
																	5431092  元
																</span>
															</td>
														</tr>

														<tr>
															<td>统筹账户余额</td>
															<td class="hidden-480">
																<span class="label label-danger arrowed">43300889  元</span>
															</td>
														</tr>

														<tr>
															<td>风险金账户余额</td>
															<td class="hidden-480">
																<span class="label arrowed">
																	7718647 元
																</span>
															</td>
														</tr>

														
													</tbody>
												</table>
												
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->
								
								
								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												账户使用情况总览
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
        type: 'stackedcolumn2d',
        renderAt: 'chart-container',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "账户使用情况总览",
                "subCaption": "2014",
                "xAxisname": "账户",
                "yAxisName": "使用",
                "numberPrefix": "￥",
                "showSum": "1",
                //To show revenue stack in Percentage distribution
               // "stack100Percent": "1",
                //"decimals": "0",
                "theme": "fint"
            },

            "categories": [{
                "category": [{
                    "label": "全年专户"
                }, {
                    "label": "家庭账户"
                }, {
                    "label": "统筹账户"
                }, {
                    "label": "风险金账户"
                }]
            }],

            "dataset": [{
                "seriesname": "已使用",
                "data": [{
                "value": "34658963"
            }, {
                "value": "773381"
            }, {
                "value": "33885582"
            }, {
                "value": "0"
            }]
        }, {
            "seriesname": "余额",
                "data": [{
                "value": "56450568"
            }, {
                "value": "5431092"
            }, {
                "value": "43300889"
            }, {
                "value": "7718647"
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

								
							</div><!-- /.row -->




		
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>