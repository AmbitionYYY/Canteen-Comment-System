<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2021/3/30
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入头部--%>
<jsp:include page="/WEB-INF/views/user/user-header.jsp"></jsp:include>
<%--引入头部结束--%>
<html>
<head>
    <title>食堂菜品排行</title>
</head>
<body>
<h1 style="margin-left: 550px;color: #e56c0c">食堂根据热度排行前三名菜品</h1>
<div class="news ">
    <ul class="min-width">
        <%int a=0;%>
        <c:forEach items="${dishrankListBycomments}" var="dish">
        <li>
            <div class="news-img">
                <img src="${pageContext.request.contextPath}/assets/img/${dish.avatar}"/>
            </div>
            <h4><a href="${pageContext.request.contextPath}/canteen/dish-detail-show?dishid=${dish.dishid}">${dish.name}</a></h4>
            <p>${dish.discription}</p>
            <p>评论数：${dish.comments}</p>
            <p>全校菜品热度排名：第<%a++;%><%=a%>名</p>
        </li>
        </c:forEach>
    </ul>
</div>
<h1 style="margin-left: 550px;color: #e56c0c">食堂根据评分排行前三名菜品</h1>
<div class="news ">
    <ul class="min-width">
        <%int b=0;
             ArrayList scoreList= (ArrayList) request.getAttribute("scoreList");
        %>
        <c:forEach items="${dishrankListByscore}" varStatus="scoreindex" var="dish">
            <li>
                <div class="news-img">
                    <img src="${pageContext.request.contextPath}/assets/img/${dish.avatar}"/>
                </div>
                <h4><a href="${pageContext.request.contextPath}/canteen/dish-detail-show?dishid=${dish.dishid}">${dish.name}</a></h4>
                <p>${dish.discription}</p>

                <p>综合评分：<%= scoreList.get(b)%></p>
                <p>全校菜品评分排名：第<%b++;%><%=b%>名</p>
            </li>
        </c:forEach>
    </ul>
</div>
<h1 style="margin-left: 550px;color: #e56c0c">食堂根据点赞数排行前三名菜品</h1>
<div class="news ">
    <ul class="min-width">
        <%int c=0;%>
        <c:forEach items="${dishrankListBylikes}" var="dish">
            <li>
                <div class="news-img">
                    <img src="${pageContext.request.contextPath}/assets/img/${dish.avatar}"/>
                </div>
                <h4><a href="${pageContext.request.contextPath}/canteen/dish-detail-show?dishid=${dish.dishid}">${dish.name}</a></h4>
                <p>${dish.discription}</p>
                <p>点赞次数：${dish.likes}</p>
                <p>全校菜品最受喜欢排名：第<%c++;%><%=c%>名</p>
            </li>
        </c:forEach>
    </ul>
</div>

<%--尾部开始--%>
<footer>
    <p>友情链接 <a href="http://www.hsnc.edu.cn">进入官网</a>&nbsp;&nbsp;&nbsp; <a
            href="${pageContext.request.contextPath}/user/user-logout">注销用户</a></p>
</footer>
<%--尾部结束--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/index.js">
</script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/nav.js">
</script>
</body>
</html>
