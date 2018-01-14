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
												
													医院：
												<select class="easyui-combogrid" style="width:250px" 
												data-options="panelWidth: 500,idField: 'CODE',textField: 'NAME',url: '${pageContext.request.contextPath}/system/selectDepartment.do',
												mode:'local', 
												fitColumns:true,
												method: 'get',columns: [[
												{field:'CODE',title:'编码',width:80},
												{field:'NAME',title:'医院',width:120},
												{field:'AREANAME',title:'地区',width:80,align:'right'},
												{field:'LEVEL',title:'级别',width:80,align:'right'}
												 ]],fitColumns: true
												 ">   
												 </select>
												 时间：
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
												次均费用分析
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
												<div id="indicatorDiv" style="color: #1790e1; width: 480px; font-family: 'Arial','Helvatica'; font-size: 14px; padding: 10px; "></div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container',
        width: '500',
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "次均费用",
                    "subCaption": "上呼吸道感染",
                    "xAxisname": "医院",
                    "yAxisName": "次均费用",
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
                "seriesname": "在院病人",
                    "data": [{
                    "value": "1311"
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

								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												自费情况统计
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
    var revenueChart = new FusionCharts({
        type: 'mscolumn2d',
        renderAt: 'chart-container-right',
        width: '500',
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                	"caption": "自费情况",
                    "subCaption": "上呼吸道感染",
                    "xAxisname": "医院",
                    "yAxisName": "自费费用",
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
                "seriesname": "在院病人",
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
							
							
<div class="row">
								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												二次住院监管
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
											<table class="table table-bordered table-striped">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>医院
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>病例数
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>住院总费用
															</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>麻江县人民医院</td>

															<td class="hidden-480">
																<small>
																	<span class="label label-info arrowed-right arrowed-in">100</span>
																</small>
																
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">15.1万</span>
															</td>
														</tr>

														<tr>
															<td>麻江县华康医院</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">50</span>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">18.1万</span>
															</td>
														</tr>

														<tr>
															<td>坝芒乡卫生院</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">89</span>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">15.1万</span>
															</td>
														</tr>

														<tr>
															<td>龙山乡卫生院</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	<s>56</s>
																</span>
															</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	<s>15.1万</s>
																</span>
															</td>
														</tr>

														<tr>
															<td>景阳乡卫生院</td>

															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">45</span>
															</td>

															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">19.1万</span>
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
												补偿业务时间分布
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container-right2"></div>
												<script type="text/javascript">
												FusionCharts.ready(function () {
												    var stockPriceChart = new FusionCharts({
												        id: "stockRealTimeChart",
												        type: 'realtimeline',
												        renderAt: 'chart-container-right2',
												        width: '500',
												        height: '200',
												        dataFormat: 'json',
												        dataSource: {
												            "chart": {
												                "caption": "麻江县人民医院补偿业务情况时间分布",
												                "subCaption": "2014",
												                "xAxisName": "时间",
												                "yAxisName": "补偿费用",
												                "numberPrefix": "",
												                "refreshinterval": "5",
												                "yaxisminvalue": "35",
												                "yaxismaxvalue": "36",
												                "numdisplaysets": "12",
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
												                    "value": "1167101"
												                },{
												                    "value": "1111525"
												                },{
												                    "value": "1772398"
												                },{
												                    "value": "1408128"
												                },{
												                    "value": "1418283"
												                },{
												                    "value": "1588285"
												                },{
												                    "value": "1561286"
												                },{
												                    "value": "868622"
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