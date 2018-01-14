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
												
												<button class="btn btn-info">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
											</div>
										</div>
									</div>



	<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title lighter">
												<i class="ace-icon fa  fa-leaf orange"></i>
												直补协议医院
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
																<i class="ace-icon fa fa-caret-right blue"></i>医院
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>协议时间
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>状态 
															</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>黔东南州人民医院</td>

															<td>
																<small>
																	<s class="red">2012-01-3至2014-12-31</s>
																</small>
																
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">正常</span>
															</td>
														</tr>

														<tr>
															<td>黔东南苗族侗族自治州精神病医院</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">2011-03-05至2014-12-31</b>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">正常</span>
															</td>
														</tr>

														<tr>
															<td>黔东南中西结合医院</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">2013-03-05至2014-12-31</b>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">正常</span>
															</td>
														</tr>

														<tr>
															<td>黔东南州中医院</td>

															<td>
																<small>
																	<s class="red">2013-09-21至2014-12-31</s>
																</small>
																<b class="green"></b>
															</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	<s>正常</s>
																</span>
															</td>
														</tr>

														<tr>
															<td>贵州省人民医院</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">2013-09-12至2014-12-31</b>
															</td>

															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">停用</span>
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