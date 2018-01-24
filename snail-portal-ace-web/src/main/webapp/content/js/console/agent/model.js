var _colNames = [ '代理编号', '上级编号', '代理等级', '昵称', '性别', '金币数', '房卡数', '比武卡',
		'手机号', '状态', '最后登录时间', '注册日期' ];
var _colModel = function() {
	return [ {
		name : 'agentId',
		width : 30,
		sorttype : "int",
		editable : true,
		editoptions : {
			readonly : true
		}
	}, {
		name : 'parentAgentId',
		width : 30,
		editable : true,
		editoptions : {
			readonly : true
		}
	}, {
		name : 'agentLevel',
		width : 30,
		editable : true,
		edittype : "select",
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_06");
		},
		editoptions : {
			value : odparse("STATIC_DATA_06")
		}
	}, {
		name : 'name',
		width : 30,
		editable : true,
		editoptions : {}
	}, {
		name : 'sex',
		width : 20,
		editable : true,
		edittype : "select",
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_01");
		},
		editoptions : {
			value : odparse("STATIC_DATA_01")
		}
	}, {
		name : 'coins',
		width : 50,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "25",
			readonly : true
		}
	}, {
		name : 'gems',
		width : 30,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "25",
			readonly : true
		}
	}, {
		name : 'pkCard',
		width : 30,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "25",
			readonly : true
		}
	}, {
		name : 'mobile',
		width : 40,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "11",
			readonly : true
		}
	}, {
		name : 'status',
		width : 20,
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
		width : 70,
		sortable : true,
		editable : false,
		formatter : 'date',
		formatoptions : {
			srcformat : 'Y-m-d h:i:s',
			newformat : 'Y-m-d h:i:s'
		}
	}, {
		name : 'createTime',
		width : 70,
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