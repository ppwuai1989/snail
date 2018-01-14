<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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


<script type="text/javascript"
	src="${pageContext.request.contextPath}/content/fusioncharts/js/gz/fusioncharts.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/content/fusioncharts/js/themes/fusioncharts.theme.fint.js"></script>

<body>
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header">
				<h5 class="widget-title smaller">设置查询条件</h5>

				<div class="widget-toolbar"></div>
			</div>

			<div class="widget-body">
				<div class="widget-main padding-6">
					<div>
						所属地区： <select class="easyui-combotree"
							style="width: 200px; height: 30px"
							data-options="url:'${pageContext.request.contextPath}/system/selectProvinceTreeList.do?pid=520201',required:false">
						</select> 医疗证号: <input type="text" name="cardNo" placeholder="医疗证号" />
						身份证号: <input type="text" name="idCard" placeholder="身份证号" /> 姓名:
						<input type="text" name="name" placeholder="姓名"
							style="width: 80px" />
					</div>
					<div>
						救助对象：<select  name="category">
							<option value="1">特困供养</option>
							<option value="2">低保长期保障人员</option>
							<option value="3">重点保障人员</option>
							<option value="4">低保一般保障人员</option>
						</select>
						<button class="btn btn-info" authority="false">
							查询 <i
								class="ace-icon fa fa-search  align-top bigger-125 icon-on-right"></i>
						</button>
					</div>

					<div id="toolbar" class="toolbar">


					</div>
				</div>
			</div>
		</div>



		<table class="table table-bordered table-striped">
			<thead class="thin-border-bottom">
				<tr>
					<th><i class="ace-icon fa fa-caret-right blue"></i>个人编号</th>

					<th><i class="ace-icon fa fa-caret-right blue"></i>姓名</th>

					<th><i class="ace-icon fa fa-caret-right blue"></i>性别</th>
					<th><i class="ace-icon fa fa-caret-right blue"></i>出生日期</th>
					<th><i class="ace-icon fa fa-caret-right blue"></i>与户主关系</th>
					<th><i class="ace-icon fa fa-caret-right blue"></i>身份证号</th>
					<th><i class="ace-icon fa fa-caret-right blue"></i>救助性质</th>
					<th><i class="ace-icon fa fa-caret-right blue"></i>医疗证号</th>
					<th><i class="ace-icon fa fa-caret-right blue"></i>地址</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>184880474</td>

					<td>彭桑贵</td>

					<td>男</td>
					<td>1951-07-11</td>
					<td>本人或户主</td>
					<td>520201195107110015</td>
					<td>特困供养</td>
					<td>5202010001010962</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>

				<tr>
					<td>185483267</td>

					<td>唐雪奥</td>

					<td>女</td>
					<td>2008-07-25</td>
					<td>女</td>
					<td>520201200807250020</td>
					<td>特困供养</td>
					<td>5202010001010979</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>

				<tr>
					<td>184150358</td>

					<td>杨再菊</td>

					<td>女</td>
					<td>1934-03-02</td>
					<td>本人或户主</td>
					<td>520201193403020824</td>
					<td>低保一般保障人员</td>
					<td>5202010001010917</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>

				<tr>
					<td>184599624</td>

					<td>胡俊霞</td>

					<td>女</td>
					<td>1981-02-17</td>
					<td>本人或户主</td>
					<td>133030198102176223</td>
					<td>低保一般保障人员</td>
					<td>5202010001010942</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>

				<tr>
					<td>184603052</td>

					<td>蒋兴春</td>

					<td>女</td>
					<td>1970-02-08</td>
					<td>配偶</td>
					<td>520201197002080023</td>
					<td>重点保障人员</td>
					<td>5202010001010943</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>

				<tr>
					<td>184711650</td>

					<td>饶海锋</td>

					<td>男</td>
					<td>2012-05-16</td>
					<td>孙子、孙女</td>
					<td></td>
					<td>低保长期保障人员</td>
					<td>5202010026010007</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>

				<tr>
					<td>184457812</td>

					<td>余波</td>

					<td>男</td>
					<td>1979-05-13</td>
					<td>父母</td>
					<td>52020119790513001x</td>
					<td>特困供养</td>
					<td>5202010001010785</td>
					<td>盘县杏山镇城江社区居民委员会一组</td>
				</tr>



			</tbody>
		</table>
		<table width="100%" style="background-color: #eeeeee">
			<tr>

				<td style="background-color: #eeeeee" width="60%">
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
				<td style="background-color: #eeeeee" align="center">1 - 20 共
					3,399 条</td>
			</tr>
		</table>



	</div>

<div id="dialog-message" class="hide">
			<form action="">
				<fieldset>
					救助对象： <select  name="category">
							<option value="1">特困供养</option>
							<option value="2">低保长期保障人员</option>
							<option value="3">重点保障人员</option>
							<option value="4">低保一般保障人员</option>
						</select>
				</fieldset>
				
			</form>
			
		</div>

	<jsp:include page="/dynamic/common/footer-1.jsp" />
	<jsp:include page="/dynamic/common/footer-2.jsp" />
	<script type="text/javascript">
	jQuery(function($) {
		$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
			_title: function(title) {
				var $title = this.options.title || '&nbsp;'
				if( ("title_html" in this.options) && this.options.title_html == true )
					title.html($title);
				else title.text($title);
			}
		}));
		$( "#btn-view-add" ).on('click', function(e) {
			e.preventDefault();
			
			var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
				modal: true,
				width:600,
				title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-cog'></i> 救助对象核定</h4></div>",
				title_html: true,
				buttons: [ 
					
					{
						html: "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 核定保存",
						"class" : "btn btn-info btn-xs",
						
						click: function() {
					
							
						} 
					},{
						html: "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 取消救助对象身份",
						"class" : "btn btn-info btn-xs",
						
						click: function() {
					
							
						} 
					},
					{
						html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
						"class" : "btn btn-xs",
						click: function() {
							$( this ).dialog( "close" ); 
						} 
					}
				]
			});
		});
	});
	
	</script>
</body>
</html>