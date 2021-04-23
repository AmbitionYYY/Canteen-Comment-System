<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2021/4/17
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>菜品管理页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/heal.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/amazeui.js"></script>
    <style>
        .min-width{
            width: 1300px;
        }
        .heals ul li .heals-info .heals-span{
            width: 120px;
        }
        .heals ul,.heals{
            height: 200px;
        }
        body{
            overflow:auto;
        }
    </style>
</head>
<body>
<%--头部开始--%>
<div class="nav">
    <ul class="uu-nav">
        <li class="logo">校园餐厅管理界面</li>
        <li class="nav-lists"><a style="color: white" href="${pageContext.request.contextPath}/admin/toHomePage">首页</a>
        </li>
        <li class="nav-lists"><a style="color: white"
                                 href="${pageContext.request.contextPath}/admin/dishes-manage-show">菜品管理</a></li>
        <li class="nav-lists"><a style="color: white"
                                 href="${pageContext.request.contextPath}/admin/commentsAudit">评论审核</a></li>
        <li class="nav-lists"><a style="color: white"
        <li class="nav-lists"><a style="color: white" href="${pageContext.request.contextPath}/admin/releaseAnnouncement">校园公告</a></li>
        <li class="nav-lists"><a style="color: white" href="${pageContext.request.contextPath}/admin/resolveMessage">反馈处理</a></li>
        <li class="nav-lists"><a href="master.html"></a></li>
        <li style="width: 230px"><a style="color: white" href="javascript:">欢迎您：&nbsp;&nbsp;&nbsp;<span
                style="color: #0e90d2;font-size: larger " class="am-badge am-badge-warning">${sessionScope.name}</span></a>
        </li>
        <li class="ico">三</li>
    </ul>
</div>
<%--头部结束--%>

<%--正文开始--%>
<div style="margin-top: 50px">
    <form action="${pageContext.request.contextPath}/admin/saveAnnouncement"   method="post" class="am-form am-form-horizontal">
        <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">发布公告 / announce</label>
            <div class="am-u-sm-9">
                <textarea name="announcement" required class="" rows="5" id="user-intro" placeholder="发布校园公告内容"></textarea>
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">发布日期 / date</label>
            <div class="am-u-sm-9 am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input name="date" required type="date" class="am-form-field am-input-sm" placeholder="发布校园公告内容"></input>
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">发布时间 / time</label>
            <div class="am-u-sm-9 am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input name="time" required type="datetime-local" class="am-form-field am-input-sm" placeholder="发布校园公告时间"></input>
            </div>
        </div>

        <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="submit" class="am-btn am-btn-primary">确认发布公告</button>
                <button type="button" onclick="javascript:backToHome()" class="am-btn am-btn-primary">返回</button>
            </div>
        </div>
    </form>
</div>

<%--正文结束--%>
</body>
<script type="text/javascript">
    function backToHome() {
        location.href="${pageContext.request.contextPath}/admin/toHomePage";
    }
</script>
</html>
