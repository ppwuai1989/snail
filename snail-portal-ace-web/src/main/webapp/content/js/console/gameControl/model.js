var _colNames = [ '编号', '游戏类型', '电脑庄牌率', '玩家庄牌率', '区域警戒线', '区域超线换牌率', '庄家抽水率',
		'玩家抽水率', '系统抽水上限', '系统放水下限', '系统状态转换时间', '状态' ];
var _colModel = function() {
	return [ {
		name : 'id',
		index : 'id',
		width : 30,
		sortable : false,
		editable : false,
		editoptions : {
			readonly : true
		},
		hidden:true
	}, {
		name : 'gameType',
		index : 'gameType',
		width : 50,
		editable : true,
		edittype : "select",
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_09");
		},
		editoptions : {
			value : odparse("STATIC_DATA_09")
		}
	}, {
		name : 'robotBankerRate',
		index : 'robotBankerRate',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'playerBankerRate',
		index : 'playerBankerRate',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'areaWarningLine',
		index : 'areaWarningLine',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'areaOverlineChangeRate',
		index : 'areaOverlineChangeRate',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'takeBankerRate',
		index : 'takeBankerRate',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'takePlayerRate',
		index : 'takePlayerRate',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'sysWinUpperLimit',
		index : 'sysWinUpperLimit',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'sysLoseLowerLimit',
		index : 'sysLoseLowerLimit',
		width : 50,
		editable : true,
		editrules : {
			number : true,			
			required : true
		}
	}, {
		name : 'sysStatusSwitchTime',
		index : 'sysStatusSwitchTime',
		width : 50,
		editable : true,
		editrules : {
			number : true,
			minValue : 0,
			required : true
		}
	}, {
		name : 'status',
		index : 'status',
		width : 50,
		editable : true,
		edittype : "checkbox",
		editoptions : {
			value : "1:0"
		},
		unformat : aceSwitch,
		renderer : function(value) {
			// console.log(value);
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
	} ];
}
function aceSwitch(cellvalue, options, cell) {
	console.log('aceSwitch');
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