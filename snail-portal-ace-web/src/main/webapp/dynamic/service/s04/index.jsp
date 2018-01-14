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
												所属地区：
												<select class="easyui-combotree" style="width:150px;" data-options="url:'${pageContext.request.contextPath}/system/selectProvinceTreeList.do?pid=522635',required:false">
												</select>
												
												医疗机构：<select class="easyui-combogrid" style="width:150px;height:22px" name="orgId" 
													data-options="panelWidth: 500,idField: 'CODE',textField: 'NAME',url: '/portal/system/selectDepartment.do',
													mode:'local', 
													fitColumns:true,
													method: 'get',columns: [[
													{field:'CODE',title:'编码',width:80},
													{field:'NAME',title:'医院',width:120},
													{field:'AREANAME',title:'地区',width:80,align:'right'},
													{field:'LEVEL',title:'级别',width:80,align:'right'}
													 ]],fitColumns: true
													 "></select>
													 
												入院日期：<input class="easyui-datebox" name="dateStart" style="width:150px">
												
												出院日期：<input class="easyui-datebox" name="dateEnd" style="width:150px">
												
												<br>
												
												医疗证号：<input style="width:150px;" class="easyui-numberbox" validtype="account[15,18]" >
												
												身份证号：<input style="width:150px;" class="easyui-numberbox" validtype="account[15,18]" >
											
												
												　住院号：<input style="width:150px;" class="easyui-validatebox" validtype="account[15,18]" >
												
												　　姓名：<input style="width:150px;" class="easyui-validatebox" validtype="account[15,18]" >
												
												<button class="btn btn-info" authority="false">
													查询
													<i class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
												</button>
												
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
																<i class="ace-icon fa fa-caret-right blue"></i>姓名
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>性别
															</th>
															
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>身份证号码
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>家庭地址
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>补偿时间
															</th>
															
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>救助类型
															</th>
															
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>就医机构
															</th>
															
															<!-- <th>
																<i class="ace-icon fa fa-caret-right blue"></i>补偿机构
															</th> -->

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>医疗证卡号
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>疾病
															</th>
															
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>总费用
															</th>

															<!-- <th>
																<i class="ace-icon fa fa-caret-right blue"></i>自费部分
															</th> -->

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>救助金额
															</th>
														</tr>
													</thead>

													<tbody>
<tr>
					<td>1</td>
					<td>王鳌</td>
					<td>男</td>
					<td>520222195811090812</td>
					<td>盘县柏果镇岩脚村三组</td>
					<td>2009-11-17</td>
					<td>重点保障人员</td>
					<td>六盘水市第一人民医院</td>
					<td>5202220001010011</td>
					<td>齿槽骨炎</td>
					<td>300</td>
					<td>270</td>
				</tr>

	<tr>
					<td>2</td>
					<td>王凤</td>
					<td>男</td>
					<td>520222195811090812</td>
					<td>盘县柏果镇柏果村一组</td>
					<td>2009-11-17</td>
					<td>低保长期保障人员</td>
					<td>六盘水市人民医院</td>
					<td>5202220001010011</td>
					<td>下背痛</td>
					<td>100</td>
					<td>100</td>
				</tr>

	<tr>
					<td>3</td>
					<td>吴方豪</td>
					<td>男</td>
					<td>520222200107250417</td>
					<td>盘县柏果镇东风村六组</td>
					<td>2010-01-08</td>
					<td>低保一般保障人员</td>
					<td>六盘水市人民医院</td>
					<td>5202220001010447</td>
					<td>坶趾骨折</td>
					<td>1889.7</td>
					<td>1067.17</td>
				</tr>

	<tr>
					<td>4</td>
					<td>杨孟锡</td>
					<td>女</td>
					<td>520222194103167020</td>
					<td>盘县柏果镇东风村六组</td>
					<td>2010-01-28</td>
					<td>低保长期保障人员</td>
					<td>六盘水市人民医院</td>
					<td>5202220001010711</td>
					<td>颌下腺良性增生</td>
					<td>2616.8</td>
					<td>1956.37</td>
				</tr>

	<tr>
					<td>5</td>
					<td>袁桃静</td>
					<td>女</td>
					<td>520222194103167110</td>
					<td>盘县柏果镇东风村十一组</td>
					<td>2010-02-23</td>
					<td>重点保障人员</td>
					<td>六盘水市人民医院</td>
					<td>5202220001010520</td>
					<td>颌下腺肥大</td>
					<td>4279.3</td>
					<td>2239.65</td>
				</tr>

	<tr>
					<td>6</td>
					<td>王锡桂</td>
					<td>女</td>
					<td>520222194007080029</td>
					<td>盘县柏果镇东风村十一组</td>
					<td>2010-05-19</td>
					<td>低保一般保障人员</td>
					<td>贵阳医学院第三附属医院</td>
					<td>5202220001010243</td>
					<td>肾血管损伤</td>
					<td>10714.1</td>
					<td>5497.3</td>
				</tr>

	<tr>
					<td>7</td>
					<td>王泽深</td>
					<td>男</td>
					<td>520222196602220416</td>
					<td>盘县柏果镇联强村</td>
					<td>2010-05-28</td>
					<td>重点保障人员</td>
					<td>六盘水市人民医院</td>
					<td>5202220001010224</td>
					<td>足舟状骨骨折</td>
					<td>9374.5</td>
					<td>6628.15</td>
				</tr>

	<tr>
					<td>8</td>
					<td>刘华鹏</td>
					<td>男</td>
					<td>520222199509260014</td>
					<td>盘县柏果镇联强村</td>
					<td>2010-06-09</td>
					<td>低保一般保障人员</td>
					<td>黔东南州人民医院</td>
					<td>5202220001010455</td>
					<td>腰骶丛损伤</td>
					<td>367.2</td>
					<td>283.6</td>
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

		
		
<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>