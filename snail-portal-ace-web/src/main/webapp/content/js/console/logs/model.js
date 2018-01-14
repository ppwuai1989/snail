var _colNames = [ '编号','用户IP','对象名称','内容', '操作人', '对象', '更改前','更改后','日志类型','时间' ];
var _colModel = function() {
	return [ {
		name : 'id',
		index : 'id',
		width : 60,
		sortable : true,
		editable : false
	},{
		name : 'ip',
		index : 'ip',
		hidden:true,
		width : 150,
		sortable : true,
		editable : false
	},{
		name : 'name',
		index : 'name',
		width : 60,
		sortable : true,
		editable : false
	},{
		name : 'log',
		index : 'log',
		width : 200,
		sortable : true,
		editable : false
	},{
		name : 'userName',
		index : 'userName',
		width : 60,
		sortable : true,
		editable : false
	},{
		name : 'objectValue',
		index : 'objectValue',
		width : 60,
		sortable : true,
		editable : false
	},{
		name : 'old',
		index : 'old',
		width : 60,
		sortable : true,
		editable : false
	},{
		name : 'news',
		index : 'news',
		width : 60,
		sortable : false,
		editable : false
	},{
		name : 'logType',	
		index : 'logType',
		width : 60,		
		editable : false,
		renderer : function(value) {
			return rsd(value,"STATIC_DATA_05");
		},
		editoptions : {
			value : odparse("STATIC_DATA_05")
		}
	}, {
		name : 'createTime',
		width : 100,
		sortable : true,
		editable : false,
		formatter:'date',
		formatoptions:{srcformat:'Y-m-d h:i:s',newformat: 'Y-m-d h:i:s'}
	}];
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