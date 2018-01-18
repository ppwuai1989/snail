var _colNames = [ '用户编号', '账户', '用户名', '头像', '性别', '金币数', '房卡数', '比武卡', '注册日期',
		'状态', '最后登录时间', '手机号', '微信号', '代理标识','推荐人编号' ];
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
				hidden : true,
				editoptions : {
					size : "20",
					maxlength : "30",
					readonly : true
				}
			},
			{
				name : 'name',
				width : 100,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "25",
					readonly : true
				}
			},
			{
				name : 'headImg',
				width : 32,
				editable : true,
				editoptions : {
					readonly : true
				},
				renderer : function(value) {					
						return "<img src='" + value + "' height='32' width='32'/>";							
				}

			},
			{
				name : 'sex',
				width : 30,
				editable : true,
				edittype : "select",
				editoptions : {
					value : "0:女;1:男"
				},
				renderer : function(value) {
					var rst = "";
					switch (value) {
					case '1':
						rst = "男";
						break;
					case '0':
						rst = "女";
						break;
					default:
						rst = "N/A";
					}
					return rst;
				}
			},
			{
				name : 'coins',
				width : 80,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "25",
					readonly : true
				}
			},
			{
				name : 'gems',
				width : 38,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "25",
					readonly : true
				}
			},
			{
				name : 'pkCard',
				width : 38,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "25",
					readonly : true
				}
			},
			{
				name : 'createTime',
				width : 80,
				editable : true,
				edittype : "datebox",
				editoptions : {
					style : 'height:30px',
					readonly : true
				},
				formatoptions : {
					srcformat : 'Y-m-d h:i:s',
					newformat : 'Y-m-d h:i:s'
				}
			}, {
				name : 'status',
				width : 30,
				editable : true,
				hidden : false,
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
				width : 80,
				sortable : true,
				editable : false,
				formatter : 'date',
				formatoptions : {
					srcformat : 'Y-m-d h:i:s',
					newformat : 'Y-m-d h:i:s'
				}
			}, {
				name : 'mobile',
				width : 60,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "11",
					readonly : true
				}
			}, {
				name : 'weChatId',
				width : 80,
				editable : true,
				hidden : true,
				editoptions : {
					size : "20",
					maxlength : "11",
					readonly : true
				}
			}, {
				name : 'isAgent',
				width : 40,
				editable : true,
				editoptions : {
					size : "20",
					maxlength : "11",
					readonly : true
				},
				renderer : function(value) {
					var rst = "";
					switch (value) {
					case '1':
						rst = "是";
						break;
					case '0':
						rst = "否";
						break;
					default:
						rst = "N/A";
					}
					return rst;
				}
			}, {
				name : 'introducer',
				width : 80,
				editable : true,
				hidden : true,
				editoptions : {
					size : "20",
					maxlength : "11",
					readonly : true
				}
			} ];
}
function aceSwitch(cellvalue, options, cell) {
	// console.log('aceSwitch');
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