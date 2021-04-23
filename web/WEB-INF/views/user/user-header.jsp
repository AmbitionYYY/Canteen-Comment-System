<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/12/14
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>衡水学院校园餐厅点评管理系统首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">

</head>
<body>
<%--头部开始--%>
<div class="nav">
    <ul class="uu-nav">
        <li class="logo">衡水学院校园餐厅</li>
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li class="nav-lists"><a style="color: white"
                                 href="${pageContext.request.contextPath}/canteen/canteenDishes-show">餐厅菜品</a></li>
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/canteen/Dishes-rank-show">美食排行</a></li>
        <li class="nav-lists"><a
                href="${pageContext.request.contextPath}/user/user-EditInfo-show?username=${sessionScope.username}&password=${sessionScope.password}">个人资料</a>
        </li>
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/Message/Message-feedback">消息反馈</a></li>
        <li class="nav-lists"><a style="color: white" href="caipu.html"></a></li>
        <%--        <li class="nav-lists"><a style="color: white" href="caipu.html"></a> </li>--%>
        <li class="nav-lists"><a href="master.html"></a></li>
        <c:if test="${sessionScope.name!=null}">
        <li style="width: 230px"><a href="javascript:">欢迎您：<img
                src="/upload/${sessionScope.avatar}">&nbsp;&nbsp;&nbsp;<span style="color: #0e90d2;font-size: larger "
                                                                             class="am-badge am-badge-warning">${sessionScope.name}</span></a>
        </li>
        </c:if>
        <li class="ico">三</li>
    </ul>
</div>

<%--头部结束--%>
