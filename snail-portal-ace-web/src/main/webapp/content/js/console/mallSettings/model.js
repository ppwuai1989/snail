var _colNames = [ '编号', '商品', '定价', '数量', '初级代理奖励率', '中代理奖励率', '高级代理奖励率',
		'创建时间' ];
var _colModel = function() {
	return [ {
		name : 'id',
		index : 'id',
		width : 60,
		sortable : false,
		editable : false,
		editoptions : {
			readonly : true
		},
		hidden : true
	}, {
		name : 'goodsId',
		index : 'goodsId',
		width : 60,
		editable : true,
		edittype : "select",
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_10");
		},
		editoptions : {
			value : odparse("STATIC_DATA_10")
		}
	}, {
		name : 'price',
		index : 'price',
		width : 60,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "10"
		},
		editrules : {
			number : true,
			minValue : 1,
			required : true
		}
	}, {
		name : 'amount',
		index : 'amount',
		width : 80,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "20"
		},
		editrules : {
			number : true,
			minValue : 1,
			required : true
		}
	}, {
		name : 'juniorRate',
		index : 'juniorRate',
		width : 60,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "5"
		},
		editrules : {
			number : true,
			minValue : 1,
			required : true
		}
	}, {
		name : 'mediumRate',
		index : 'mediumRate',
		width : 60,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "5"
		},
		editrules : {
			number : true,
			minValue : 1,
			required : true
		}
	}, {
		name : 'seniorRate',
		index : 'seniorRate',
		width : 60,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "5"
		},
		editrules : {
			number : true,
			minValue : 1,
			required : true
		}
	}, {
		name : 'createTime',
		width : 100,
		sortable : true,
		editable : false,
		formatter : 'date',
		formatoptions : {
			srcformat : 'Y-m-d H:i:s',
			newformat : 'Y-m-d H:i:s'
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