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
												机构级别：
												<select class="easyui-combobox"  >
															
															<option value="5">省</option>
															<option value="4">市</option>
															<option value="3">县</option>
															<option value="2">乡</option>
															<option value="1">村</option>											
												</select>
												住院天数：
												<input type="text" class="easyui-numberbox" value="100" data-options="min:0,precision:0">
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
												不合理就医
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding-4">
												
											<table class="table table-bordered table-striped">
													

													<tbody>
														<tr>
															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">疑似分解住院</span>
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">就诊频次异常</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">用药性别不符</span>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">服务性别不符</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-danger arrowed">慢性病提前取药</span>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">低标准入院</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">住院天数异常</span>
															</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	住院期间门诊
																</span>
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
												不合理诊疗
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
													

													<tbody>
														<tr>
															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">超量用药</span>
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">违反阶梯用药</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">违反配伍禁忌</span>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">药品种类异常</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-danger arrowed">无实质性治疗</span>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">疑似诊治不符</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">疑似过度医疗</span>
															</td>

															<td class="hidden-480">
																
															</td>
														</tr>

														
													</tbody>
												</table>
												
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
												不合理收费
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse">
													<i class="ace-icon fa fa-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding-4">
												
												<table class="table table-bordered table-striped">
													

													<tbody>
														<tr>
															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">重复检查</span>
															</td>

															<td class="hidden-480">
																<span class="label label-info arrowed-right arrowed-in">重复用药</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">重复收费</span>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-in-right">规避病种限价</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-danger arrowed">住院用药异常</span>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed">住院检查异常</span>
															</td>
														</tr>

														<tr>
															<td class="hidden-480">
																<span class="label label-warning arrowed arrowed-right">同日换药异常</span>
															</td>

															<td class="hidden-480">
																<span class="label arrowed">
																	服务频次异常
																</span>
															</td>
														</tr>

														
													</tbody>
												</table>
												
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->

								<div class="col-sm-5">
									
								</div><!-- /.col -->
							</div><!-- /.row -->

		
</div>

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>