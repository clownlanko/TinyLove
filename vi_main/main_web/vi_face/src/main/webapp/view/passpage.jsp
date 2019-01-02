<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="lanko" />
    <meta name="keywords" content="微爱，婚纱" />
    <meta name="description" content="再微小的爱也应该得到敬重。" />
    <link rel="shortcut icon" type="image/x-icon" href="/TinyLove/vif/images/vi.png" />
    <title>微爱</title>
    <link rel="stylesheet" type="text/css" href="/TinyLove/vif/css/passpage.css" />
    <link rel="stylesheet" type="text/css" href="/TinyLove/vif/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="body">
    <div class="veen">
        <div class="login-btn splits">
            <p>已有账号?</p>
            <button>请登陆</button>
        </div>
        <div class="rgstr-btn splits">
            <p>没有账号?</p>
            <button>请注册</button>
        </div>
        <div class="wrapper">
            <div id="login">
                <h3>Login into TinyLove</h3>
                <div class="account">
                    <input type="text" name="key" title="账户" value="" placeholder="用户名/电话/邮箱">
                    <label>账户</label>
                </div>
                <div class="passwd">
                    <input type="password" value="" title="密码" name="password">
                    <label>密码</label>
                </div>
                <div class="forget-password text-right">
                    <a href="javascript:openForgetPasswordPannel();">忘记密码?</a>
                </div>
                <div class="submit">
                    <button class="dark" onclick="login()">登陆</button>
                </div>
            </div>
            <div id="register">
                <h3>Sign Up To TinyLove</h3>
                <div class="name">
                    <input type="text" name="userName" title="用户名" value="">
                    <label>用户名</label>
                </div>
                <div class="phone">
                    <input type="text" name="phone" onblur="checkPhone(this.value)" value="" title="电话">
                    <label>电话</label>
                </div>
                <div class="active-code">
                    <input type="text" name="activeCode" value="" title="验证码">
                    <button onclick="sendActiveCode(this)">获取验证码(60s)</button>
                    <label>验证码</label>
                </div>
                <div class="passwd">
                    <input type="password" name="password" value="" title="密码">
                    <label>密码</label>
                </div>
                <div class="confirm-passwd">
                    <input type="password" title="确认密码">
                    <label>确认密码</label>
                </div>
                <div class="submit">
                    <button class="dark" onclick="register()">注册</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="forget-password-pannel">
    <div class="name">
        <input type="text" name="userName" title="用户名" placeholder="用户名" value="">
    </div>
    <div class="phone">
        <input type="text" name="phone" onblur="checkPhone(this.value)" title="电话" placeholder="电话" value="">
    </div>
    <div class="active-code">
        <button onclick="sendActiveCode(this)">获取验证码(60s)</button>
    </div>
    <div class="active-code">
        <input type="text" name="activeCode" title="验证码" placeholder="验证码" value="">
    </div>
    <div class="passwd">
        <input type="password" name="password" title="密码" placeholder="密码" value="">
    </div>
    <div class="passwd">
        <input type="password" placeholder="确认密码" title="确认密码" value="">
    </div>
    <div class="submit">
        <button class="dark" onclick="changePassword()">确&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定</button>
    </div>
</div>
</body>
<script src="/TinyLove/vif/js/jquery.min.js"></script>
<script src="/TinyLove/vif/js/jquery.backstretch.min.js"></script>
<script src="/TinyLove/vif/layui/layui.js"></script>
<script src="/TinyLove/vif/js/passpage.js"></script>
</html>
