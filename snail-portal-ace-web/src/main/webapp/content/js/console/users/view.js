jQuery(function($) {

	// resize to fit page size
	$(window).on('resize.jqGrid', function() {
		$(cfg.grid_selector).jqGrid('setGridWidth', $(".page-content").width());
	})
	// resize on sidebar collapse/expand
	var parent_column = $(cfg.grid_selector).closest('[class*="col-"]');
	$(document).on('settings.ace.jqGrid', function(ev, event_name, collapsed) {
		if (event_name === 'sidebar_collapsed'
				|| event_name === 'main_container_fixed') {
			$(cfg.grid_selector).jqGrid('setGridWidth', parent_column.width());
		}
	})

	jQuery(cfg.grid_selector).jqGrid({
		prmNames : {
			totalRecord : "totalRecord",
			start : "start",
			page : "page",
			rows : "limit"
		},
		datatype : "json",
		url : cfg.grid_load_data_url,
		jsonReader : {
			root : "list",
			page : "page",
			total : "totalPages",
			records : "allRows",
			id : cfg.dataId
		},
		height : cfg.gridHeight,
		colNames : _colNames,
		colModel : _colModel(),
		rownumbers : true,
		viewrecords : true,
		rowNum : cfg.rowNum,
		rowList : [10, 20, 30, 50, 100, 200],
		pager : cfg.pager_selector,
		altRows : true,
		// toppager: true,
		rownumWidth:60,
		multiselect : false,
		// multikey: "ctrlKey",
		multiboxonly : true,
		loadComplete : function() {
			var table = this;
			$(cfg.grid_selector).jqGrid('setGridWidth', $(".page-content").width());
			setTimeout(function() {
						styleCheckbox(table);

						updateActionIcons(table);
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
		},

		editurl : cfg.grid_edit_data_url,// nothing is saved
		addurl : cfg.grid_add_data_url,
		deleteurl : cfg.grid_delete_data_url,
		caption : cfg.caption

			// ,autowidth: true,

			/**
			 * , grouping:true, groupingView : { groupField : ['name'],
			 * groupDataSorted : true, plusicon : 'fa fa-chevron-down
			 * bigger-110', minusicon : 'fa fa-chevron-up bigger-110' },
			 * caption: "Grouping"
			 */

		});
	$(window).triggerHandler('resize.jqGrid');// trigger window resize to make
	// the grid get the correct size

	// enable search/filter toolbar
	// jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
	// jQuery(grid_selector).filterToolbar({});

	// switch element when editing inline

	// navButtons
	jQuery(cfg.grid_selector).jqGrid('navGrid', cfg.pager_selector, { // navbar
		// options
		edit :false,
		editicon : 'ace-icon fa fa-pencil blue',
		add :false,
		addicon : 'ace-icon fa fa-plus-circle purple',
		del : false,
		delicon : 'ace-icon fa fa-trash-o red',
		search :false,
		searchicon : 'ace-icon fa fa-search orange',
		refresh : authorConfig.hasOwnProperty(cfg.grid_load_data_url) || false,
		refreshicon : 'ace-icon fa fa-refresh green',
		view : authorConfig.hasOwnProperty(cfg.grid_load_data_url) || false,
		viewicon : 'ace-icon fa fa-search-plus grey'
	}, {
		// edit record form
		// closeAfterEdit: true,
		// width: 700,
		recreateForm : true,
		beforeShowForm : function(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
	}, {
		// new record form
		// width: 700,
		colpos : 2,
		closeAfterAdd : true,
		recreateForm : true,
		viewPagerButtons : false,
		beforeShowForm : function(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}
	}, {
		// delete record form
		recreateForm : true,
		beforeShowForm : function(e) {
			var form = $(e[0]);
			if (form.data('styled'))
				return false;

			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
					.wrapInner('<div class="widget-header" />')
			style_delete_form(form);

			form.data('styled', true);
		},
		onClick : function(e) {
			alert(1);
		}
	}, {
		// search form
		recreateForm : true,
		afterShowSearch : function(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-title')
					.wrap('<div class="widget-header" />')
			style_search_form(form);
		},
		afterRedraw : function() {
			style_search_filters($(this));
		},
		multipleSearch : true
			/**
			 * multipleGroup:true, showQuery: true
			 */
	}, {
		// view record form
		recreateForm : true,
		beforeShowForm : function(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-title')
					.wrap('<div class="widget-header" />')
		}
	})
jQuery(cfg.grid_selector).jqGrid('navButtonAdd','#grid-pager',{
    caption: "设置列可见",
    title: "设置列可见",
    onClickButton : function (){
        jQuery(cfg.grid_selector).jqGrid('columnChooser');
    }
});

	function style_delete_form(form) {
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm btn-white btn-round')
				.find('[class*="-icon"]').hide();// ui-icon, s-icon
		buttons.eq(0).addClass('btn-danger')
				.prepend('<i class="ace-icon fa fa-trash-o"></i>');
		buttons.eq(1).addClass('btn-default')
				.prepend('<i class="ace-icon fa fa-times"></i>')
	}

	function style_search_filters(form) {
		form.find('.delete-rule').val('X');
		form.find('.add-rule').addClass('btn btn-xs btn-primary');
		form.find('.add-group').addClass('btn btn-xs btn-success');
		form.find('.delete-group').addClass('btn btn-xs btn-danger');
	}
	function style_search_form(form) {
		var dialog = form.closest('.ui-jqdialog');
		var buttons = dialog.find('.EditTable')
		buttons.find('.EditButton a[id*="_reset"]')
				.addClass('btn btn-sm btn-info').find('.ui-icon').attr('class',
						'ace-icon fa fa-retweet');
		buttons.find('.EditButton a[id*="_query"]')
				.addClass('btn btn-sm btn-inverse').find('.ui-icon').attr(
						'class', 'ace-icon fa fa-comment-o');
		buttons.find('.EditButton a[id*="_search"]')
				.addClass('btn btn-sm btn-purple').find('.ui-icon').attr(
						'class', 'ace-icon fa fa-search');
	}

	function beforeDeleteCallback(e) {
		var form = $(e[0]);
		if (form.data('styled'))
			return false;

		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
				.wrapInner('<div class="widget-header" />')
		style_delete_form(form);

		form.data('styled', true);
	}

	function beforeEditCallback(e) {
		var form = $(e[0]);
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
				.wrapInner('<div class="widget-header" />')
		style_edit_form(form);
	}

	// it causes some flicker when reloading or navigating grid
	// it may be possible to have some custom formatter to do this as the grid
	// is being created to prevent this
	// or go back to default browser checkbox styles for the grid
	function styleCheckbox(table) {
		/**
		 * $(table).find('input:checkbox').addClass('ace') .wrap('<label />')
		 * .after('<span class="lbl align-top" />')
		 * 
		 * 
		 * $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		 * .find('input.cbox[type=checkbox]').addClass('ace') .wrap('<label
		 * />').after('<span class="lbl align-top" />');
		 */
	}

	// unlike navButtons icons, action icons in rows seem to be hard-coded
	// you can change them like this in here if you want
	function updateActionIcons(table) {
		/**
		 * var replacement = { 'ui-ace-icon fa fa-pencil' : 'ace-icon fa
		 * fa-pencil blue', 'ui-ace-icon fa fa-trash-o' : 'ace-icon fa
		 * fa-trash-o red', 'ui-icon-disk' : 'ace-icon fa fa-check green',
		 * 'ui-icon-cancel' : 'ace-icon fa fa-times red' };
		 * $(table).find('.ui-pg-div span.ui-icon').each(function(){ var icon =
		 * $(this); var $class = $.trim(icon.attr('class').replace('ui-icon',
		 * '')); if($class in replacement) icon.attr('class', 'ui-icon
		 * '+replacement[$class]); })
		 */
	}

	// replace icons with FontAwesome icons like above
	function updatePagerIcons(table) {
		var replacement = {
			'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
			'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
			'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
			'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
		};
		$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon')
				.each(function() {
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon',
							''));

					if ($class in replacement)
						icon.attr('class', 'ui-icon ' + replacement[$class]);
				})
	}

	function enableTooltips(table) {
		$('.navtable .ui-pg-button').tooltip({
					container : 'body'
				});
		$(table).find('.ui-pg-div').tooltip({
					container : 'body'
				});
	}
	function aceSwitch(cellvalue, options, cell) {
		console.log('aceSwitch');
		setTimeout(function() {
					$(cell).find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
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
	jQuery("#allrole-grid-table").jqGrid({
				prmNames : {
					totalRecord : "totalRecord",
					start : "start",
					page : "page",
					rows : "limit"
				},
				datatype : "json",
				url : contextPath + "/users/selectRoleList.do",
				jsonReader : {
					root : "list",
					page : "page",
					total : "totalPages",
					records : "allRows",
					id : 'roleId'
				},
				multiselect : true,
				// multikey: "ctrlKey",
				multiboxonly : true,
				rownumbers : true,
				viewrecords : true,
				rowNum : 10,
				rowList : [10, 20, 30, 50],
				height : 200,
				// width:350,
				colNames : ['角色编号', '角色名称'],
				colModel : [{
							name : 'roleId',
							width : 90
						}, {
							name : 'roleName',
							width : 200
						}],
				caption : '所有角色',
				loadComplete:function(){
					$("#allrole-grid-table").jqGrid('setGridWidth', $("#allrole-grid-table").width());
				}
			});

	jQuery("#myrole-grid-table").jqGrid({
				prmNames : {
					totalRecord : "totalRecord",
					start : "start",
					page : "page",
					rows : "limit"
				},
				datatype : "json",
				url : '',
				jsonReader : {
					root : "list",
					page : "page",
					total : "totalPages",
					records : "allRows",
					id : 'roleId'
				},
				multiselect : true,
				// multikey: "ctrlKey",
				multiboxonly : true,
				rownumbers : true,
				viewrecords : true,
				rowNum : 10,
				rowList : [10, 20, 30, 50],
				height : 200,
				// width:350,
				colNames : ['角色编号', '角色名称'],
				colModel : [{
							name : 'roleId',
							width : 90
						}, {
							name : 'roleName',
							width : 200
						}],
				caption : '已有角色',
				loadComplete:function(){
					$("#myrole-grid-table").jqGrid('setGridWidth', $("#myrole-grid-table").width());
				}
			});
		// jQuery("#myrole-grid-table").jqGrid('gridDnD',{connectWith:'#allrole-grid-table'});
		// jQuery("#allrole-grid-table").jqGrid('gridDnD',{connectWith:'#myrole-grid-table'});

});
function style_edit_form(form) {
	form.find('input[name=sdate]').datepicker({
				format : 'yyyy-mm-dd',
				autoclose : true
			}).end().find('input[name=status]')
			.addClass('ace ace-switch ace-switch-5')
			.after('<span class="lbl"></span>');
	var buttons = form.next().find('.EditButton .fm-button');
	buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();// ui-icon,
	buttons.eq(0).addClass('btn-primary')
			.prepend('<i class="ace-icon fa fa-check"></i>');
	buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
	buttons = form.next().find('.navButton a');
	buttons.find('.ui-icon').hide();
	buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
	buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');
}