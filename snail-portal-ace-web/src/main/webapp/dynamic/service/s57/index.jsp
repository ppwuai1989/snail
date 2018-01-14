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
												账户类型：
												<select class="easyui-combobox">															
															<option value="1">家庭账户</option>
															<option value="2">统筹账户</option>
															<option value="3">风险账户</option>										
												</select>
												<button class="btn btn-info">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
												<button class="btn btn-info ">
													支出入账
													<i class="ace-icon fa fa-plus  align-top bigger-125 icon-on-right"></i>
												</button>
											</div>
										</div>
									</div>





<table class="table table-bordered table-striped">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																序号
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																支出金额
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																账户类型
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																支出类型
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																支出描述
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																入账日期
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																业务员
															</th>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>
																操作员
															</th>															
														</tr>
													</thead>

													<tbody>
														<tr>
															<td><span class="badge badge-info">1</span></td>

												
															<td class="hidden-480">
																<span class="label label-danger arrowed">
																	8653432.22  元
																</span>
															</td>
															<td>家庭账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-12-16
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>
														<tr>
															<td><span class="badge badge-info">2</span></td>

												
															<td class="hidden-480">
																<span class="label arrowed">
																	8653432.22  元
																</span>
															</td>
															<td>统筹账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-11-18
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>
														<tr>
															<td><span class="badge badge-info">3</span></td>

												
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">
																	8653432.22  元
																</span>
															</td>
															<td>统筹账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-11-18
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>
														<tr>
															<td><span class="badge badge-info">4</span></td>

												
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">
																	8653432.22  元
																</span>
															</td>
															<td>统筹账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-11-18
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>
														<tr>
															<td><span class="badge badge-info">5</span></td>

												
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">
																	8653432.22  元
																</span>
															</td>
															<td>统筹账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-11-18
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>
														<tr>
															<td><span class="badge badge-info">6</span></td>

												
															<td class="hidden-480">
																<span class="label arrowed">
																	8653432.22  元
																</span>
															</td>
															<td>统筹账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-11-18
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>
														<tr>
															<td><span class="badge badge-info">7</span></td>

												
															<td class="hidden-480">
																<span class="label label-danger arrowed">
																	8653432.22  元
																</span>
															</td>
															<td>统筹账户</td>
															<td>政府资助</td>
															<td>中央财政拨款</td>
															<td>
																2013-11-18
															</td>
															<td>
																张翰
															</td>
															<td>
																刘力
															</td>
														</tr>

														

														
													</tbody>
												</table>
												

		
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>