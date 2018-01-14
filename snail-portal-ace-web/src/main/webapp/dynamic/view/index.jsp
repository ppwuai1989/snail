<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>


<jsp:directive.include file="includes/top.jsp" />
<%
	request.setAttribute("ch", "");
	javax.servlet.http.Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组
	if (cookies != null) {
		for (javax.servlet.http.Cookie cookie : cookies) {
			if (cookie.getName().equals("username") || cookie.getName().equals("password")
					|| cookie.getName().equals("ch")) {
				request.setAttribute((String) cookie.getName(), (String) cookie.getValue());
			}
		}
	}
%>
<script type="text/javascript">
		var contextPath='${pageContext.request.contextPath}';
		</script>

<div class="main-container" id="main_container">
	<div class="main-content">
		<div style="margin: 20px">
			<!-- 		<img alt="胜讯网络" src="logo.gif" width="225" height="42"
				style="background-color: #FFFFFF"> -->
		</div>
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="login-container">

					<div class="center">
						<h1>

							<span class="white" id="id-text2">后台管理系统</span>
						</h1>
						<h4 class="blue" id="id-company-text">&copy; 河南胜讯网络集团</h4>
					</div>

					<div class="space-6"></div>

					<div class="position-relative">
						<div id="login-box" class="login-box visible widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header blue lighter bigger">
										<i class="ace-icon fa fa-coffee green"></i> 请输入您的信息
									</h4>

									<div class="space-6"></div>

									<form:form method="post" id="fm1" cssClass="fm-v clearfix"
										commandName="${commandName}" htmlEscape="true"
										onsubmit="return false;">

										<h4 class="heade lighter bigger">
											<form:errors path="*" id="msg"
												cssClass="ace-icon fa fa-info-circle red" element="i" />
										</h4>
										<input type="hidden" name="lt" value="${loginTicket}" />
										<input type="hidden" name="execution"
											value="${flowExecutionKey}" />
										<input type="hidden" name="_eventId" value="submit" />
										<fieldset>
											<label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													id="account" type="text" class="form-control"
													name="account" placeholder="用户名或手机号" value="${account}" /> <i
													class="ace-icon fa fa-user"></i>
											</span>
											</label> <label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													id="password" type="password" class="form-control"
													name="password" placeholder="密码" value="${password}" /> <i
													class="ace-icon fa fa-lock"></i>
											</span>
											</label>

											<div class="space"></div>

											<div class="clearfix">
												<label class="inline"> <!--[if lte IE 8]>
													<input type="checkbox"  name="ch" ${ch} /> 
												<![endif]--> <!--[if gte IE 9]>
													<input type="checkbox" class="ace" name="ch" ${ch} /> 
												<![endif]--> <![if !IE]> <input type="checkbox" class="ace"
													name="ch" ${ch} /> <![endif]> <span class="lbl">
														十天内免登录 </span>
												</label>

												<button type="submit" id="btn-login-submit"
													class="width-35 pull-right btn btn-sm btn-primary">
													<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登录</span>
												</button>
												<a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe96bbd4187ab4e71&redirect_uri=http://paopao.viphk.ngrok.org/portal/weChat/weChatLogin.do&response_type=code&scope=snsapi_userinfo#wechat_redirect">微信登录</a>
											</div>

											<div class="space-4"></div>
										</fieldset>
									</form:form>
									<div class="space-6"></div>
									<!--
									<div class="social-or-login center">
										<span class="bigger-110">Or Login Using</span>
									</div>

									<div class="space-6"></div>

									<div class="social-login center">
										<a class="btn btn-primary"> <i
											class="ace-icon fa fa-facebook"></i>
										</a> <a class="btn btn-info"> <i
											class="ace-icon fa fa-twitter"></i>
										</a> <a class="btn btn-danger"> <i
											class="ace-icon fa fa-google-plus"></i>
										</a>
									</div>
									-->
								</div>
								<!-- /.widget-main -->

								<div class="toolbar clearfix">
									<div>
										<a href="#" data-target="#forgot-box"
											class="forgot-password-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 忘记密码了
										</a>
									</div>

									<div>
										<!--
										<a href="#" data-target="#signup-box" class="user-signup-link">
											I want to register <i class="ace-icon fa fa-arrow-right"></i>
										</a>
									-->
									</div>
								</div>
							</div>
							<!-- /.widget-body -->
						</div>
						<!-- /.login-box -->
						<div id="progress-bar-box" class="forgot-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header red lighter bigger">
										<i class="ace-icon fa fa-key"></i> 系统提示
									</h4>

									<div class="space-6"></div>

									<p>
										<font color="#000033"><b> 系统信息：</b></font><b><font
											color="#FF0000">登录中……</font></b>
									</p>


								</div>
								<!-- /.widget-main -->

								<div class="toolbar center">
									<a href="#" data-target="#login-box" class="back-to-login-link">
										Back to login <i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</div>
							</div>
							<!-- /.widget-body -->
						</div>
						<!-- /.progress-bar-box -->

						<div id="forgot-box" class="forgot-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header red lighter bigger">
										<i class="ace-icon fa fa-key"></i>找回密码
									</h4>

									<div class="space-6"></div>
									<p>输入注册的Email</p>
									<div class="space-6"></div>
									<form>
										<fieldset>
											<label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													type="email" name="email" id="email" class="form-control"
													placeholder="Email" /> <i class="ace-icon fa fa-envelope"></i>
											</span>
											</label>



											<div class="clearfix">
												<button type="button" id="btn-login-rp"
													class="width-35 pull-right btn btn-sm btn-danger">
													<i class="ace-icon fa fa-lightbulb-o"></i> <span
														class="bigger-110">发送</span>
												</button>
											</div>
										</fieldset>
									</form>
								</div>
								<!-- /.widget-main -->

								<div class="toolbar center">
									<a href="#" data-target="#login-box" class="back-to-login-link">
										返回登录 <i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</div>
							</div>
							<!-- /.widget-body -->
						</div>
						<!-- /.forgot-box -->

						<div id="signup-box" class="signup-box widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header green lighter bigger">
										<i class="ace-icon fa fa-users blue"></i> New User
										Registration
									</h4>

									<div class="space-6"></div>
									<p>Enter your details to begin:</p>

									<form>
										<fieldset>
											<label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													type="email" class="form-control" placeholder="Email" /> <i
													class="ace-icon fa fa-envelope"></i>
											</span>
											</label> <label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													type="text" class="form-control" placeholder="Username" />
													<i class="ace-icon fa fa-user"></i>
											</span>
											</label> <label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													type="password" class="form-control" placeholder="Password" />
													<i class="ace-icon fa fa-lock"></i>
											</span>
											</label> <label class="block clearfix"> <span
												class="block input-icon input-icon-right"> <input
													type="password" class="form-control"
													placeholder="Repeat password" /> <i
													class="ace-icon fa fa-retweet"></i>
											</span>
											</label> <label class="block"> <input type="checkbox"
												class="ace" /> <span class="lbl"> I accept the <a
													href="#">User Agreement</a>
											</span>
											</label>

											<div class="space-24"></div>

											<div class="clearfix">
												<button type="reset" class="width-30 pull-left btn btn-sm">
													<i class="ace-icon fa fa-refresh"></i> <span
														class="bigger-110">Reset</span>
												</button>

												<button type="button"
													class="width-65 pull-right btn btn-sm btn-success">
													<span class="bigger-110">Register</span> <i
														class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div>
										</fieldset>
									</form>
								</div>

								<div class="toolbar center">
									<a href="#" data-target="#login-box" class="back-to-login-link">
										<i class="ace-icon fa fa-arrow-left"></i> Back to login
									</a>
								</div>
							</div>
							<!-- /.widget-body -->
						</div>
						<!-- /.signup-box -->

					</div>
					<!-- /.position-relative -->

					<div class="navbar-fixed-top align-right">
						<br /> &nbsp; <a id="btn-login-dark" href="#">Dark</a> &nbsp; <span
							class="blue">/</span> &nbsp; <a id="btn-login-blur" href="#">Blur</a>
						&nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-light"
							href="#">Light</a> &nbsp; &nbsp; &nbsp;
					</div>
				</div>
				<!--  end login-container-->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.main-content -->
	<div align="center">
		<h6>
			建议WIN7以上系统使用IE9以上浏览器，XP、MAC系统使用<a
				href="http://rj.baidu.com/soft/detail/14744.html?ald"
				target="_blank">谷歌浏览器</a> 分辨率1024*768以上为佳
		</h6>
	</div>
</div>
<!-- /.main-container -->

<div align="center" style="height: 50px"></div>
<div align="center" id="copyright-text" class="blue">中国河南胜讯网络集团 |
	客服电话：400</div>
<!-- inline scripts related to this page -->
<script type="text/javascript">
	jQuery(function($) {
		$(document).on('click', '.toolbar a[data-target]', function(e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible');//hide others
			$(target).addClass('visible');//show target
		});
		$('body').attr('class', 'login-layout light-login');
		$('#id-text2').attr('class', 'grey');
		$('#id-company-text').attr('class', 'blue');
	});

	//you don't need this, just used for changing background
	jQuery(function($) {	
		$('#btn-login-dark').on('click', function(e) {
			$('body').attr('class', 'login-layout');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'blue');
			$('#copyright-text').attr('class', 'white');
			e.preventDefault();
		});
		$('#btn-login-light').on('click', function(e) {
			$('body').attr('class', 'login-layout light-login');
			$('#id-text2').attr('class', 'grey');
			$('#id-company-text').attr('class', 'blue');
			$('#copyright-text').attr('class', 'blue');
			e.preventDefault();
		});
		$('#btn-login-blur').on('click', function(e) {
			$('body').attr('class', 'login-layout blur-login');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'light-blue');
			$('#copyright-text').attr('class', 'white');
			e.preventDefault();
		});
		$('#btn-login-submit').on('click', function(e) {
			$('.widget-box.visible').removeClass('visible');//hide others
			$('#progress-bar-box').addClass('visible');
			$.ajax({
				type : "post",
				url : "/portal/login/checkLogin.do",
				data : {
					account : $('#account').val(),
					password : $('#password').val()
				},
				success:function(rst,msg){
					if(!rst.state){						
						bootbox
						.dialog({
							title : '系统提示',
							message : "<h2>"									
									+ rst.errorMessage
									+"请重新输入"
									+ "</h2>",
							buttons : {
								"success" : {
									"label" : "<i class='ace-icon fa fa-check'></i>确定",
									"className" : "btn-sm btn-success",
									"callback" : function() {
										$('#login-box').addClass('visible');
										$('#progress-bar-box').removeClass('visible');
										$('#password').val("");
									}
								}
							}
						});
					}
					else{
						$(location).attr('href', '/portal/dynamic/console/index.jsp');
					}
				},
				error : function(XMLHttpRequest,
						textStatus, errorThrown) {
					$('.widget-box').addClass('visible');//hide others
					$('#progress-bar-box').removeClass('visible');
					bootbox
							.dialog({
								title : '系统提示',
								message : "<h2>"
										+ XMLHttpRequest.status
										+ " "
										+ textStatus
										+ "</h2>",
								buttons : {
									"success" : {
										"label" : "<i class='ace-icon fa fa-check'></i>确定",
										"className" : "btn-sm btn-success",
										"callback" : function() {

										}
									}
								}
							});
				}
			});
		});
		$('#btn-login-rp')
				.on(
						'click',
						function(e) {
							$
									.ajax({
										type : "post",
										url : "/portal/system/retrievePassword.do",
										data : {
											email : $('#email').val()
										},
										beforeSend : function(XMLHttpRequest) {
											style_ajax_button('btn-login-rp',
													true);
										},
										success : function(rst, textStatus) {
											style_ajax_button('btn-login-rp',
													false);
											if (rst) {
												bootbox
														.dialog({
															title : '系统提示',
															message : rst.errorMessage,
															detail : rst.detail,
															buttons : {
																"success" : {
																	"label" : "<i class='ace-icon fa fa-check'></i>确定",
																	"className" : "btn-sm btn-success",
																	"callback" : function() {

																	}
																}
															}
														});

											}
										},
										complete : function(XMLHttpRequest,
												textStatus) {
											//style_ajax_button('btn-login-rp',false);
										},
										error : function(XMLHttpRequest,
												textStatus, errorThrown) {
											style_ajax_button('btn-login-rp',
													false);
											bootbox
													.dialog({
														title : '系统提示',
														message : "<h2>"
																+ XMLHttpRequest.status
																+ " "
																+ textStatus
																+ "</h2>",
														buttons : {
															"success" : {
																"label" : "<i class='ace-icon fa fa-check'></i>确定",
																"className" : "btn-sm btn-success",
																"callback" : function() {

																}
															}
														}
													});
										}
									});
						});
		//e.preventDefault();
	});
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
</script>
<jsp:directive.include file="includes/bottom.jsp" />



