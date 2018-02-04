var _colNames = [ '公告编号', '标题','是否发布', '发布者','类型', '是否置顶','发布时间' ,'有效日期'];
var _colModel = function() {
	return [
			{
				name : 'noticeId',
				width : 100
			},
			{
				name : 'title',
				width : 300
			},
			{
				name : 'status',
				width : 60,
				editable : true,
				edittype : "select",
				renderer : function(value) {
					return rsd(value, "STATIC_DATA_04");
				},
				editoptions : {
					value : odparse("STATIC_DATA_04")
				}
			},{
				name : 'name',
				width : 60
			},{
				name : 'noticeCategory',
				width : 60,
				editable : false,
				renderer : function(value) {
					return rsd(value, "STATIC_DATA_21");
				},
				editoptions : {
					value : odparse("STATIC_DATA_21")
				}
				
			},
			
			{
				name : 'top',
				width : 60,
				editable : true,
				edittype : "select",
				renderer : function(value) {
					return rsd(value, "STATIC_DATA_04");
				},
				editoptions : {
					value : odparse("STATIC_DATA_04")
				}
			}, {
				name : 'publishTime',
				width : 120,
				formatter:'date',
				formatoptions:{srcformat:'Y-m-d H:i:s',newformat: 'Y-m-d H:i:s'},
				sortable : true,
				editable : false
			}, {
				name : 'deadline',
				width : 120,
				formatter:'date',
				formatoptions:{srcformat:'Y-m-d H:i:s',newformat: 'Y-m-d H:i:s'},
				sortable : true,
				editable : false
			} ];
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