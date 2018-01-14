<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"
	type="text/javascript"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>kickedOut</title>
</head>
<body>
	<h3>
		警告！非法操作，您已经被系统踢出，请重新登录。<span id="num">3</span>秒后跳转到主页...<a href="/portal/dynamic/view">跳过等待！</a>
	</h3>
</body>
<script type="text/javascript">
	jQuery(function($) {
		jump(3);
	});
	function jump(count) {
		setTimeout(function() {
			count--;
			if (count > 0) {
				$('#num').html(count);
				jump(count);
			} else {
				location.href = "/portal/dynamic/view";
			}
		}, 1000);
	}
</script>
</html>