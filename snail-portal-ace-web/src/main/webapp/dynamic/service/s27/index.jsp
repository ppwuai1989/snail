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
												参合年度：
												<select class="easyui-combobox"  >
															
															<option value="2014">2014</option>
															<option value="2013">2013</option>											
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
												筹资进度
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
                	"caption": "麻江县筹资进度",
                    "subCaption": "2014年",
                    "xAxisname": "地区",
                    "yAxisName": "筹资人数",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "贤昌乡"
                }, {
                    "label": "坝芒乡"
                }, {
                    "label": "宣威镇"
                }, {
                    "label": "龙山乡"
                }, {
                    "label": "谷硐镇"
                }, {
                    "label": "杏山镇"
                }]
            }],
                "dataset": [{
                "seriesname": "缴费人数",
                    "data": [{
                    "value": "16908"
                }, {
                    "value": "16063"
                }, {
                    "value": "34669"
                }, {
                    "value": "18171"
                }, {
                    "value": "24415"
                }, {
                    "value": "38773"
                }]
            }, {
                "seriesname": "档案人数",
                    "data": [{
                        "value": "18868"
                    }, {
                        "value": "18978"
                    }, {
                        "value": "42650"
                    }, {
                        "value": "19849"
                    }, {
                        "value": "29723"
                    }, {
                        "value": "47358"
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
												<i class="ace-icon fa  fa-leaf"></i>
												筹资时间分布
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container-right"></div>
												<script type="text/javascript">
												FusionCharts.ready(function () {
												    var stockPriceChart = new FusionCharts({
												        id: "stockRealTimeChart",
												        type: 'realtimeline',
												        renderAt: 'chart-container-right',
												        width: '500',
												        height: '300',
												        dataFormat: 'json',
												        dataSource: {
												            "chart": {
												                "caption": "麻江县筹资时间分布",
												                "subCaption": "2014年",
												                "xAxisName": "时间",
												                "yAxisName": "筹资人数",
												                "numberPrefix": "",
												                "refreshinterval": "2",
												                "yaxisminvalue": "0",
												                "yaxismaxvalue": "36",
												                "numdisplaysets": "13",
												                "labeldisplay": "rotate",
												                "showValues": "0",
												                "showRealTimeValue": "0",
												                "theme": "fint"
												            },
												            "categories": [{
												                "category": [{
												                    "label": "1月"
												                },{
												                    "label": "2月"
												                },{
												                    "label": "3月"
												                },{
												                    "label": "4月"
												                },{
												                    "label": "5月"
												                },{
												                    "label": "6月"
												                },{
												                    "label": "7月"
												                },{
												                    "label": "8月"
												                },{
												                    "label": "9月"
												                },{
												                    "label": "10月"
												                },{
												                    "label": "11月"
												                },{
												                    "label": "12月"
												                }]
												            }],
												            "dataset": [{
												                "data": [{
												                    "value": "69458"
												                },{
												                    "value": "7906"
												                },{
												                    "value": "2383"
												                },{
												                    "value": "4455"
												                },{
												                    "value": "198"
												                },{
												                    "value": "113"
												                },{
												                    "value": "121"
												                },{
												                    "value": "73"
												                },{
												                    "value": "0"
												                },{
												                    "value": "0"
												                },{
												                    "value": "0"
												                },{
												                    "value": "64294"
												                }]
												            }]
												        },
												       "events": {
												           "initialized": function (e) {
												               function addLeadingZero(num){
												                   return (num <= 9)? ("0"+num) : num;
												               }
												               function updateData() {
												            	   
												                    // Get reference to the chart using its ID
												                    var chartRef = FusionCharts("stockRealTimeChart"),
												                        // We need to create a querystring format incremental update, containing
												                        // label in hh:mm:ss format
												                        // and a value (random).
												                        currDate = new Date(),
												                        label = addLeadingZero(currDate.getHours()) + ":" +
												                                addLeadingZero(currDate.getMinutes()) + ":" +
												                                addLeadingZero(currDate.getSeconds()),
												                        // Get random number between 35.25 & 35.75 - rounded to 2 decimal places
												                        randomValue = Math.floor(Math.random()     
												                                                  * 50) / 100 + 35.25,
												                        // Build Data String in format &label=...&value=...
												                        strData = "&label=" + label 
												                                    + "&value=" 
												                                    + randomValue;
												                    // Feed it to chart.
												                    //chartRef.feedData(strData);
												                }

												               var myVar = setInterval(function () {
												                   updateData();
												               }, 5000);
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




		
</div>		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>