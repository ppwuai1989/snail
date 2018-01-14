var _colNames = [ '机构编号', '机构名称', '机构级别','所属地区',  '创建时间' ];
var _colModel = function() {
	return [ {
		name : 'departmentId',
		index : 'id',
		width : 100,
		sortable : false,
		editable : true,
		editoptions : {
			readonly:true
		}
	}, {
		name : 'departmentName',
		index : 'departmentName',
		width : 250,
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
	}, {
		name : 'departmentLevel',
		width : 60,
		editable : true,
		edittype : "select",
		renderer : function(value) {
			return rsd(value,"STATIC_DATA_02");
		},
		editoptions : {
			value : odparse("STATIC_DATA_02")
		}
	},{
		name : 'areaName',
		width : 150,
		sorttype : "int",
		editable : true,
		edittype : "combotree",
		editoptions : {
			style:'width:165px;line-height: 30px;height: 30px;'
		},
		dataoptions:{
			url:contextPath+'/system/selectProvinceTreeList.do',
			required:false
		},
		renderer : function(value, cur) {
			return $.jgrid.getAccessor(cur, 'areaName');
		}
	}, {
		name : 'createTime',
		width : 150,
		sortable : true,
		editable : false,
		formatter:'date',
		formatoptions:{newformat: 'Y-m-d'}
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