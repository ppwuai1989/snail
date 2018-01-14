var _colNames = [ '资源编号', '上级编号', '资源名称','资源URL','标记','资源类别', '状态' ];
var _colModel = function() {
	return [ {
		name : 'resourcesId',
		index : 'id',
		width : 60,
		sortable : false,
		editable : true,
		editoptions : {
			readonly : false
		}
	}, {
		name : 'parentResourcesId',
		width : 60,
		editable : true,
		sorttype : "int"
	}, {
		name : 'resourcesName',
		index : 'resourcesName',
		width : 100,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "30"
		}
	}, {
		name : 'resourcesUrl',
		index : 'resourcesUrl',
		width : 250,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "250"
		}
	},  {
		name : 'remark',
		index : 'remark',
		width : 150,
		editable : true,
		editoptions : {
			size : "20",
			maxlength : "250"
		}
	}, {
		name : 'resourcesType',
		width : 60,
		editable : true,
		edittype : "select",
		renderer : function(value) {
			return rsd(value,"STATIC_DATA_04");
		},
		editoptions : {
			value : odparse("STATIC_DATA_04")
		}
	}, {
		name : 'status',
		index:'status',
		width : 90,
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