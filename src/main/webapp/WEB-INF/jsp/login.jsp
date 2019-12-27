<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>人力资源管理系统登录</title>
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/reset.css"/>
    <script src="/js/jquery-1.11.3.min.js" type="text/javascript"></script>
</head>
<body>

<div id="particles-js" style="height: auto">
    <form action="/login" method="post" id="loginForm">
        <div style="text-align: center;color: white;font-size: 30px;padding-top: 60px">
            人力资源管理系统
        </div>
        <div class="login">
            <div class="login-top">
                登录
            </div>
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="/img/name.png"/></div>
                <div class="login-center-input">
                    <input type="text" name="username" value="${last_username}" placeholder="请输入您的用户名"  onfocus="this.placeholder='';$('#info').html('')"
                           onblur="this.placeholder='请输入您的用户名'" autocomplete="off" />
                    <div class="login-center-input-text">用户名</div>
                </div>
            </div>
            <div class="login-center clearfix">
                <div class="login-center-img"><img src="/img/password.png"/></div>
                <div class="login-center-input">
                    <input type="password" name="password" value="" placeholder="请输入您的密码" onfocus="this.placeholder='';$('#info').html('')"
                           onblur="this.placeholder='请输入您的密码'"/>
                    <div class="login-center-input-text">密码</div>
                </div>
            </div>
            <div class="login-button" onclick="toSubmit()"> <%--document:loginForm.submit()--%>
                登陆
            </div>
            <div id="info" style="text-align: center;margin-top: 35px;font-size: 14px;color: red">${SPRING_SECURITY_LAST_EXCEPTION.message}</div>
        </div>

    </form>
    <div class="sk-rotating-plane"></div>
</div>
<div style="text-align: center;background: #352F2F;color: white;font-size: 14px; height: 23px;width: auto">@计科1174-史文杰</div>
<!-- scripts -->
<script src="/js/particles.min.js"></script>
<script src="/js/app.js"></script>
<script type="text/javascript">
    function hasClass(elem, cls) {
        cls = cls || '';
        if (cls.replace(/\s/g, '').length == 0) return false; //当cls没有参数时，返回false
        return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
    }

    function addClass(ele, cls) {
        if (!hasClass(ele, cls)) {
            ele.className = ele.className == '' ? cls : ele.className + ' ' + cls;
        }
    }

    function removeClass(ele, cls) {
        if (hasClass(ele, cls)) {
            var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '') + ' ';
            while (newClass.indexOf(' ' + cls + ' ') >= 0) {
                newClass = newClass.replace(' ' + cls + ' ', ' ');
            }
            ele.className = newClass.replace(/^\s+|\s+$/g, '');
        }
    }

    function toSubmit() {
        // $("#loginForm")
        if ($("input[name='username']").val()==''){
            $("#info").html('您还没有输入用户名！');
            return false;
        }
        if ($("input[name='password']").val()==''){
            $("#info").html('您还没有输入密码！');
            return false;
        }
        $("#loginForm").submit();
    }


</script>
</body>
</html>