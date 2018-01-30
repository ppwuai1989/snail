var _colNames = [ '会员编号', '会员昵称', '局数', '回合数', '庄家', '初门', '天门', '末门', '金币余额',
		'输赢结果', '游戏时间' ];
var _colModel = function() {
	return [ {
		name : 'id',
		index : 'id',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'name',
		index : 'name',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'round',
		index : 'round',
		width : 30,
		sortable : true,
		editable : false
	}, {
		name : 'gameIndex',
		index : 'gameIndex',
		width : 30,
		sortable : true,
		editable : false
	}, {
		name : 'isBanker',
		index : 'isBanker',
		width : 30,
		sortable : true,
		editable : false,
		renderer : function(value) {
			return rsd(value, "STATIC_DATA_02");
		},
		editoptions : {
			value : odparse("STATIC_DATA_02")
		}
	}, {
		name : 'chu',
		index : 'chu',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'tian',
		index : 'tian',
		width : 60,
		sortable : false,
		editable : false
	}, {
		name : 'mo',
		index : 'mo',
		width : 60,
		editable : false
	}, {
		name : 'coins',
		index : 'coins',
		width : 60,
		editable : false
	}, {
		name : 'result',
		index : 'result',
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