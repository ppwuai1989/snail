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
												门诊医疗费用情况分析
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
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "门诊医疗费用情况分析",
                    "subCaption": "2014年",
                    "xAxisname": "医院",
                    "yAxisName": "费用",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "县人民医院"
                }, {
                    "label": "仁康医院"
                }, {
                    "label": "杏山镇中心卫生院"
                }, {
                    "label": "谷硐镇中心卫生院"
                }, {
                    "label": "博爱医院"
                }, {
                    "label": "宣威镇中心卫生院"
                }, {
                    "label": "景阳乡卫生院"
                }, {
                    "label": "坝芒乡卫生院"
                }]
            }],
                "dataset": [{
                "seriesname": "医疗费用",
                    "data": [{
                    "value": "2844174"
                }, {
                    "value": "420702"
                }, {
                    "value": "313554"
                }, {
                    "value": "305948"
                }, {
                    "value": "255724"
                }, {
                    "value": "195323"
                }, {
                    "value": "162904"
                }, {
                    "value": "129564"
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
												住院医疗费用情况分析
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
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "住院医疗费用情况分析",
                    "subCaption": "2014年",
                    "xAxisname": "医院",
                    "yAxisName": "费用",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "县人民医院"
                }, {
                    "label": "黔东南州人民医院"
                }, {
                    "label": "博爱医院"
                }, {
                    "label": "仁康医院"
                }, {
                    "label": "贵阳医学院第二附属医院"
                }, {
                    "label": "杏山镇中心卫生院"
                }, {
                    "label": "谷硐镇中心卫生院"
                }]
            }],
                "dataset": [{
                "seriesname": "医疗费用",
                    "data": [{
                    "value": "10893174"
                }, {
                    "value": "2156113"
                }, {
                    "value": "2034438"
                }, {
                    "value": "1996911"
                }, {
                    "value": "1411022"
                }, {
                    "value": "1076534"
                }, {
                    "value": "949990"
                }, {
                    "value": "759874"
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
												住院自费情况分析
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
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "住院自费情况分析",
                    "subCaption": "上呼吸道感染",
                    "xAxisname": "医院",
                    "yAxisName": "次数",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "县人民医院"
                }, {
                    "label": "博爱医院"
                }, {
                    "label": "仁康医院"
                }, {
                    "label": "华康医院"
                }, {
                    "label": "下司镇中心卫生院"
                }, {
                    "label": "杏山镇中心卫生院"
                }, {
                    "label": "宣威镇中心卫生院"
                }, {
                    "label": "谷硐镇中心卫生院"
                }]
            }],
                "dataset": [{
                "seriesname": "医疗费用",
                    "data": [{
                        "value": "1131"
                    }, {
                        "value": "905"
                    }, {
                        "value": "784"
                    }, {
                        "value": "760"
                    }, {
                        "value": "564"
                    }, {
                        "value": "496"
                    }, {
                        "value": "415"
                    }, {
                        "value": "392"
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