<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/13
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>衡水学院校园餐厅点评管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }

        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .header p {
            font-size: 14px;
        }

        #loginbtn {
            float: left;
        }

        #registerbtn {
            float: right;
            margin-right: 600px;
        }
    </style>
</head>
<body>
<c:if test="${flag==1}">
    <script>
        alert("密码或用户名输入错误！请检查后重新输入！！！");
    </script>
</c:if>
<c:if test="${flag==2}">
    <script>
        alert("用户名或密码不能为空，请检查后重新输入！！！");
    </script>
</c:if>

<div class="header">
    <div class="am-g">
        <h1>衡水学院校园餐厅点评管理系统登陆界面</h1>
        <p>Hengshui University canteen comment management system<br/>以服务求生存，以管理求效益以品质求发展。</p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3 style="font-size: large;font-max-size: larger">用户登录:</h3>
        <hr>
        <br>
        <span style="color: red" id="loginmsg">${requestScope.loginmsg}</span>
        <form action="${pageContext.request.contextPath}/user/user-login" method="post" class="am-form">
            <label for="username">账号:</label>
            <input type="text" name="username" id="username" value="" placeholder="请输入您的用户名">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="password" id="password" value="" placeholder="请输入密码">
            <br>
            <label for="remember-me">
                <input id="remember-me" type="checkbox">
                记住密码
            </label>
            <br/>
            <div class="am-cf">
                <input type="submit" name="" value="登 录" id="loginbtn" class="am-btn am-btn-primary am-btn-sm am-fl">
                <%--                注册按钮--%>
                <a href="javascript:UserRegistershow()" value="注 册" id="registerbtn"
                   class="am-btn am-btn-primary am-btn-sm am-fl">注册</a>
                <input type="button" name="" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
            </div>
        </form>

        <hr>
        <p style="text-align: center;font-size: small;color: #c2c2c2"><a
                href="${pageContext.request.contextPath}/admin/admin-login-show">管理员登录点击此处</a></p>
    </div>
</div>
</body>
<script>

    function UserRegistershow() {
        location.href = "${pageContext.request.contextPath}/user/user-register-show";
    }
</script>
</html>