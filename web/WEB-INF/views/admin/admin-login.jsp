<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/20
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login.css"/>
</head>
<body>
<c:if test="${flag==1}">
    <script>
        alert("密码或用户名输入错误！请检查后重新输入！！！");
    </script>
</c:if>

<div id="box">
    <div class="item">
        <div class="title">
            <h3>后台系统登录</h3>
            <p> Background system Login</p>
        </div>
        <form action="${pageContext.request.contextPath}/admin/admin-login" method="post">
            <div class="login-box">
                <div class="zh">
                    <label>账&nbsp;号:</label>
                    <input type="text" name="adminname" id="adminname" class="text" placeholder="请输入账号"/>
                </div>
                <div class="password">
                    <label>密&nbsp;码:</label>
                    <input type="password" name="adminpassword" id="adminpwd" class="pwd" placeholder="请输入密码"/>
                </div>
                <input type="submit" class="login" id="login" value="登录"></input>
            </div>
        </form>
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath}/assets/js/main.js" type="text/javascript">
</script>
</html>

