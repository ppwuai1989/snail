/**
 * 访问错误方法
 */
function forbidenToAccess(request) {
		if (request.status == '403') {
			var redirect = request.getResponseHeader("KICKED");// 若HEADER中含有KICKED说明后端想重定向
			if (redirect == "KICKED") {
				var win = window;
				while (win != win.top) {
					win = win.top;
				}
				// 将后端重定向的地址取出来,使用win.location.href去实现重定向的要求
				win.location.href = request.getResponseHeader("KICKEDPATH");
			}
		}
	}