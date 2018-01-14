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
<jsp:include page="/dynamic/common/common.jsp" />


<script type="text/javascript" src="${pageContext.request.contextPath}/content/fusioncharts/js/gz/fusioncharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/fusioncharts/js/themes/fusioncharts.theme.fint.js"></script>

<body>
			<!-- /section:basics/sidebar -->
			<div class="page-content">
		

			
					
					

				
							<!-- PAGE CONTENT BEGINS -->
							<div class="row">
								<div class="col-xs-12 col-sm-6 widget-container-col">
									<!-- #section:custom/widget-box -->
									<div class="widget-box">
										<div class="widget-header">
											<h5 class="widget-title">救助类型分布情况</h5>

											<!-- #section:custom/widget-box.toolbar -->
											<div class="widget-toolbar">
												<div class="widget-menu">
													<a href="#" data-action="settings" data-toggle="dropdown">
														<i class="ace-icon fa fa-bars"></i>
													</a>

													<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
														<li>
															<a data-toggle="tab" href="#dropdown1">Option#1</a>
														</li>

														<li>
															<a data-toggle="tab" href="#dropdown2">Option#2</a>
														</li>
													</ul>
												</div>

												<a href="#" data-action="fullscreen" class="orange2">
													<i class="ace-icon fa fa-expand"></i>
												</a>

												<a href="#" data-action="reload">
													<i class="ace-icon fa fa-refresh"></i>
												</a>

												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>

												<a href="#" data-action="close">
													<i class="ace-icon fa fa-times"></i>
												</a>
											</div>

											<!-- /section:custom/widget-box.toolbar -->
										</div>

										<div class="widget-body">
											<div class="widget-main">
														<div id="chart-container-1">FusionCharts will render here</div>
											<script type="text/javascript">
var chartData = {};
var nowYear='';
FusionCharts.ready(function () {
	//chartGetData();
});
function chartGetData(){
	d = new Date(),
    nowYear = +d.getFullYear();
	var array=new Array();
	var datas;
	$.ajax({
		type : "post",
		url : contextPath+"/data/findPersonData.do",
		data : {year:nowYear},
		success : function(rst) {
        if(rst.state==true){
        	datas=rst.list;
        	for(var i=0; i<datas.length; i++){
        		var json={};
        		json.label=datas[i].NAME+'：'+datas[i].PRONUM+'人';
        		json.value=datas[i].PRONUM;
        		array.push(json);
        		
            }
        	 chartData["chart"]=
        	 {       "caption":rst.response+nowYear ,
                     "subCaption": "",
                     "enableSmartLabels": "0",
                     "showPercentValues": "1",
                     "showTooltip": "0",
                     "decimals": "1",
                     "theme": "fint"	
        		};
        	chartData["data"]=array;
        	makeChart();
        	//console.log(array);
        	}
		}
	});
	
}
function makeChart(){
	 var ageGroupChart = new FusionCharts({
	        type: 'pie2d',
	        renderAt: 'chart-container-1',
	        width: '500',
	        height: '175',
	        dataFormat: 'json',
	        dataSource: chartData,
	        "events": {
	            "dataplotrollover": function (evt, data) {
	                var txt = "单位 :" + data.categoryLabel + ",<br/>救助对象 : " + data.value;
	              // document.getElementById('indicatorDiv').innerHTML = txt;
	            },
	            "dataplotrollout": function (evt, data) {
	               // document.getElementById('indicatorDiv').innerHTML = 
	                    "";
	            },
	           
	        }
	    });
	ageGroupChart.render(); 
	
}
</script>
												
											</div>
										</div>
									</div>

									<!-- /section:custom/widget-box -->
								</div>

								<div class="col-xs-12 col-sm-6 widget-container-col">
									<div class="widget-box widget-color-blue">
										<!-- #section:custom/widget-box.options -->
										<div class="widget-header">
											<h5 class="widget-title bigger lighter">
												<i class="ace-icon fa fa-table"></i>
												系统通知<a href="#" onClick="moreNotice()" style="color:#ffffff;">>></a> 
											</h5>

											<div class="widget-toolbar widget-toolbar-light no-border">
												<select id="simple-colorpicker-1" class="hide">
													<option selected="" data-class="blue" value="#307ECC">#307ECC</option>
													<option data-class="blue2" value="#5090C1">#5090C1</option>
													<option data-class="blue3" value="#6379AA">#6379AA</option>
													<option data-class="green" value="#82AF6F">#82AF6F</option>
													<option data-class="green2" value="#2E8965">#2E8965</option>
													<option data-class="green3" value="#5FBC47">#5FBC47</option>
													<option data-class="red" value="#E2755F">#E2755F</option>
													<option data-class="red2" value="#E04141">#E04141</option>
													<option data-class="red3" value="#D15B47">#D15B47</option>
													<option data-class="orange" value="#FFC657">#FFC657</option>
													<option data-class="purple" value="#7E6EB0">#7E6EB0</option>
													<option data-class="pink" value="#CE6F9E">#CE6F9E</option>
													<option data-class="dark" value="#404040">#404040</option>
													<option data-class="grey" value="#848484">#848484</option>
													<option data-class="default" value="#EEE">#EEE</option>
												</select>
											</div>
										</div>

										<!-- /section:custom/widget-box.options -->
										<div class="widget-body">
						<div class="widget-main no-padding">
							<table class="table table-striped table-bordered table-hover">
								<thead class="thin-border-bottom">
									<tr>
										<th>序号</th>

										<th>标题</th>
										<th class="hidden-480">时间</th>
									</tr>
								</thead>
								<tbody id="notice-list-grid">

								</tbody>
							</table>
						</div>
					</div>
									</div>
								</div><!-- /.span -->
							</div><!-- /.row -->

							<div class="space-12"></div>

			
							<!-- PAGE CONTENT BEGINS -->
							<div class="row">
													<div class="col-xs-12 col-sm-6 widget-container-col">
		<!-- #section:custom/widget-box -->
									<div class="widget-box">
										<div class="widget-header">
											<h5 class="widget-title">计生救助支出情况</h5>

											<!-- #section:custom/widget-box.toolbar -->
											<div class="widget-toolbar">
												<div class="widget-menu">
													<a href="#" data-action="settings" data-toggle="dropdown">
														<i class="ace-icon fa fa-bars"></i>
													</a>

													<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
														<li>
															<a data-toggle="tab" href="#dropdown1">Option#1</a>
														</li>

														<li>
															<a data-toggle="tab" href="#dropdown2">Option#2</a>
														</li>
													</ul>
												</div>

												<a href="#" data-action="fullscreen" class="orange2">
													<i class="ace-icon fa fa-expand"></i>
												</a>

												<a href="#" data-action="reload">
													<i class="ace-icon fa fa-refresh"></i>
												</a>

												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>

												<a href="#" data-action="close">
													<i class="ace-icon fa fa-times"></i>
												</a>
											</div>

											<!-- /section:custom/widget-box.toolbar -->
										</div>

										<div class="widget-body">
											<div class="widget-main">						
									<div id="chart-container3">FusionCharts will render here</div>
<script type="text/javascript">
var datasources={};
var array1 =new Array();
FusionCharts.ready(function () {
	//getChartData();
});
function makeFusionChart(){
	var vstrChart = new FusionCharts({
        type: 'msline',
        renderAt: 'chart-container3',
        width: '500',
        height: '240',
        dataFormat: 'json',
        dataSource: datasources,          
    });
	vstrChart.render();
}
function getChartData(){
	var array =new Array();
	$.ajax({
		type : "post",
		url : contextPath+"/data/findFamilyPlanningSalvationCost.do",
		data : {year:nowYear},
		success : function(rst) {
        if(rst.state==true){
        	datas=rst.list;
        	for(var i=0; i<datas.length; i++){
        		var json={};
        		json.value=datas[i].MONEY;
        		array.push(json);
        		
            }
        	datasources["chart"]=
        	 {      "caption": rst.response+nowYear,
                     "subCaption": "",
                     "xAxisName": "时间",
                     "yAxisName": "支出",
                     "theme": "fint",
                     "showValues": "0",
                     //Setting automatic calculation of div lines to off
                     "adjustDiv": "0",
                     //Manually defining y-axis lower and upper limit
                     "yAxisMaxvalue": "35000",
                     "yAxisMinValue": "5000",
                     "numDivLines": "9"	
        		};
        	datasources["categories"]=[
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
        	                       ];
        	var obj={};
        	obj.seriesname=nowYear+"年计生救助支付情况";
        	obj.data=array;
        	array1.push(obj);
        	//array1.push({"data":array});
        	//getOutpData();
        	//console.log(JSON.stringify(array1));
        	datasources["dataset"]=array1;
        	makeFusionChart();
        	}
		}
	});
}
function getOutpData(){
	var array =new Array();
	$.ajax({
		type : "post",
		url : contextPath+"/data/findOutpCostByAreacode.do",
		data : {year:nowYear},
		success : function(rst) {
        if(rst.state==true){
        	datas=rst.list;
        	for(var i=0; i<datas.length; i++){
        		var json={};
        		json.value=datas[i].MONEY;
        		array.push(json);
            }
        	var obj1={};
        	obj1.seriesname=nowYear+"年门诊支付";
        	obj1.data=array;
        	//array1.push({"seriesname":nowYear+"年门诊支付"});
        	array1.push(obj1);
        	datasources["dataset"]=array1;
        	makeFusionChart();
        	//console.log(JSON.stringify(array1));
        	}
		}
	});
	
}
</script>
</div></div></div>
										
								</div><!-- /.span -->
								<div class="col-xs-12 col-sm-6 widget-container-col">
									<!-- #section:custom/widget-box -->
									<div class="widget-box">
										<div class="widget-header">
											<h5 class="widget-title">民政救助支出情况</h5>

											<!-- #section:custom/widget-box.toolbar -->
											<div class="widget-toolbar">
												<div class="widget-menu">
													<a href="#" data-action="settings" data-toggle="dropdown">
														<i class="ace-icon fa fa-bars"></i>
													</a>

													<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
														<li>
															<a data-toggle="tab" href="#dropdown1">Option#1</a>
														</li>

														<li>
															<a data-toggle="tab" href="#dropdown2">Option#2</a>
														</li>
													</ul>
												</div>

												<a href="#" data-action="fullscreen" class="orange2">
													<i class="ace-icon fa fa-expand"></i>
												</a>

												<a href="#" data-action="reload">
													<i class="ace-icon fa fa-refresh"></i>
												</a>

												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>

												<a href="#" data-action="close">
													<i class="ace-icon fa fa-times"></i>
												</a>
											</div>

											<!-- /section:custom/widget-box.toolbar -->
										</div>

										<div class="widget-body">
						<div class="widget-main">
							<div id="chart-container4">FusionCharts will render here</div>
							<script type="text/javascript">
var allDataSources={};
var array2 =new Array();
FusionCharts.ready(function () {
	//getAllChartData();
});
function makeFusionChart2(){
	var vstrChart2 = new FusionCharts({
        type: 'msline',
        renderAt: 'chart-container4',
        width: '500',
        height: '240',
        dataFormat: 'json',
        dataSource: allDataSources,          
    });
	vstrChart2.render();
}
function getAllChartData(){
	var arrays =new Array();
	$.ajax({
		type : "post",
		url : contextPath+"/data/findCivilAffairsSalvationCost.do",
		data : {year:nowYear},
		success : function(rst) {
        if(rst.state==true){
        	datas=rst.list;
        	for(var i=0; i<datas.length; i++){
        		var json={};
        		json.value=datas[i].MONEY;
        		arrays.push(json);
        		
            }
        	allDataSources["chart"]=
        	 {      "caption": rst.response+nowYear,
                     "subCaption": "",
                     "xAxisName": "时间",
                     "yAxisName": "支出",
                     "theme": "fint",
                     "showValues": "0",
                     //Setting automatic calculation of div lines to off
                     "adjustDiv": "0",
                     //Manually defining y-axis lower and upper limit
                     "yAxisMaxvalue": "35000",
                     "yAxisMinValue": "5000",
                     "numDivLines": "9"	
        		};
        	allDataSources["categories"]=[
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
        	                       ];
        	var obj3={};
        	obj3.seriesname=nowYear+"年民政救助支付情况";
        	obj3.data=arrays;
        	//array2.push({"seriesname":nowYear+"年总支付情况,"});
        	array2.push(obj3);
        	allDataSources["dataset"]=array2;
        	makeFusionChart2();
        	//console.log(JSON.stringify(datasources));
        	//console.log(JSON.stringify(array2));
        	}
		}
	});
}
</script>
						</div>
					</div>
									</div>

									<!-- /section:custom/widget-box -->
								</div>

		
							</div><!-- /.row -->
							
							
				
			</div><!-- /.main-content -->

<jsp:include page="/dynamic/common/footer-1.jsp" />
		<script type="text/javascript">
			jQuery(function($) {
			
				$('#simple-colorpicker-1').ace_colorpicker({pull_right:true}).on('change', function(){
					var color_class = $(this).find('option:selected').data('class');
					var new_class = 'widget-box';
					if(color_class != 'default')  new_class += ' widget-color-'+color_class;
					$(this).closest('.widget-box').attr('class', new_class);
				});
			
			
				// scrollables
				$('.scrollable').each(function () {
					var $this = $(this);
					$(this).ace_scroll({
						size: $this.data('height') || 100,
						//styleClass: 'scroll-left scroll-margin scroll-thin scroll-dark scroll-light no-track scroll-visible'
					});
				});
				$('.scrollable-horizontal').each(function () {
					var $this = $(this);
					$(this).ace_scroll(
					  {
						horizontal: true,
						styleClass: 'scroll-top',//show the scrollbars on top(default is bottom)
						size: $this.data('width') || 500,
						mouseWheelLock: true
					  }
					).css({'padding-top': 12});
				});
				
				$(window).on('resize.scroll_reset', function() {
					$('.scrollable-horizontal').ace_scroll('reset');
				});
			
			
				/**
				//or use slimScroll plugin
				$('.slim-scrollable').each(function () {
					var $this = $(this);
					$this.slimScroll({
						height: $this.data('height') || 100,
						railVisible:true
					});
				});
				*/
				
			
				/**$('.widget-box').on('setting.ace.widget' , function(e) {
					e.preventDefault();
				});*/
			
				/**
				$('.widget-box').on('show.ace.widget', function(e) {
					//e.preventDefault();
					//this = the widget-box
				});
				$('.widget-box').on('reload.ace.widget', function(e) {
					//this = the widget-box
				});
				*/
			
				//$('#my-widget-box').widget_box('hide');
			
				
			
				// widget boxes
				// widget box drag & drop example
			    $('.widget-container-col').sortable({
			        connectWith: '.widget-container-col',
					items:'> .widget-box',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					start: function(event, ui){
						//when an element is moved, it's parent becomes empty with almost zero height.
						//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
						ui.item.parent().css({'min-height':ui.item.height()})
						//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
					},
					update: function(event, ui) {
						ui.item.parent({'min-height':''})
						//p.style.removeProperty('background-color');
					}
			    });
			
			});
		</script>
<script>
function moreNotice(){
	parent.addPanel('公告','notice/moreNotice.jsp',true)
}
</script>

<jsp:include page="/dynamic/common/footer-2.jsp" />	
<script
		src="${pageContext.request.contextPath}/content/js/console/main/loadNotice.js"></script>
</body>
</html>