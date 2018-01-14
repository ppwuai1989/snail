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
												日期：
												<input class="easyui-datetimebox"  style="width:100px">
												至
												<input class="easyui-datetimebox"  style="width:100px">
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
												地区发病情况分析
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<div id="chart-container-1">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container-1',
        width: '500',
        height: '250',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "麻江县地区发病情况分析",
                    "subCaption": "2014年",
                    "xAxisname": "疾病",
                    "yAxisName": "次数",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "上呼吸道感染"
                }, {
                    "label": "支气管炎"
                }, {
                    "label": "肺炎"
                }, {
                    "label": "正常分娩"
                }, {
                    "label": "盆腔炎,女性"
                }, {
                    "label": "急性支气管炎"
                }]
            }],
                "dataset": [{
                "seriesname": "发病次数",
                    "data": [{
                    "value": "11898"
                }, {
                    "value": "3239"
                }, {
                    "value": "2930"
                }, {
                    "value": "2533"
                }, {
                    "value": "2271"
                }, {
                    "value": "1911"
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
												医院发病情况分析
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container-2">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container-2',
        width: '500',
        height: '250',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "麻江县人民医院发病情况分析",
                    "subCaption": "2014年",
                    "xAxisname": "疾病",
                    "yAxisName": "次数",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "上呼吸道感染"
                }, {
                    "label": "支气管炎"
                }, {
                    "label": "肺炎"
                }, {
                    "label": "正常分娩"
                }, {
                    "label": "盆腔炎,女性"
                }, {
                    "label": "急性支气管炎"
                }]
            }],
                "dataset": [{
                "seriesname": "发病次数",
                    "data": [{
                    "value": "11898"
                }, {
                    "value": "3239"
                }, {
                    "value": "2930"
                }, {
                    "value": "2533"
                }, {
                    "value": "2271"
                }, {
                    "value": "1911"
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


<div class="row">
								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												疾病在地区发病情况分析
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<div id="chart-container-3">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container-3',
        width: '500',
        height: '250',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "麻江县疾病在地区发病情况分析",
                    "subCaption": "上呼吸道感染2014年",
                    "xAxisname": "地区",
                    "yAxisName": "次数",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "杏山镇"
                }, {
                    "label": "贤昌乡"
                }, {
                    "label": "坝芒乡"
                }, {
                    "label": "景阳乡"
                }, {
                    "label": "谷硐镇"
                }, {
                    "label": "下司镇"
                }]
            }],
                "dataset": [{
                "seriesname": "发病次数",
                    "data": [{
                    "value": "898"
                }, {
                    "value": "239"
                }, {
                    "value": "930"
                }, {
                    "value": "533"
                }, {
                    "value": "271"
                }, {
                    "value": "911"
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
												疾病在医院发病情况分析
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container-4">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container-4',
        width: '500',
        height: '250',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "麻江县医院发病情况分析",
                    "subCaption": "正常分娩2014年",
                    "xAxisname": "医院",
                    "yAxisName": "次数",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "麻江县疾控中心"
                }, {
                    "label": "凯里市人民医院"
                }, {
                    "label": "麻江县人民医院"
                }, {
                    "label": "麻江县妇幼保健所"
                }, {
                    "label": "麻江县仁康医院"
                }, {
                    "label": "麻江县华康医院"
                }]
            }],
                "dataset": [{
                "seriesname": "发病次数",
                    "data": [{
                    "value": "0"
                }, {
                    "value": "39"
                }, {
                    "value": "30"
                }, {
                    "value": "33"
                }, {
                    "value": "71"
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
							</div><!-- /.row -->

		
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>