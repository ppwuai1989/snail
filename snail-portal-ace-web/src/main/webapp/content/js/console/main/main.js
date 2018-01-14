var json;
var tree;
Ext.onReady(function() {
	getJson();

});
function initMain() {
	var toolbar = new Ext.Toolbar({
		autoWidth : true
	});
	for ( var i = 0; i < json.length; i++) {
		var obj = json[i];
		var menu = {
			text : obj.text,
			icon : obj.icon,
			cls : 'x-btn-text',
			id : obj.id,
			href : obj.href
		};
		toolbar.addItem(menu);
		// toolbar.add('-');
		var temp = Ext.getCmp(obj.id);
		getSubMenuList(temp, obj);
	}
	toolbar.doLayout();
	var banner = new Ext.Panel({
		contentEl : 'banner',
		height : 64
	});
	var topPanel = new Ext.Panel({
		region : 'north',
		height : 94,
		snail : false,
		// collapsible : true,
		items : [ banner, toolbar ]
	});

	var tabpanel = new Ext.TabPanel({
		id : 'maintabpanel',
		region : 'center',
		activeTab : 0,
		snail : true,
		items : []

	});
	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
	initTree();
	var viewport = new Ext.Viewport({
		layout : 'border',
		items : [ topPanel, tabpanel, {
			region : 'west',
			id : 'west-panel',
			title : '快速导航',
			split : true,
			width : 170,
			minSize : 175,
			maxSize : 400,
			collapsible : true,
			collapseMode : 'mini',
			margins : '0 0 0 5',
			layout : 'accordion',
			layoutConfig : {
				animate : true
			},
			items : [ {
				items : [ tree ],
				title : '树形导航',
				border : false,
				iconCls : 'nav'
			}, {
				title : '列表导航',
				items : [],
				border : false,
				iconCls : 'settings'
			} ]
		}

		]
	});
	initUserInfo();
	initUserExit();
	initPortal();
	initModifyPassWord();

}

function getSubMenuList(menu, obj) {
	var temp = new Ext.menu.Menu({
		cls : 'x-btn-text',
		icon : obj.icon,
		id : obj.id + 'sub'
	});
	if (!obj.leaf) {
		var c = obj.children;
		for ( var j = 0; j < c.length; j++) {
			var obj = c[j];
			var item = temp.add({
				text : obj.text,
				cls : 'x-btn-text',
				id : obj.id,
				icon : obj.icon,
				url : obj.href,
				handler : onItemClick
			});
			if (!obj.leaf) {
				getSubMenuList(Ext.getCmp(obj.id), obj);
			}

		}
		menu.menu = temp;
	}
}
function onItemClick(item) {
	var panel = parent.Ext.getCmp('maintabpanel');
	var newTab = panel.getItem(item.id + "tab");
	var screenHeight = parent.Ext.getBody().getHeight() - 120;
	if (!newTab) {
		if (panel.items.getCount() > 8) {
			alert("标签页已经达到最大数量,请关闭部分后再打开");
			return;
		}
		
		panel.add(
				{
					id : item.id + "tab",
					title : item.text,
					icon : item.icon,
					autoHeight : true,
					autoScroll : true,
					autoWidth : true,
					closable : true,
					html : '<isnail id="tabMainsnail" src="' + contextPath
							+ item.url + '" width="100%" height="'
							+ screenHeight
							+ '" snailborder="0"  scrolling="yes"></isnail>'
				}).show(); // 创建并显示 newTab

	} else {

		newTab.show(); // 如果 newTab 已存在则直接显示
	}
}

function initUserInfo() {

}
function initUserExit() {
	var button = new Ext.Button({
		renderTo : "userExit",
		icon : contextPath + '/content/image/application/Exit.gif',
		snail : true,
		text : "安全退出"
	})
	button.on("click", function() {
		window.location.href = "/cas-erp/logout";
	})
	// button.minWidth = 80;
	button.setText("安全退出");
}
function initModifyPassWord() {
	var button = new Ext.Button({
		renderTo : "modifyPassWord",
		icon : contextPath + '/content/image/led/key.png',
		snail : true,
		text : "修改密码"
	})
	button.on("click", function() {
		createModifyPassWordWindow();
	})
	// button.minWidth = 80;
	button.setText("修改密码");

}
function initPortal() {
	var panel = parent.Ext.getCmp('maintabpanel');

	var screenHeight = parent.Ext.getBody().getHeight() - 120;

	panel.add(
			{
				id : "portaltab",
				title : "我的桌面",
				icon : contextPath + '/content/image/led/monitor.png',
				autoHeight : true,
				autoScroll : true,
				autoWidth : true,
				closable : false,
				html : '<isnail id="tabMainsnail" src="' + contextPath
						+ "/dynamic/console/main.jsp"
						+ '" width="100%" height="' + screenHeight
						+ '" snailborder="0"  scrolling="yes"></isnail>'
			}).show(); // 创建并显示 newTab
}

function initTree() {
	var dataUrl = contextPath + '/system/getTreeList.do?loadButton=false';
	//dataUrl = contextPath + '/system/selectProvinceTreeList.do';
	var loader = new Ext.tree.TreeLoader({
		dataUrl:dataUrl
	});
	 tree = new Ext.tree.TreePanel({
		animate : true,
		autoScroll : true,
		loader : loader,
		enableDD : true,
		containerScroll : true,
		snail : false,
		border : false,
		autoHeight : false,
		// height:600,
		dropConfig : {
			appendOnly : true
		}
	});
	// new Ext.tree.TreeSorter(tree, {folderSort:false});
	var root = new Ext.tree.AsyncTreeNode({
		text : '我的树',
		icon : contextPath + '/content/image/led/control_wheel.png',
		draggable : false, // disable root node dragging
		id : '0'
	});
	
	tree.setRootNode(root);
	root.expand(true, true);
	// 增加鼠标单击事件

	tree.on('click', treeClick);
	
	

	return tree;
}

function treeClick(node, e) {
	e.stopEvent();
	if (map[node.id]) {
		//window.open(contextPath+ map[node.id]);
		//alert(map[node.id]);
		t_getUrl(node.id, node.text, map[node.id], "");
	}
}

function t_getUrl(ids, name, url, sicon) {
	var panel = parent.Ext.getCmp('maintabpanel');
	var screenHeight = parent.Ext.getBody().getHeight() - 120;
	panel.add(
			{
				id : ids + "tab",
				title : name,
				icon : sicon,
				autoHeight : true,
				autoScroll : true,
				autoWidth : true,
				closable : true,
				html : '<isnail id="tabMainsnail" src="' + contextPath + url
						+ '" width="100%" height="' + screenHeight
						+ '" snailborder="0"  scrolling="yes"></isnail>'
			}).show(); // 创建并显示 newTab
}
function getJson() {
	Ext.Ajax.request({
		timeout : 10000000,
		url : contextPath + '/system/getTreeList.do?loadButton=false',
		method : 'POST',
		async : false,
		params : {},
		success : function(v) {
			json = Ext.decode(v.responseText);
			initMain();
		},
		failure : function(response, opts) {
			Ext.Msg.show({
				title : '系统提示',
				msg : response.statusText,
				icon : Ext.Msg.INFO,
				minWidth : 300,
				buttons : Ext.Msg.OK
			});
		}
	})
}