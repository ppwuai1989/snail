var _colNames = [ '编号','类型','编码', '名称', '创建时间', '备注' ];
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
		hidden:true
	}, {
		name : 'categoryId',
		index : 'categoryId',
		width : 100,
		editable : true,
		edittype : "combobox",
		dataoptions:{
			 url: contextPath +'/dictCategory/findDictCategoryListAll.do',
		        method: 'get',
		        valueField:'categoryId',
		        textField:'name'
		},
		editoptions : {
			style:'width:176px;line-height: 30px;height: 30px;'
		},
		renderer : function(value, cur) {
			return $.jgrid.getAccessor(cur, 'categoryName');
		}
	}, {
		name : 'code',
		index : 'code',
		width : 60,
		sortable : false,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "2"
		}
	},{
		name : 'name',
		index : 'name',
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
		editable : false,
		formatter:'date',
		formatoptions:{srcformat:'Y-m-d h:i:s',newformat: 'Y-m-d h:i:s'}
	}, {
		name : 'remark',
		index : 'remark',
		width : 150,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "30"
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