var buildMenu = function(menus) {
	var buildMenuHtml = function(menus) {
		var html = [];
		var num = 0;
		$
				.each(
						menus,
						function(i, menu) {
							html.push('<li class="">');
							html
									.push('<a class="dropdown-toggle" href="#"><i class="menu-icon '
											+ menu.icon
											+ '"></i><span class="menu-text">'
											+ menu.text + ' </span>');
							if (menu.leaf != true && menu.leaf != 'true') {
								html
										.push('<b class="arrow fa fa-angle-down"></b>');
							}
							html.push('</a>');
							var initSubMenu = function(menu) {
								if (menu.leaf != true && menu.leaf != 'true') {
									var childrens = menu.children, len = childrens.length;
									html.push('<ul class="submenu">');
									for (var i = 0; i < len; i++) {
										html.push('<li class="">');
										if (childrens[i].href) {
											html
													.push('<a  href="#" title="'
															+ childrens[i].text
															+ '" url="'
															+ contextPath
															+ childrens[i].href
															+ '" ><i class="menu-icon '
															+ childrens[i].icon
															+ '"></i>'
															+ childrens[i].text
															+ '</a><b class="arrow"></b>');
										} else {
											html
													.push('<a class="dropdown-toggle" href="#"><i class="menu-icon '
															+ childrens[i].icon
															+ '"></i>'
															+ childrens[i].text
															+ '<b class="arrow fa fa-angle-down"></b></a>');
										}
										initSubMenu(childrens[i]);
										html.push('</li>');

									}
									html.push('</ul>');
								}
							}
							initSubMenu(menu);
							html.push('</li>');
						});
		return html.join('');
	};
	var htmlFrame = buildMenuHtml(menus);
	$('#menu').empty().append(htmlFrame);
	$('#menu a[url]').bind('click', function() {
		var url = $(this).attr("url");
		$('#menu a[url]').parent('li').removeClass("active")
		$(this).parent('li').addClass("active");
		if (url) {
			addPanel($(this).attr("title"), url, true)
			// $("#mainFrame").attr("src",url);
		}
	});

}

$.ajax({
	url : contextPath + '/system/getTreeList.do?loadButton=false&icon=ace',
	type : 'POST',
	timeout : 30000,
	dataType : 'json',
	success : function(data) {
		buildMenu(data);
		addPanel('仪表板', contextPath + '/dynamic/console/main.jsp', false);
	}

});
function addPanel(title, src, closable) {
	var screenHeight = window.innerHeight - 76;
	var iframe = '<iframe name="mainFrame" id="ifr" src="' + src
			+ '" width="100%" height="' + screenHeight
			+ 'px" frameborder="0"  scrolling="auto"></iframe>';
	var isExit = $('#tt').tabs('exists',title);
	if(!isExit){
		$('#tt').tabs('add', {
			title : title,
			content : iframe,
			closable : closable
		});
	}else{
		$('#tt').tabs('select',title);
	}
	
}
function removePanel() {
	var tab = $('#tt').tabs('getSelected');
	if (tab) {
		var index = $('#tt').tabs('getTabIndex', tab);
		$('#tt').tabs('close', index);
	}
}
function reloadGrid() {
	var tab = $('#tt').tabs('getSelected');
	var index = $('#tt').tabs('getTabIndex', tab);
	var ifr = frames[index-1];
	var win = ifr.window || ifr.contentWindow;
	win.reloadGrid();
}
jQuery(function($) {
	//initWorkflowList();
	/*$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
		_title : function(title) {
			var $title = this.options.title || '&nbsp;'
			if (("title_html" in this.options)
					&& this.options.title_html == true)
				title.html($title);
			else
				title.text($title);
		}
	}));*/
});
function initWorkflowList() {
	$
			.ajax({
				type : "post",
				url : "/workflow/workflow/findPersonalTask.do",
				data : {},
				beforeSend : function(XMLHttpRequest) {
				},
				success : function(rst, textStatus) {

					if (rst) {
						var html = new Array();
						html.push('<li class="dropdown-header">');
						html.push('<i class="ace-icon fa fa-check"></i>');
						html.push(rst.allRows);
						html.push(' 任务待完成');
						html.push('</li>');
						for ( var i in rst.list) {
							var o = rst.list[i];

							html.push('<li>');
							html.push('<a href="javascript:addPanel(\''+o.name+'\',\''+o.formResourceName+'?taskId='+o.id+'&instanceId='+o.executionId+'\',true)">');
							html.push('<div class="clearfix">');
							html.push('<span class="pull-left">'+o.name+'</span>');
							html.push('<span class="pull-right">'+o.createTime+'</span>');
							html.push('</div>');
							//html.push('<div class="progress progress-mini">');
							//html.push('<div style="width:65%" class="progress-bar"></div>');
							//html.push('</div>');
							html.push('</a>');
							html.push('</li>');

							console.log(rst.list[i]);
						}
						 $('#workflow-task-list').html(html.join(''));
						 $('#workflow-task-list-point').html(rst.allRows);
						 
					}
				},
				complete : function(XMLHttpRequest, textStatus) {

				},
				error : function() {

				}
			});
}
function addWorkflow(key, name) {
	$("#dialog-confirm")
			.removeClass('hide')
			.dialog(
					{
						resizable : false,
						modal : false,
						title : "<div class='widget-header'><h4 class='smaller'><i class='ace-icon fa fa-exclamation-triangle red'></i> 确认开启电子工作流程吗?</h4></div>",
						title_html : true,
						buttons : [
								{
									html : "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 开启电子工作流程",
									"class" : "btn btn-info btn-xs",
									id : 'btn-add-workflow',
									click : function() {

										$
												.ajax({
													type : "post",
													url : "/workflow/workflow/startProcessInstanceByKey.do",
													data : {
														key : key
													},
													beforeSend : function(
															XMLHttpRequest) {
														style_ajax_button(
																'btn-add-workflow',
																true);
													},
													success : function(rst,
															textStatus) {
														style_ajax_button(
																'btn-add-workflow',
																false);
														$("#dialog-confirm")
																.dialog("close");
														if (rst.state) {
															var id = rst.response.Id;
															parent
																	.addPanel(
																			name,
																			rst.response.formResourceName
																					+ '?id='
																					+ id,
																			true);
														} else {
															alert(rst.errorMessage);
														}

													},
													complete : function(
															XMLHttpRequest,
															textStatus) {
														style_ajax_button(
																'btn-add-workflow',
																false);
													},
													error : function() {
														style_ajax_button(
																'btn-add-workflow',
																false);
													}
												});
									}
								},
								{
									html : "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
									"class" : "btn btn-xs",
									click : function() {
										$(this).dialog("close");
									}
								} ]
					});

}
function modifyPasswd(){
	$("#password").val('');
	$("#repassword").val('');
	var dialog=$( "#dialog-message" ).removeClass('hide').dialog({
		resizable: false,
		modal: false,
		title: "密码修改",
		buttons: [
			{
				html: "<i class='ace-icon fa fa-check bigger-110'></i>&nbsp; 确定",
				"class" : "btn btn-info btn-xs",
				click: function() {
					if($('#password').val()==''){
						alert("请输入密码！");
						return;
					}
					if($('#password').val()!=$('#repassword').val()){
						alert("两次输入的密码不一致！");
						return;
					}
					if(confirm("确定要修改吗？")){
					$.ajax({
						type : "post",
						url : contextPath + "/system/updatePassword.do",
						data:{password:$('#password').val(),repassword:$('#repassword').val()},
						beforeSend : function(XMLHttpRequest) {
							
						},
						success : function(rst, textStatus) {
							if (rst.state) {
								alert(rst.errorMessage);
								dialog.dialog( "close" ); 
							}else{
								alert(rst.errorMessage);
							}
						},
						complete : function(XMLHttpRequest, textStatus) {
							
						},
						error : function() {
							
						}
					});
					}
				}
			}
			,
			{
				html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
				"class" : "btn btn-xs",
				click: function() {
					$( this ).dialog( "close" );
				}
			}
		]
	});
}
