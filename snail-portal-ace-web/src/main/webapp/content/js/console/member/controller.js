jQuery(function($) {
	$('#btn-search').on('click', function() {
		$('#fm-search').ajaxForm({
			beforeSubmit : function(formData, jqForm, options) {
				var params = {};
				$.each(formData, function(n, obj) {
					params[obj.name] = obj.value;
				});
				$.extend(params, {
					time : new Date()
				});
				// console.log(params);
				jQuery(cfg.grid_selector).jqGrid('setGridParam', {
					page : 1,
					postData : params
				}).trigger("reloadGrid");
				return false;
			}
		});
	});

	$('#btn-view-add').on(
			'click',
			function() {
				jQuery(cfg.grid_selector).jqGrid(
						'editGridRow',
						'new',
						{
							closeAfterAdd : true,
							recreateForm : true,
							viewPagerButtons : false,
							beforeShowForm : function(e) {
								var form = $(e[0]);
								form.closest('.ui-jqdialog').find(
										'.ui-jqdialog-titlebar').wrapInner(
										'<div class="widget-header" />')
								style_edit_form(form);
							},
							errorTextFormat : function(request, editType) {
								forbidenToAccess(request)
							}
						})
			});
	$('#btn-view-edit').on(
			'click',
			function() {
				var gr = jQuery(cfg.grid_selector).jqGrid('getGridParam',
						'selrow');
				if (!gr) {
					$.jgrid.info_dialog($.jgrid.nav.alertcap,
							$.jgrid.nav.alerttext)
				}
				jQuery(cfg.grid_selector).jqGrid(
						'editGridRow',
						gr,
						{
							closeAfterAdd : true,
							recreateForm : true,
							viewPagerButtons : true,
							beforeShowForm : function(e) {
								var form = $(e[0]);
								form.closest('.ui-jqdialog').find(
										'.ui-jqdialog-titlebar').wrapInner(
										'<div class="widget-header" />')
								style_edit_form(form);
							},
							errorTextFormat : function(request, editType) {
								forbidenToAccess(request)
							}
						})
			});
	$('#btn-view-topUp').on(
			'click',
			function() {
				var gr = jQuery(cfg.grid_selector).jqGrid('getGridParam',
						'selrow');
				if (!gr) {
					$.jgrid.info_dialog($.jgrid.nav.alertcap,
							$.jgrid.nav.alerttext)
				}
				jQuery(cfg.grid_selector).jqGrid(
						'editGridRow',
						gr,
						{
							url : cfg.grid_topup_data_url,
							closeAfterAdd : true,
							recreateForm : true,
							viewPagerButtons : true,
							beforeShowForm : function(e) {
								var form = $(e[0]);
								var col = form[0];
								for (var i = 0; i < col.length; i++) {
									if (col[i].id != "coins"
											&& col[i].id != "gems"
											&& col[i].id != "pkCard") {
										col[i].disabled = true;
									} else {
										col[i].disabled = false;
										col[i].value = 0;
									}
								}
								form.closest('.ui-jqdialog').find(
										'.ui-jqdialog-titlebar').wrapInner(
										'<div class="widget-header" />')
								style_edit_form(form);
							},
							errorTextFormat : function(request, editType) {
								forbidenToAccess(request)
							},
							afterComplete : function(res, postdata, formid) {
								var coins = $("#agent-account-coins").text();
								var gems = $("#agent-account-gems").text();
								var pkCard = $("#agent-account-pkCard").text();
								if (coins != null && coins != "") {
									$("#agent-account-coins").text(coins-postdata.coins);
								}
								if (gems != null && gems != "") {
									$("#agent-account-gems").text(gems-postdata.gems);
								}
								if (pkCard != null && pkCard != "") {
									$("#agent-account-pkCard").text(pkCard-postdata.pkCard);
								}
							}
						})
			});

	$('#btn-view-del').on(
			'click',
			function() {

				var gr = jQuery(cfg.grid_selector).jqGrid('getGridParam',
						'selrow');
				if (!gr) {
					$.jgrid.info_dialog($.jgrid.nav.alertcap,
							$.jgrid.nav.alerttext);
					return;
				}
				jQuery(cfg.grid_selector).jqGrid(
						'delGridRow',
						gr,
						{
							beforeShowForm : function(e) {
								var form = $(e[0]);
								form.closest('.ui-jqdialog').find(
										'.ui-jqdialog-titlebar').wrapInner(
										'<div class="widget-header" />')
								style_edit_form(form);
							},
							errorTextFormat : function(request, editType) {
								forbidenToAccess(request)
							}
						})
			});
	$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
		_title : function(title) {
			var $title = this.options.title || '&nbsp;'
			if (("title_html" in this.options)
					&& this.options.title_html == true)
				title.html($title);
			else
				title.text($title);
		}
	}));

	/*
	 * function style_ajax_button(btn,status){ //console.log(status);
	 * if(status){ $('#'+btn).find('i').removeClass('fa-check');
	 * $('#'+btn).find('i').addClass('fa-spinner fa-spin'); }else{
	 * $('#'+btn).find('i').removeClass('fa-spinner');
	 * $('#'+btn).find('i').removeClass('fa-spin');
	 * $('#'+btn).find('i').addClass('fa-check'); } $('#'+btn).disabled=status; }
	 */
	function style_ajax_button(btnId, status) {
		console.log(status);
		var btn = $('#' + btnId);
		if (status) {
			btn.find('i').removeClass('fa-check');
			btn.find('i').addClass('fa-spinner fa-spin');
			btn.attr('disabled', "true");

		} else {
			btn.find('i').removeClass('fa-spinner');
			btn.find('i').removeClass('fa-spin');
			btn.find('i').addClass('fa-check');
			btn.removeAttr("disabled");
		}
	}
});