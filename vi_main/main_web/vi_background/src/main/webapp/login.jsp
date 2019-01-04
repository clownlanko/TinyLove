<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/TinyLove/vib/images/vi.png">
<link href="/TinyLove/vib/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="/TinyLove/vib/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="/TinyLove/vib/assets/css/ace.min.css" />
<link rel="stylesheet" href="/TinyLove/vib/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="/TinyLove/vib/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="/TinyLove/vib/css/style.css"/>
<title>微爱·后台登陆</title>
</head>
<body class="login-layout">
	<div class="logintop">
		<span style="background-size: 20px 20px">欢迎登陆微爱后台</span>
		<ul>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<h1>
					<i class="icon-leaf green"></i> <span class="orange">TinyLove</span> <span
						class="white">微爱后台管理系统</span>
				</h1>
				<h4 class="white">TinyLove Background Management System</h4>
			</div>
			<div class="space-6"></div>
			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="widget-body">
						<div class="widget-main">
							<h4 class="header blue lighter bigger">
								<i class="icon-coffee green"></i> 管理员登陆
							</h4>
							<div class="login_icon">
								<img src="/TinyLove/vib/images/login.png" />
							</div>
							<form id="login">
								<fieldset>
									<label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="text" class="form-control" placeholder="account"
											name="name"> <i class="icon-user"></i>
									</span>
									</label> <label class="block clearfix"> <span
										class="block input-icon input-icon-right"> <input
											type="password" class="form-control" placeholder="password"
											name="password"> <i class="icon-lock"></i>
									</span>
									</label>
									<div class="space"></div>
									<div class="clearfix">
										<button accesskey="13" type="button"
											class="width-35 pull-right btn btn-sm btn-primary"
											id="login_btn">
											<i class="icon-key"></i> 登陆
										</button>
									</div>
									<div class="space-4"></div>
								</fieldset>
							</form>
							<div class="social-or-login center">
								<span class="bigger-110">通知</span>
							</div>
							<div class="social-login center">本网站系统不再对IE8以下浏览器支持，请见谅。</div>
						</div>
						<!-- /widget-main -->
						<div class="toolbar clearfix"></div>
					</div>
					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<div class="loginbm">
		版权所有 2018 <a href="http://www.genitalbean.top/TinyLove">那家印象有限公司</a>
	</div>
    <script src="/TinyLove/vib/js/jquery.min.js"></script>
	<script src="/TinyLove/vib/assets/js/ace-extra.min.js"></script>
	<script src="/TinyLove/vib/layui/layui.js" type="text/javascript"></script>
	<script src="/TinyLove/vib/js/login.js"></script>
</body>
</html>