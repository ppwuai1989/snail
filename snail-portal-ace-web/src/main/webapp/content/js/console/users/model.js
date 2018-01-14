var _colNames = [ '用户编号', '账户','密码', '用户名', '性别', '身份证号', '所属机构','所属地区', '出生日期', '状态',
		'最后登录时间', '手机号', '电子邮箱', '用户级别', '座位', '创建时间' ];
var _colModel = function() {
	return [
			{
				name : 'userId',
				width : 80,
				sorttype : "int",
				editable : true,
				editoptions : {
					readonly : true
				}
			},
			{
				name : 'account',
				width : 100,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "30"
				}
			},
			{
				name : 'password',
				width : 80,
				hidden:true,
				editable : true,
				edittype:"password",
				editoptions : {
					size : "20",
					maxlength : "100",
					readonly:true
				},
				renderer : function(value) {
					return "***";
				}
			},
			{
				name : 'name',
				width : 100,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "25"
				}
			},
			{
				name : 'sex',
				width : 60,
				editable : true,
				edittype : "select",
				renderer : function(value) {
					return rsd(value, "STATIC_DATA_01");
				},
				editoptions : {
					value : odparse("STATIC_DATA_01")
				}
			},
			{
				name : 'idCard',
				width : 150,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "18"
				}
			},
			{
				name : 'departmentId',
				hidden:true,
				width : 120,
				editable : false,
				edittype : "combogrid",
				sorttype : "int",
				dataoptions : {
					panelWidth : 500,
					idField : 'CODE',
					textField : 'NAME',
					url : contextPath + '/system/selectDepartment.do',
					mode : 'remote',
					fitColumns : true,
					method : 'get',
					columns : [ [ {
						field : 'CODE',
						title : '编码',
						width : 80
					}, {
						field : 'NAME',
						title : '名称',
						width : 120
					}, {
						field : 'AREANAME',
						title : '地区',
						width : 80,
						align : 'right'
					}, {
						field : 'LEVEL',
						title : '级别',
						width : 80,
						align : 'right'
					} ] ]
				},
				editoptions : {
					style : 'width:165px'
				},
				renderer : function(value, cur) {
					return $.jgrid.getAccessor(cur, 'departmentName');
				}
			},
			 {
				name : 'areaCode',
				width : 150,
				hidden:true,
				sorttype : "int",
				editable : false,
				hidden:true,
				edittype : "combotree",
				editoptions : {
					style:'width:165px;line-height: 30px;height: 30px;'
				},
				dataoptions:{
					url:contextPath+'/system/selectProvinceTreeList.do?pid=${SystemUser.users.areaCode}',
					required:false
				},
				renderer : function(value, cur) {
					return $.jgrid.getAccessor(cur, 'areaName');
				}
			},
			{
				name : 'birthday',
				width : 100,
				editable : true,
				edittype : "datebox",
				editoptions : {
					style : 'height:30px'
				},
				dataoptions : {
					formatter : function(date) {
						var y = date.getFullYear();
						var m = date.getMonth() + 1;
						var d = date.getDate();
						return y + '-' + (m < 10 ? ('0' + m) : m) + '-'
								+ (d < 10 ? ('0' + d) : d);
					},
					parser : function(s) {
						if (!s)
							return new Date();
						var ss = (s.split('-'));
						var y = parseInt(ss[0], 10);
						var m = parseInt(ss[1], 10);
						var d = parseInt(ss[2], 10);
						if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
							return new Date(y, m - 1, d);
						} else {
							return new Date();
						}
					}
				},
				renderer : function(value) {
					return value == null ? "" : value.substring(0, 10);
				}
			}, {
				name : 'status',
				width : 90,
				editable : true,
				hidden:false,
				edittype : "checkbox",
				editoptions : {
					value : "1:0"
				},
				unformat : aceSwitch,
				renderer : function(value) {
					var rst = "";
					switch (value) {
					case '1':
						rst = "启用";
						break;
					case '0':
						rst = "禁用";
						break;
					default:
						rst = "N/A";
					}
					return rst;
				}
			}, {
				name : 'lastLoginTime',
				width : 150,
				sortable : true,
				editable : false,
				formatter:'date',
				formatoptions:{srcformat:'Y-m-d h:i:s',newformat: 'Y-m-d h:i:s'}
			}, {
				name : 'mobile',
				width : 150,				
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "11"
				}
			}, {
				name : 'email',
				width : 150,				
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "50"
				}
			}, {
				name : 'userLevel',
				width : 80,
				editable : false,
				hidden:true,
				editoptions : {
					size : "20",
					maxlength : "2"
				},
				formoptions : {
					elmprefix : "",
					elmsuffix : "<span style='color:red;font-size:16px;font-weight:800'>*</span>"
					},
					editrules : {
					required : true,
					}
			}, {
				name : 'seat',
				hidden:true,
				width : 150,
				editable : false,
				editoptions : {
					size : "20",
					maxlength : "50"
				}
			}, {
				name : 'createTime',
				width : 150,
				sortable : true,
				editable : false,
				formatter:'date',
				formatoptions:{srcformat:'Y-m-d h:i:s',newformat: 'Y-m-d h:i:s'}
			} 
			];
}
function aceSwitch(cellvalue, options, cell) {
	//console.log('aceSwitch');
	setTimeout(function() {
		$(cell).find('input[type=checkbox]').addClass(
				'ace ace-switch ace-switch-5').after(
				'<span class="lbl"></span>');
	}, 0);
}
// enable datepicker
function pickDate(cellvalue, options, cell) {
	setTimeout(function() {
		$(cell).find('input[type=text]').datepicker({
			format : 'yyyy-mm-dd',
			autoclose : true
		});
	}, 0);
}