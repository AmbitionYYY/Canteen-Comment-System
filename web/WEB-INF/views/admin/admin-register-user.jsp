<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2021/4/17
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户注册确认页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
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
        <li class="nav-lists"><a style="color: white" href="${pageContext.request.contextPath}/admin/releaseAnnouncement">校园公告</a></li>
        <li class="nav-lists"><a style="color: white" href="${pageContext.request.contextPath}/admin/resolveMessage">反馈处理</a></li>
        <li class="nav-lists"><a style="color: white" href="${pageContext.request.contextPath}/admin/userRegister">用户注册</a></li>
        <li style="width: 230px"><a style="color: white" href="javascript:">欢迎您：&nbsp;&nbsp;&nbsp;<span
                style="color: #0e90d2;font-size: larger " class="am-badge am-badge-warning">${sessionScope.name}</span></a>
        </li>
        <li class="ico">三</li>
    </ul>
</div>
<%--头部结束--%>
<!-- 正文开始 -->
<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户注册管理页面</strong> / <small>User registration confirmation</small></div>
        </div>
        <hr>

        <%--用户注册确认功能--%>
        <div class="am-g">
            <div class="am-u-sm-12">
                <table class="am-table am-table-bd am-table-striped admin-content-table">
                    <thead>
                    <tr>
                        <th>ID</th><th>用户名</th><th>姓名</th><th>学号</th><th>专业</th><th>管理</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${unregisterUsers}" var="unregisterUser">
                    <tr><td>${unregisterUser.userid}</td>
                        <td>${unregisterUser.username}</td>
                        <td>${unregisterUser.name}</td>
                        <td><span class="am-badge am-badge-success">${unregisterUser.studentID}</span></td>
                        <td>${unregisterUser.profession}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/passRegister?userid=${unregisterUser.userid}"  class="am-btn am-btn-primary"><span style="color: whitesmoke">通过注册</span></a></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%--用户注册功能结束--%>

    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>
<!-- 正文结束 -->
</body>

<script type="text/javascript">

</script>
</html>