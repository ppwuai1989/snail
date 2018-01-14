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
												
											</div>
										</div>
									</div>


<div class="row">

<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												当前预算总执行情况
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container1">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'stackedcolumn2d',
        renderAt: 'chart-container1',
        width: '500',
        height: '300',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "当前预算执行情况",
                "subCaption": "2014",
                "xAxisname": "账户",
                "yAxisName": "基金",
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
                }]
            }],

            "dataset": [{
                "seriesname": "已执行",
                    "data": [{
                    "value": "3283723.55"
                }]
            }, {
                "seriesname": "总预算",
                    "data": [{
                    "value": "2283723.55"
                }]
            }, {
                "seriesname": "预算外金额",
                "data": [{
                "value": "983723.55"
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
												当前预算执行情况
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
                "caption": "执行情况",
                "subCaption": "2014",
                "xAxisname": "医院",
                "yAxisName": "已执行",
                "numberPrefix": "￥",
                //"showSum": "1",
                //To show revenue stack in Percentage distribution
                "stack100Percent": "1",
                "decimals": "0",
                "theme": "fint"
            },

            "categories": [{
                "category": [{
                    "label": "人民医院"
                }, {
                    "label": "大有乡卫生院"
                }, {
                    "label": "龙田镇卫生院"
                }, {
                    "label": "思旸镇卫生院"
                }]
            }],

            "dataset": [{
                "seriesname": "已执行",
                    "data": [{
                    "value": "21000"
                }, {
                    "value": "15000"
                }, {
                    "value": "13500"
                }, {
                    "value": "15000"
                }]
            }, {
                "seriesname": "总金额",
                    "data": [{
                    "value": "21400"
                }, {
                    "value": "14800"
                }, {
                    "value": "8300"
                }, {
                    "value": "11800"
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