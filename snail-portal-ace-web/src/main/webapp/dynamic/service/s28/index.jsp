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
												慢性病制卡情况
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
    var ageGroupChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chart-container',
        width: '500',
        height: '200',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "慢性病制卡情况",
                "subCaption": "2014年",
                "enableSmartLabels": "0",
                "showPercentValues": "1",
                "showTooltip": "0",
                "decimals": "1",
                "theme": "fint"
            },
            "data": [
                {
                    "label": "杏山镇合医办",
                    "value": "300"
                }, 
                {
                    "label": "谷硐镇合医办",
                    "value": "600"
                }, 
                {
                    "label": "下司镇合医办",
                    "value": "400"
                }, 
                {
                    "label": "宣威镇合医办",
                    "value": "100"
                }
            ]
        },
        "events": {
            "dataplotrollover": function (evt, data) {
                var txt = "制卡单位 :" + data.categoryLabel + ",<br/>制卡数据量 : " + data.value;
               document.getElementById('indicatorDiv').innerHTML = txt;
            },
            "dataplotrollout": function (evt, data) {
                document.getElementById('indicatorDiv').innerHTML = 
                    "";
            },
           
            
        }
    });

    ageGroupChart.render();
    
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
												慢性病补偿业务时间分布
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
												        height: '200',
												        dataFormat: 'json',
												        dataSource: {
												            "chart": {
												                "caption": "麻江县慢性病补偿业务时间分布",
												                "subCaption": "2014年",
												                "xAxisName": "时间",
												                "yAxisName": "补偿人次(人)",
												                "numberPrefix": "",
												                "refreshinterval": "5",
												                "yaxisminvalue": "35",
												                "yaxismaxvalue": "36",
												                "numdisplaysets": "10",
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
												                    "value": "29304"
												                },{
												                    "value": "24850"
												                },{
												                    "value": "32623"
												                },{
												                    "value": "30540"
												                },{
												                    "value": "30222"
												                },{
												                    "value": "28194"
												                },{
												                    "value": "29658"
												                },{
												                    "value": "28413"
												                },{
												                    "value": "30762"
												                },{
												                    "value": "32305"
												                },{
												                    "value": "35039"
												                },{
												                    "value": "68970"
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




<!-- row2 -->
<div class="row">
								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												慢性病补偿业务机构分布
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
												<div id="indicatorDiv" style="color: #1790e1; width: 480px; font-family: 'Arial','Helvatica'; font-size: 14px; padding: 10px; "></div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var conversionChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chart-container-3',
        width: '500',
        height: '220',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "麻江县慢性病补偿业务机构分布",
                    "subcaption": "2014年",
                    "decimals": "1",
                    "labelDistance": "15",
                    "plotTooltext": "Success : $percentOfPrevValue",
                    //To show the values in percentage
                    "showPercentValues": "1",
                    "theme": "fint"
            },
                "data": [{
                "label": "人民医院",
                    "value": "259733"
            }, {
                "label": "仁康医院",
                    "value": "67824"
            }, {
                "label": "下司镇中心卫生院",
                    "value": "25064"
            }, {
                "label": "华康医院",
                    "value": "9047"
            }, {
                "label": "谷硐镇中心卫生院",
                    "value": "5716"
            }, {
                "label": "碧波乡卫生院",
                    "value": "5025"
            }, {
                "label": "景阳乡卫生院",
                "value": "4234"
        }, {
            "label": "坝芒乡卫生院",
            "value": "3883"
    }, {
        "label": "杏山镇中心卫生院",
        "value": "2099"
}, {
    "label": "黔东南中西医结合医院",
    "value": "1912"
}, {
    "label": "龙山乡卫生院",
    "value": "601"
}, {
    "label": "六枝博爱医院",
    "value": "248"
}, {
    "label": "贤昌乡卫生院",
    "value": "152"
}]
        }
    });

    conversionChart.render();
});
</script>
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->

								
							</div><!-- /.row -->
							<!-- end row2 -->
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>	
</html>