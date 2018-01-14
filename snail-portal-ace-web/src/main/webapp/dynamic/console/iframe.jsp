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
<div class="page-content">



<div class="row">

<div class="col-sm-5 ">
								
																					<div id="chart-container-1">FusionCharts will render here</div>
												<div id="indicatorDiv" style="color: #1790e1; width: 480px; font-family: 'Arial','Helvatica'; font-size: 14px; padding: 10px; "></div>
<script type="text/javascript">
FusionCharts.ready(function () {
    var ageGroupChart = new FusionCharts({
        type: 'pie2d',
        renderAt: 'chart-container-1',
        width: '500',
        height: '250',
        dataFormat: 'json',
        dataSource: {
            "chart": {
                "caption": "救助对象分布情况",
                "subCaption": "X县2015年",
                "enableSmartLabels": "0",
                "showPercentValues": "1",
                "showTooltip": "0",
                "decimals": "1",
                "theme": "fint"
            },
            "data": [
                {
                    "label": "杏山镇",
                    "value": "30"
                }, 
                {
                    "label": "谷硐镇",
                    "value": "60"
                }, 
                {
                    "label": "下司镇",
                    "value": "50"
                }, 
                {
                    "label": "宣威镇",
                    "value": "70"
                }
            ]
        },
        "events": {
            "dataplotrollover": function (evt, data) {
                var txt = "单位 :" + data.categoryLabel + ",<br/>救助对象 : " + data.value;
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

												
											
								</div><!-- /.col -->
								
	<div class="col-sm-5">
									
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
                "caption": "救助基金支出情况",
                "subCaption": "2015",
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
                    "seriesname": "2015年支付",
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
                    "seriesname": "2014年支出",
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
										
								</div><!-- /.col -->
															
								
<div class="row">
<div class="col-xs-12 col-sm-6 widget-container-col">

								
												<div class="widget-box widget-color-blue">
												
										<div class="widget-header">
											<h5 class="widget-title bigger lighter">
												<i class="ace-icon fa fa-table"></i>
												Tables & Colors
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
															<th>
																<i class="ace-icon fa fa-user"></i>
																User
															</th>

															<th>
																<i>@</i>
																Email
															</th>
															
														</tr>
													</thead>

													<tbody>
														<tr>
															<td class="">Alex</td>

															<td>
																<a href="#">alex@email.com</a>
															</td>

															
															
														</tr>

														<tr>
															<td class="">Fred</td>

															<td>
																<a href="#">fred@email.com</a>
															</td>

															
														</tr>

														<tr>
															<td class="">Jack</td>

															<td>
																<a href="#">jack@email.com</a>
															</td>

														</tr>

														<tr>
															<td class="">John</td>

															<td>
																<a href="#">john@email.com</a>
															</td>

															
														</tr>

														<tr>
															<td class="">James</td>

															<td>
																<a href="#">james@email.com</a>
															</td>

															
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										</div>

											
								</div><!-- /.col -->

								
							</div><!-- /.row -->


								
							
								
							


		
</div>
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


<jsp:include page="/dynamic/common/footer-2.jsp" />	
</body>
</html>