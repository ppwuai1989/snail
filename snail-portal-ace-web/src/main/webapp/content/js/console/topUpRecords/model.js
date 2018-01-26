var _colNames = [ '记录编号', '玩家编号', '玩家名称', '充值方式', '支付金额(商城内)','实际支付金额','支付状态', '代理编号', '代理名称',
		'<span class="label label-lg label-pink arrowed-right">金币</span>',
		'<span class="label label-lg label-grey arrowed-right">房卡</span>',
		'<span class="label label-lg label-success arrowed-right">比武卡</span>'
		, '充值时间' ];
var _colModel = function() {
	return [ {
		name : 'id',
		index : 'id',
		width : 30,
		sortable : true,
		editable : false
	}, {
		name : 'userId',
		index : 'userId',	
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'userName',
		index : 'userName',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'way',
		index : 'way',
		width : 60,
		sortable : true,
		editable : false,
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_07");
		},
		editoptions : {
			value : odparse("STATIC_DATA_07")
		}
	}, {
		name : 'cost',
		index : 'cost',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'realPrice',
		index : 'realPrice',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'payStatus',
		index : 'payStatus',
		width : 60,
		sortable : true,
		editable : false,
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_08");
		},
		editoptions : {
			value : odparse("STATIC_DATA_08")
		}
	}, {
		name : 'agentId',
		index : 'agentId',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'agentName',
		index : 'agentName',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'coins',
		index : 'coins',
		width : 60,
		sortable : false,
		editable : false
	}, {
		name : 'gems',
		index : 'gems',
		width : 60,
		editable : false
	}, {
		name : 'pkCard',
		index : 'pkCard',
		width : 60,
		editable : false
	}, {
		name : 'createTime',
		width : 100,
		sortable : true,
		editable : false,
		formatter : 'date',
		formatoptions : {
			srcformat : 'Y-m-d h:i:s',
			newformat : 'Y-m-d h:i:s'
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