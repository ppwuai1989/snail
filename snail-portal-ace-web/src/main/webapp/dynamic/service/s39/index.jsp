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
												处方日期：
												<input class="easyui-datetimebox"  style="width:100px">
												至
												<input class="easyui-datetimebox"  style="width:100px">
												<button class="btn btn-info">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
												<button class="btn btn-info ">
													全部重审
													<i class="ace-icon fa fa-cog  align-top bigger-125 icon-on-right"></i>
												</button>
												<button class="btn btn-info ">
													取消审核
													<i class="ace-icon glyphicon glyphicon-repeat  align-top bigger-125 icon-on-right"></i>
												</button>
											</div>
										</div>
									</div>


<span class="label label-xlg label-primary arrowed arrowed-right">
审核中心子系统实现审核人员的日常审核，可以根据上报时间、医疗机构、问题类型等各种条件检索，进行个案医保审核工作
</span>

	<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												门诊审核
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<table class="table table-bordered table-striped">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>就诊编号
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>患者姓名
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>医院
															</th>
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>年龄
															</th>
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>就诊日期 
															</th>
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>诊断
															</th>
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>费用 
															</th>
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>异常分 
															</th>
															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>操作
															</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>60642</td>

															<td>
																<span class="label label-warning arrowed arrowed-right">张美丽</span>
																
															</td>
															<td>麻江县华康医院</td>
															<td>21</td>
															<td>2014-06-01</td>
															<td>胃损伤</td>
															<td>762</td>
															<td>65</td>

															<td class="hidden-480">
																<div class="hidden-sm hidden-xs btn-group">
																	
			
																	<button class="btn btn-xs btn-info">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		查看明细
																	</button>
			
																	
			
																	<button class="btn btn-xs btn-warning">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		重审
																	</button>
																</div>																
															</td>
														</tr>
														<tr>
															<td>60642</td>

															<td>
																<span class="label label-danger arrowed">张美丽</span>
																
															</td>
															<td>麻江县华康医院</td>
															<td>21</td>
															<td>2014-06-01</td>
															<td>胃损伤</td>
															<td>762</td>
															<td>65</td>

															<td class="hidden-480">
																<div class="hidden-sm hidden-xs btn-group">
																	
			
																	<button class="btn btn-xs btn-info">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		查看明细
																	</button>
			
																	
			
																	<button class="btn btn-xs btn-warning">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		重审
																	</button>
																</div>																
															</td>
														</tr>
														<tr>
															<td>60642</td>

															<td>
																<span class="label label-info arrowed-right arrowed-in">张美丽</span>
																
															</td>
															<td>麻江县华康医院</td>
															<td>21</td>
															<td>2014-06-01</td>
															<td>胃损伤</td>
															<td>762</td>
															<td>65</td>

															<td class="hidden-480">
																<div class="hidden-sm hidden-xs btn-group">
																	
			
																	<button class="btn btn-xs btn-info">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		查看明细
																	</button>
			
																	
			
																	<button class="btn btn-xs btn-warning">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		重审
																	</button>
																</div>																
															</td>
														</tr>
														<tr>
															<td>60642</td>

															<td>
																<span class="label arrowed">张美丽</span>
																
															</td>
															<td>麻江县华康医院</td>
															<td>21</td>
															<td>2014-06-01</td>
															<td>胃损伤</td>
															<td>762</td>
															<td>65</td>

															<td class="hidden-480">
																<div class="hidden-sm hidden-xs btn-group">
																	
			
																	<button class="btn btn-xs btn-info">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		查看明细
																	</button>
			
																	
			
																	<button class="btn btn-xs btn-warning">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		重审
																	</button>
																</div>																
															</td>
														</tr>
														<tr>
															<td>60642</td>

															<td>
																<span class="label label-success arrowed-in arrowed-in-right">张美丽</span>
																
															</td>
															<td>麻江县华康医院</td>
															<td>21</td>
															<td>2014-06-01</td>
															<td>胃损伤</td>
															<td>762</td>
															<td>65</td>

															<td class="hidden-480">
																<div class="hidden-sm hidden-xs btn-group">
																	
			
																	<button class="btn btn-xs btn-info">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		查看明细
																	</button>
			
																	
			
																	<button class="btn btn-xs btn-warning">
																		<i class="ace-icon fa fa-cog bigger-120"></i>
																		重审
																	</button>
																</div>																
															</td>
														</tr>

														

														

														

														
													</tbody>
												</table>
												
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->							





		
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>