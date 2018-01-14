var _colNames = [ '角色编号', '角色名称', '创建时间', '备注' ];
var _colModel = function() {
	return [ {
		name : 'roleId',
		index : 'id',
		width : 60,
		sortable : false,
		editable : true,
		editoptions : {
			readonly : true
		}
	}, {
		name : 'roleName',
		index : 'roleName',
		width : 150,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "30"
		}
	}, {
		name : 'createTime',
		width : 150,
		sortable : true,
		editable : false
	}, {
		name : 'remark',
		index : 'remark',
		width : 150,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "30"
		},
		formoptions : {
			elmprefix : "",
			elmsuffix : "<span style='color:red;font-size:16px;font-weight:800'>*</span>"
			},
			editrules : {
			required : true,
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