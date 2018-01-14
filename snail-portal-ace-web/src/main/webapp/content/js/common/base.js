if (!window.console)
	window.console = {};
if (!window.console.log)
	window.console.log = function() {
	};
if (!window.innerHeight) {
	var height = 0;
	if (window.innerHeight) {
		height = window.innerHeight;
	} else if (document.documentElement
			&& document.documentElement.clientHeight) {
		height = document.documentElement.clientHeight;
	} else if (document.body && document.body.clientHeight) {
		height = document.body.clientHeight;
	}
	window.innerHeight = height;
}
if (!window.innerWidth) {
	var width = 0;
	if (document.documentElement && document.documentElement.clientWidth) {
		width = document.documentElement.clientWidth;
	} else if (document.body && document.body.clientWidth) {
		width = document.body.clientWidth;
	} else if (window.innerWidth) {
		width = window.innerWidth;
	}
	window.innerWidth = width;
}
function isIE() {
	return navigator.appName.indexOf("Microsoft Internet Explorer") != -1;
}

function isIE6() {
	return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 6.0") == "-1" ? false
			: true;
}

function isIE7() {
	return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 7.0") == "-1" ? false
			: true;
}

function isIE8() {
	return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 8.0") == "-1" ? false
			: true;
}
function isIE9() {
	return navigator.userAgent.split(";")[1].toLowerCase().indexOf("msie 9.0") == "-1" ? false
			: true;
}
function isNN() {
	return navigator.userAgent.indexOf("Netscape") != -1;
}

function isOpera() {
	return navigator.appName.indexOf("Opera") != -1;
}

function isFF() {
	return navigator.userAgent.indexOf("Firefox") != -1;
}

function isChrome() {
	return navigator.userAgent.indexOf("Chrome") > -1;
}
function rsd(value, dictKey, staticDictObjects) {
	try {
		if (!staticDictObjects) {
			staticDictObjects = parent.staticDictObject;
		}

		var name = value;

		if ((value + "") && ("" + value).indexOf(',') < 0) {
			if (staticDictObjects && dictKey && staticDictObjects[dictKey]) {
				for (var i = 0; i < staticDictObjects[dictKey].length; i++) {
					if (staticDictObjects[dictKey][i].CODE == value) {
						name = staticDictObjects[dictKey][i].NAME;
						break;
					}
				}
			}
		} else {
			if (value) {
				var nameArray = [];
				var v = (value + "").split(',');
				for (var j = 0; j < v.length; j++) {
					for (var i = 0; i < staticDictObjects[dictKey].length; i++) {
						if (staticDictObjects[dictKey][i].CODE == v[j]) {
							nameArray.push(staticDictObjects[dictKey][i].NAME);
							break;
						}
					}
				}
				name = nameArray.join(',');
			}
		}
	} catch (err) {
		console.log("渲染错误", value + ":" + dictKey + ":" + err);
	}
	return name;
}

function odparse(dictKey, staticDictObjects) {
	var rst = [];
	try {
		if (!staticDictObjects) {
			staticDictObjects = parent.staticDictObject;
		}
		if (staticDictObjects && dictKey && staticDictObjects[dictKey]) {
			for (var i = 0; i < staticDictObjects[dictKey].length; i++) {
				rst.push(staticDictObjects[dictKey][i].CODE + ":"
						+ staticDictObjects[dictKey][i].NAME);
			}
		}
	} catch (err) {
		console.log("渲染错误", value + ":" + dictKey + ":" + err);
	}
	return rst.join(";");
}
function style_ajax_button(btnId, status, icon) {
	// console.log(icon);
	var btn = $('#' + btnId);
	if (status) {
		if (icon) {
			btn.find('i').removeClass(icon);
		} else {
			btn.find('i').removeClass('fa-check');
		}
		btn.find('i').addClass('fa-spinner fa-spin');
		btn.attr('disabled', true);

	} else {
		btn.find('i').removeClass('fa-spinner');
		btn.find('i').removeClass('fa-spin');
		if (icon) {
			btn.find('i').addClass(icon);
		} else {
			btn.find('i').addClass('fa-check');
		}
		btn.removeAttr("disabled");
	}
}
var Common = {

	// EasyUI用DataGrid用日期格式化
	TimeFormatter : function(value, rec, index) {
		if (value == undefined) {
			return "";
		}
		/* json格式时间转js时间格式 */
		value = value.substr(1, value.length - 2);
		var obj = eval('(' + "{Date: new " + value + "}" + ')');
		var dateValue = obj["Date"];
		if (dateValue.getFullYear() < 1900) {
			return "";
		}
		var val = dateValue.format("yyyy-mm-dd HH:MM");
		return val.substr(11, 5);
	},
	DateTimeFormatter : function(value, rec, index) {
		if (value == undefined) {
			return "";
		}
		/* json格式时间转js时间格式 */
		value = value.substr(1, value.length - 2);
		var obj = eval('(' + "{Date: new " + value + "}" + ')');
		var dateValue = obj["Date"];
		if (dateValue.getFullYear() < 1900) {
			return "";
		}

		return dateValue.format("yyyy-mm-dd HH:MM");
	},

	// EasyUI用DataGrid用日期格式化
	DateFormatter : function(value, rec, index) {
		if (value == undefined) {
			return "";
		}

		return value.substr(0, 10);
	}
};
var cssColor = [ 'red', 'blue', 'green' ];
var cssColor9 = [ 'grey', 'success', 'warning', 'danger', 'info', 'purple',
		'inverse', 'pink', 'yellow' ];
function GetRandomNum(Min, Max) {
	var Range = Max - Min;
	var Rand = Math.random();
	return (Min + Math.round(Rand * Range));
}
function GetRandomNumSeq(k, max) {
	if (k > max) {
		return k - max
	}
	return k;
}