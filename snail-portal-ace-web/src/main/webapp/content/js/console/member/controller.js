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
								// 修改代理时需要添加的事件
								event_edit_form(form);
							},
							errorTextFormat : function(request, editType) {
								forbidenToAccess(request)
							}
						})
			});
	$('#btn-view-setUpAgentBySystemUser').on(
			'click',
			function() {						
				var gr = jQuery(cfg.grid_selector).jqGrid('getGridParam',
						'selrow');
				if (!gr) {
					$.jgrid.info_dialog($.jgrid.nav.alertcap,
							$.jgrid.nav.alerttext)
				}
				// 找到代理标识行
				if(jQuery(cfg.grid_selector).getCell(gr,'isAgent')=="1"){
					var dialog = $("#dialog-cannotSet").removeClass('hide').dialog({
					resizable : false,
					modal : false,
					title : "系统提示",
					buttons : [ {
						html : "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 确定",
						"class" : "btn btn-info btn-xs",
						click : function() {					
							$( this ).dialog( "close" );
						}
					} ]
				});	
				return ;
				}
				jQuery(cfg.grid_selector).jqGrid(
						'editGridRow',
						gr,
						{
							url : cfg.grid_setupagentbysystemuser_data_url,
							closeAfterAdd : true,
							recreateForm : true,
							viewPagerButtons : true,
							beforeShowForm : function(e) {								
								var form = $(e[0]);								
								form.closest('.ui-jqdialog').find(
										'.ui-jqdialog-titlebar').wrapInner(
										'<div class="widget-header" />')
								style_edit_form(form);								
								// 设置代理时需要添加的事件
								event_setUpAgent_form(form);
							},
							errorTextFormat : function(request, editType) {
								forbidenToAccess(request)
							}
						})
			});
	
	$('#btn-view-setUpAgent').on(
			'click',
			function() {						
				var gr = jQuery(cfg.grid_selector).jqGrid('getGridParam',
						'selrow');
				if (!gr) {
					$.jgrid.info_dialog($.jgrid.nav.alertcap,
							$.jgrid.nav.alerttext)
				}
				// 找到代理标识行
				if(jQuery(cfg.grid_selector).getCell(gr,'isAgent')=="1"){
					var dialog = $("#dialog-cannotSet").removeClass('hide').dialog({
					resizable : false,
					modal : false,
					title : "系统提示",
					buttons : [ {
						html : "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 确定",
						"class" : "btn btn-info btn-xs",
						click : function() {					
							$( this ).dialog( "close" );
						}
					} ]
				});	
				return ;
				}
				jQuery(cfg.grid_selector).jqGrid(
						'editGridRow',
						gr,
						{
							url : cfg.grid_setupagent_data_url,
							closeAfterAdd : true,
							recreateForm : true,
							viewPagerButtons : true,
							beforeShowForm : function(e) {								
								var form = $(e[0]);								
								form.closest('.ui-jqdialog').find(
										'.ui-jqdialog-titlebar').wrapInner(
										'<div class="widget-header" />')
								style_edit_form(form);								
								// 设置代理时需要添加的事件
								event_setUpAgent_form(form);
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
									$("#agent-account-coins").text(
											coins - postdata.coins);
								}
								if (gems != null && gems != "") {
									$("#agent-account-gems").text(
											gems - postdata.gems);
								}
								if (pkCard != null && pkCard != "") {
									$("#agent-account-pkCard").text(
											pkCard - postdata.pkCard);
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
	$("#btn-view-bind").on('click',function(){	
		var dialog = $("#dialog-bindMember").removeClass('hide').dialog({
			resizable : false,
			modal : false,
			title : "绑定会员",
			buttons : [ {
				html : "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 确定",
				"class" : "btn btn-info btn-xs",
				click : function() {					
					$(this).dialog( "close" );
				}
			}, {
				html : "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
				"class" : "btn btn-xs",
				click : function() {					
					$(this).dialog("close");
				}
			} ]
		});	
		$("#memberId").keyup(function(e){
			 var regu = /^[0-9]+\.?[0-9]*$/;
			 var val= $("#memberId").val();
			if(regu.test(val)){
				if(val.length==8){
					$("#errMsg").hide();
					$.ajax({
						url : '${pageContext.request.contextPath}/member/bindMember.do',
						type : 'post',
						data: "{userId:" + val + "}",
						success : function(rst) {
							if (rst.state) {
					
							}
						}
					})
				}else{
					$("#errMsg").find("i")[0].innerText="还需输入"+(8-val.length)+"个数字";
					$("#errMsg").show();
				}
				// $("#errMsg").hide();
			}else{
				$("#memberId").val(val.replace(/[^\d]/g, ''));	
				$("#errMsg").find("i")[0].innerText="请输入数字!";
				$("#errMsg").show();
			}			
		});
	})
	
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
	function event_setUpAgent_form(form) {
		form.find("#tr_isAgent td")[0].innerText = "代理开关";
		var col = form[0];
		var isAgent = $("#isAgent")[0];	
		for (var i = 0; i < col.length; i++) {
			col[i].disabled = true;
			if (col[i].id == "isAgent") {
				col[i].disabled = false;
			}		
		}	
		$("#isAgent").click(function(e) {
			if (e.target.checked == true) {	
					e.preventDefault();
					isFirstTime = false;
					var dialog = $("#dialog-message").removeClass('hide').dialog({
						resizable : false,
						modal : false,
						title : "开启代理",
						buttons : [ {
							html : "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 确定",
							"class" : "btn btn-info btn-xs",
							click : function() {
								e.target.checked=true;								
								$("#mobile")[0].disabled = false;								
								$(this).dialog("close");
							}
						}, {
							html : "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
							"class" : "btn btn-xs",
							click : function() {
								$("#mobile")[0].value="";
								$("#mobile")[0].disabled=true;
								$(this).dialog("close");
							}
						} ]
					})	
			} else {	
				$("#mobile")[0].value="";
				$("#mobile")[0].disabled=true;
			}			
		})
	}
	function event_edit_form(form){
		form.find("#tr_isAgent td")[0].innerText = "代理开关";		
		var col = form[0];
		var isAgent = $("#isAgent")[0];	
		for (var i = 0; i < col.length; i++) {
			// col[i].disabled = true;
			if(col[i].id=="agentId"||col[i].id=="agentLevel"){
				col[i].disabled = true;
			}
			if (col[i].id == "isAgent"||col[i].id == "parentAgentId") {
				if(isAgent.checked==true){
					col[i].disabled = false;
				}				
				else{
					col[i].disabled = true;
				}
			}		
		}		
		var isFirstTime = true;
		$("#isAgent").click(function(e) {			
			if (e.target.checked == true) {		
				e.target.checked=true;		
				$("#agentId")[0].disabled = false;
				$("#parentAgentId")[0].disabled = false;
			} else {				
				if(isFirstTime){
					e.preventDefault();
					isFirstTime = false;
					var dialog = $("#dialog-message").removeClass('hide').dialog({
						resizable : false,
						modal : false,
						title : "关闭代理提示",
						buttons : [ {
							html : "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 确定",
							"class" : "btn btn-info btn-xs",
							click : function() {
								e.target.checked=false;
								$("#agentLevel")[0].disabled = true;
								$("#agentId")[0].disabled = true;
								$("#parentAgentId")[0].disabled = true;		
								$( this ).dialog( "close" );
							}
						}, {
							html : "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
							"class" : "btn btn-xs",
							click : function() {
								$(this).dialog("close");
							}
						} ]
					})			
				}else{			
					$("#parentAgentId")[0].disabled = true;
				}				
			}
		})
	}
});