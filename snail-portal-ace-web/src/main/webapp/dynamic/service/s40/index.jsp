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
											<h5 class="widget-title smaller">查询设置</h5>

											<div class="widget-toolbar">
												
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-6">
												日期：
												<input class="easyui-datetimebox"  style="width:100px">
												至
												<input class="easyui-datetimebox"  style="width:100px">
												
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
												科室：
												<select class="easyui-combobox"  >															
														<option value="">全部</option>																										
												</select>
												医生：
												<select class="easyui-combobox"  >															
														<option value="">全部</option>																										
												</select>
												状态：
												<select class="easyui-combobox"  >															
														<option value="">全部</option>																										
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
												门诊分析
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
																<i class="ace-icon fa fa-caret-right blue"></i>类型
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>处方数
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>五级处方数
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>四级处方数
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>三级处方数
															</th>																														
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>状态 
															</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>单位饮片审查</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">正常</span>
															</td>
														</tr>

														<tr>
															<td>单次药品超量</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">正常</span>
															</td>
														</tr>

														<tr>
															<td>报销类型审查</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">正常</span>
															</td>
														</tr>

														<tr>
															<td>服务性别审查</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	正常
																</span>
															</td>
														</tr>

														<tr>
															<td>服务频次审查</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>

															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">停用</span>
															</td>
														</tr>
														<tr>
															<td>累计药品超量</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>
															<td>1（0.0%）</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">正常</span>
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
												门诊综合分析
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="chart-container"></div>
												<script type="text/javascript">
												FusionCharts.ready(function () {
												    var demographicsChart = new FusionCharts({
												        type: 'pie3d',
												        renderAt: 'chart-container',
												        width: '600',
												        height: '300',
												        dataFormat: 'json',
												        dataSource: {
												            "chart": {
												                "caption": "麻江县人民医院门诊综合分析",
												                "subCaption": "2014-07-01至2014-07-31",
												                "startingAngle": "120",
												                "showLabels": "0",
												                "showLegend": "1",
												                "enableMultiSlicing": "0",
												                "slicingDistance": "15",
												                //To show the values in percentage
												                "showPercentValues": "1",
												                "showPercentInTooltip": "0",
												                "plotTooltext": "Age group : $label<br>Total visit : $datavalue",
												                "theme": "fint"
												            },
												            "data": [{
												                "label": "饮片用量审查",
												                "value": "0.1"
												            }, {
												                "label": "重复用药",
												                "value": "0.2"
												            }, {
												                "label": "累计药品超量",
												                "value": "0.3"
												            }, {
												                "label": "阶梯用药审查",
												                "value": "1.3"
												            }, {
												                "label": "报销类型审查",
												                "value": "2.6"
												            }, {
												                "label": "限适应症",
												                "value": "2.8"
												            }, {
												                "label": "单次药品超量",
												                "value": "10.7"
												            }, {
												                "label": "门诊频次异常",
												                "value": "26.3"
												            }, {
												                "label": "限住院用药",
												                "value": "55.7"
												            }]
												        }
												    });
												    demographicsChart.render();
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