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
												 疾病：
												<select class="easyui-combogrid" style="width:250px" 
												data-options="panelWidth: 400,idField: 'CODE',textField: 'NAME',url: '${pageContext.request.contextPath}/system/getDiseaseListByPcodeOrName.do',
												mode:'remote', 
												fitColumns:true,
												method: 'get',columns: [[
												{field:'CODE',title:'编码',width:80},
												{field:'NAME',title:'疾病名称',width:200}
												 ]]
												 ">   
												 </select>
												时间：
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
												转诊业务总览
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
                	"caption": "转诊业务情况",
                    "subCaption": "2014年",
                    "xAxisname": "转入医院",
                    "yAxisName": "转诊人次",
                    "numberPrefix": "",
                    "theme": "fint"
            },
                "categories": [{
                "category": [{
                    "label": "湖南省怀化二院靖州分院"
                }, {
                    "label": "遵义医学院附属医院"
                }, {
                    "label": "怀化市第二人民医院靖州分院"
                }, {
                    "label": "贵州省人民医院"
                }, {
                    "label": "贵阳医学院附属医院"
                }, {
                    "label": "重庆西南医院"
                }, {
                    "label": "铜仁市第一人民医院"
                }]
            }],
                "dataset": [{
                "seriesname": "转诊人次",
                    "data": [{
                    "value": "1475"
                }, {
                    "value": "696"
                }, {
                    "value": "473"
                }, {
                    "value": "295"
                }, {
                    "value": "256"
                }, {
                    "value": "229"
                }, {
                    "value": "181"
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
												转诊业务时间分布
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
												                "caption": "转诊业务时间分布",
												                "subCaption": "2013年",
												                "xAxisName": "时间",
												                "yAxisName": "转诊人次",
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
												                    "value": "126"
												                },{
												                    "value": "89"
												                },{
												                    "value": "118"
												                },{
												                    "value": "112"
												                },{
												                    "value": "95"
												                },{
												                    "value": "70"
												                },{
												                    "value": "265"
												                },{
												                    "value": "254"
												                },{
												                    "value": "209"
												                },{
												                    "value": "182"
												                },{
												                    "value": "208"
												                },{
												                    "value": "262"
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