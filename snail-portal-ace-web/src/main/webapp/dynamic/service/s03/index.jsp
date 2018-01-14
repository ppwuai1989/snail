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
											<h5 class="widget-title smaller">设置查询条件</h5>

											<div class="widget-toolbar">
												
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-6">
												　　年度：<select class="easyui-combobox" name="year" style="width:150px;"/>
												     <option value="2015"/>2015</option/>
										             <option value="2014"/>2014</option/>
										            <option value="2013"/>2013</option/>
										             <option value="2012"/>2012</option/>
										             <option value="2011"/>2011</option/>
										          </select/>
												
												就诊类型：<select class="easyui-combobox" name="type" style="width:150px;"/>
												     <option value="0"/>请选择</option/>
										             <option value="1"/>门诊</option/>
										             <option value="2"/>住院</option/>
										          </select/>
												
												救助类型：<select class="easyui-combobox" name="compasteType" style="width:150px;"/>
												     <option value="0"/>请选择</option/>
										             <option value="11"/>特困供养</option/>
										             <option value="14"/>低保长期保障人员</option/>
										             <option value="21"/>重点保障人员</option/>
										             <option value="22"/>低保一般保障人员</option/>
										          </select/>
										          
										                        
										       
												
												<button class="btn btn-info" authority="false">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
												
												<div id="toolbar" class="toolbar">

													<button class="btn btn-info" id="btn-view-add"
														authority="false">
														添加<i
															class="ace-icon fa fa-plus-square  align-top bigger-125 icon-on-right"></i>
													</button>
													<button class="btn btn-info" id="btn-view-edit"
														authority="false">
														变更<i
															class="ace-icon fa fa-edit  align-top bigger-125 icon-on-right"></i>
													</button>
													<button class="btn btn-warning" id="btn-view-del"
														authority="false">
														删除<i
															class="ace-icon glyphicon  glyphicon-remove  align-top bigger-125 icon-on-right"></i>
													</button>
													<button class="btn btn-purple" id="btn-view-da"
														authority="false">
														停用<i
															class="ace-icon glyphicon  glyphicon-cog  align-top bigger-125 icon-on-right"></i>
													</button>
													<button class="btn btn-warning" id="btn-view-initpwd"
														authority="false">
														启用<i
															class="ace-icon glyphicon  glyphicon-cog  align-top bigger-125 icon-on-right"></i>
													</button>
										
												</div>
											</div>
										</div>
									</div>



										<table class="table table-bordered table-striped">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>序号
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>年份
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>县区编号
															</th>
															
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>救助类型
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>就诊类型
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>补偿比例
															</th>
															
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>封顶
															</th>
																													
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>1</td>
															<td>2015</td>
															<td>520201</td>
															<td>特困供养</td>
															<td>门诊</td>
															<td>0.8</td>
															<td>30000</td>
														</tr>
														<tr>
															<td>2</td>
															<td>2015</td>
															<td>520202</td>
															<td>低保长期保障人员</td>
															<td>门诊</td>
															<td>0.9</td>
															<td>35000</td>
														</tr>
														<tr>
															<td>3</td>
															<td>2015</td>
															<td>520201</td>
															<td>重点保障人员</td>
															<td>门诊</td>
															<td>0.8</td>
															<td>25000</td>
														</tr>
														<tr>
															<td>4</td>
															<td>2015</td>
															<td>520201</td>
															<td>低保一般保障人员</td>
															<td>门诊</td>
															<td>1</td>
															<td>35000</td>
														</tr>
														<tr>
															<td>5</td>
															<td>2015</td>
															<td>520202</td>
															<td>低保一般保障人员</td>
															<td>门诊</td>
															<td>0.8</td>
															<td>10000</td>
														</tr>
														
														<tr>
															<td>6</td>
															<td>2015</td>
															<td>520201</td>
															<td>特困供养</td>
															<td>门诊</td>
															<td>0.8</td>
															<td>15000</td>
														</tr>
														<tr>
															<td>7</td>
															<td>2015</td>
															<td>520203</td>
															<td>特困供养</td>
															<td>门诊</td>
															<td>0.8</td>
															<td>20000</td>
														</tr>		
														
													</tbody>
												</table>



		<table width="100%" style="background-color:#eeeeee">
			<tr>
				
				<td style="background-color:#eeeeee" width="60%">
					<div class="dataTables_paginate paging_bootstrap">
						<ul class="pagination">
							<li class="prev disabled"><a href="#"><i
									class="fa fa-angle-double-left"></i></a></li>
							<li class="prev disabled"><a href="#"><i
									class="fa fa-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li class="next"><a href="#"><i
									class="fa fa-angle-right"></i></a></li>
							<li class="next"><a href="#"><i
									class="fa fa-angle-double-right"></i></a></li>
						</ul>
					</div>
				</td>
				<td style="background-color:#eeeeee" align="center">1 - 20 共 3,399 条 </td>
			</tr>
		</table>
		
</div>

<div id="win" iconCls="icon-save" title="My Window">  

</div> 
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<script type="text/javascript">	
		
	$("#btn-view-add").click(function(){
		$('#win').window({   
		    width:600,   
		    height:400,   
		    modal:true  
		});
	});



</script>

<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>