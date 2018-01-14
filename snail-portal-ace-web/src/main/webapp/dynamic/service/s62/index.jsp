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
												基金总体运作情况
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
    var cSatScoreChart = new FusionCharts({
        type: 'angulargauge',
        renderAt: 'chart-container1',
        width: '400',
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "基金总体运作情况",
                "subcaption": "2014",                
                "theme": "fint",
                "gaugeOuterRadius":"120",
                "gaugeInnerRadius":"90",
                "gaugeFillMix":"{dark-10}",
                "majorTMThickness" : "0",
                "majorTMHeight": "0"
            },
            "colorRange": {
                "color": [
                    {
                        "minValue": "0",
                        "maxValue": "70",
                        "code": "#8CBB2C"
                    },
                    {
                        "minValue": "70",
                        "maxValue": "85",
                        "code": "#F2C500"
                    },
                    {
                        "minValue": "85",
                        "maxValue": "100",
                        "code": "#F45B00"
                    }
                ]
            },
            "annotations": {                
                "showbelow": "2",
                "groups": [
                    {
                        "id": "transarc",                                                                        
                        "items": [
                            {
                                "type": "arc",
                                "radius": "140",
                                "borderColor":"#FFFFFF",
                                "innerRadius": "120",
                                "color": "#F45B00",
                                "alpha": "90",
                                "x": "200",
                                "y": "235",
                                "startangle": "0",
                                "endangle": "0"
                            }
                        ]
                    }
                ]
            },
            "dials": {
                "dial": [{
                    "value": "49"
                }]
            }
        }
    }).render();
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
												详细账户运作情况
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
												<div id="chart-container2">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var cscGauge = new FusionCharts({
        type: 'hlineargauge',
        renderAt: 'chart-container',
        width: '500',
        height: '100',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "统筹账户运作情况",
                "subcaption": "2014",                               
                "theme": "fint",
                "showValue": "0",                
                //Attributes to customize pointer on hover.
                "pointerBgHoverColor": "#ffffff",
                "pointerBgHoverAlpha": "80",
                "pointerHoverRadius": "12",
                "showBorderOnHover": "1",
                "pointerBorderHoverColor": "#333333",
                "pointerBorderHoverThickness": "2"
            },
            "colorRange": {
                "color": [{
                    "minValue": "0",
                        "maxValue": "30",
                        "label": "偏低",
                        "code": "#eeeeee"
                }, {
                    "minValue": "30",
                        "maxValue": "60",
                        "label": "正常",
                        "code": "#6baa01"
                }, {
                    "minValue": "60",
                    "maxValue": "85",
                    "label": "超支",
                    "code": "#f8bd19"
            	}, {
                    "minValue": "85",
                        "maxValue": "100",
                        "label": "严重超支",
                        "code": "#e44a00"
                }]
            },
            "pointers": {
                "pointer": [{
                    "value": "40"
                }]
            }
        }
    })
    .render();
});

FusionCharts.ready(function () {
    var cscGauge = new FusionCharts({
        type: 'hlineargauge',
        renderAt: 'chart-container2',
        width: '500',
        height: '100',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "家庭账户运作情况",
                "subcaption": "2014",                               
                "theme": "fint",
                "showValue": "0",                
                //Attributes to customize pointer on hover.
                "pointerBgHoverColor": "#ffffff",
                "pointerBgHoverAlpha": "80",
                "pointerHoverRadius": "12",
                "showBorderOnHover": "1",
                "pointerBorderHoverColor": "#333333",
                "pointerBorderHoverThickness": "2"
            },
            "colorRange": {
                "color": [{
                    "minValue": "0",
                        "maxValue": "30",
                        "label": "偏低",
                        "code": "#eeeeee"
                }, {
                    "minValue": "30",
                        "maxValue": "60",
                        "label": "正常",
                        "code": "#6baa01"
                }, {
                    "minValue": "60",
                    "maxValue": "85",
                    "label": "超支",
                    "code": "#f8bd19"
            	}, {
                    "minValue": "85",
                        "maxValue": "100",
                        "label": "严重超支",
                        "code": "#e44a00"
                }]
            },
            "pointers": {
                "pointer": [{
                    "value": "50"
                }]
            }
        }
    })
    .render();
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
												支出情况曲线
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container3">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var vstrChart = new FusionCharts({
        type: 'msline',
        renderAt: 'chart-container3',
        width: '500',
        height: '240',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "基金执行情况",
                "subCaption": "2014",
                "xAxisName": "时间",
                "yAxisName": "支出",
                "theme": "fint",
                "showValues": "0",
                //Setting automatic calculation of div lines to off
                "adjustDiv": "0",
                //Manually defining y-axis lower and upper limit
                "yAxisMaxvalue": "35000",
                "yAxisMinValue": "5000",
                //Setting number of divisional lines to 9
                "numDivLines": "9"
            },            
            "categories": [
                {
                    "category": [
                        {
                            "label": "1月"
                        }, 
                        {
                            "label": "2月"
                        }, 
                        {
                            "label": "3月"
                        }, 
                        {
                            "label": "4月"
                        }, 
                        {
                            "label": "5月"
                        }, 
                        {
                            "label": "6月"
                        }, 
                        {
                            "label": "7月"
                        }
                        , 
                        {
                            "label": "8月"
                        }, 
                        {
                            "label": "9月"
                        }, 
                        {
                            "label": "10月"
                        }, 
                        {
                            "label": "11月"
                        }, 
                        {
                            "label": "12月"
                        }
                    ]
                }
            ],            
            "dataset": [
                {
                    "seriesname": "实际支付",
                    "data": [
                             {
                                 "value": "3855306"
                             }, 
                             {
                                 "value": "3514538"
                             }, 
                             {
                                 "value": "5436437"
                             }, 
                             {
                                 "value": "4677005"
                             }, 
                             {
                                 "value": "4800832"
                             }, 
                             {
                                 "value": "4827635"
                             }, 
                             {
                                 "value": "4922347"
                             },
                             {
                                 "value": "2624860"
                             }
                    ]
                }, 
                {
                    "seriesname": "理论预测",
                    "data": [
                        {
                            "value": "5144754"
                        }, 
                        {
                            "value": "5469134"
                        }, 
                        {
                            "value": "7378554"
                        }, 
                        {
                            "value": "7063460"
                        }, 
                        {
                            "value": "7339808"
                        }, 
                        {
                            "value": "6001648"
                        }, 
                        {
                            "value": "7376112"
                        }, 
                        {
                            "value": "7451063"
                        }, 
                        {
                            "value": "6800844"
                        }, 
                        {
                            "value": "6778449"
                        }, 
                        {
                            "value": "6783358"
                        }, 
                        {
                            "value": "9803755"
                        }
                    ]
                }
            ]
        }
    }).render();
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
												支出条图
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												
												<div id="chart-container4">FusionCharts will render here</div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'stackedcolumn2d',
        renderAt: 'chart-container4',
        width: '500',
        height: '240',
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