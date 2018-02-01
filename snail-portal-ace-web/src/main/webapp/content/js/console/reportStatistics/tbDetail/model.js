var _colNames = [ '会员编号', '昵称', '游戏次数', '上庄次数', '初门次数','初门金币数', '天门次数','天门金币数',
		'末门次数','末门金币数','输赢结果'];

var _colModel = function() {
	return [ {
		name : 'id',
		index : 'id',
		width : 30,
		sortable : true,
		editable : false
	}, {
		name : 'name',
		index : 'name',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'playTimes',
		index : 'playTimes',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'bankerTimes',
		index : 'bankerTimes',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'chuTimes',
		index : 'chuTimes',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'chuNum',
		index : 'chuNum',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'tianTimes',
		index : 'tianTimes',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'tianNum',
		index : 'tianNum',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'moTimes',
		index : 'moTimes',
		width : 60,
		sortable : true,
		editable : false
	}, {
		name : 'moNum',
		index : 'moNum',
		width : 60,
		sortable : false,
		editable : false
	}, {
		name : 'resultNum',
		index : 'resultNum',
		width : 60,
		sortable : false,
		editable : false
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