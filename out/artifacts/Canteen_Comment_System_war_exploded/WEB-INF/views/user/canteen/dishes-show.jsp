<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/19
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>衡水学院校园餐厅点评管理系统首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/caipu.css"/>
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <style>
        ul{
            padding-left: 0;
        }
    </style>
</head>
<body>
<%--引入头部--%>
<jsp:include page="/WEB-INF/views/user/user-header.jsp"></jsp:include>
<%--引入头部结束--%>

<header>
    <div id="bananer">
        <div class="bananer">
            <img src="${pageContext.request.contextPath}/assets/img/banner1.jpg"/>
        </div>
    </div>
</header>
<%--头部结束--%>

<nav>
    <h3>菜品展示</h3>
    <h3></h3>
    <h4>"第一食堂"让你品尝不一样的味道！ 一个美食云集的地方。</h4>
</nav>
<div class="cp-list min-width">
    <ul style="height: 600px">
        <c:forEach items="${pageInfo.list}" var="dish">
            <li>
                <div class="cp-img"><img src="/dish/${dish.avatar}"/></div>
                <h4>菜品名称：${dish.name}</h4>
                评论: <span class="am-badge am-badge-danger">${dish.comments}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                喜欢:<span class="am-badge am-badge-secondary">${dish.likes}</span>
                <h3>享誉国际的美食</h3>
                <p>菜品所在位置：${dish.loc_Canteen}：第${dish.loc_Window}号窗口</p>
                <p>菜品描述：${dish.discription}</p>

                <strong><a style="color: whitesmoke" href="javascript:commentDish(${dish.dishid})"> 点评菜品</a></strong>
                <strong><a style="color: whitesmoke" href="javascript:dishDetail(${dish.dishid})"> 菜品详情</a></strong>

            </li>
        </c:forEach>
    </ul>
</div>
<br>
<%--页码开始--%>
<div class="am-cf">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共 ${pageInfo.pages} 页数据
    <div style="margin-right: 200px" class="am-fr">
        <ul class="am-pagination">
            <%--                                设置上一页 « 按钮功能--%>
            <c:choose>
                <c:when test="${pageInfo.pageNum<=1}">
                    <li class="am-disabled"><a href="#">«</a></li>
                </c:when>
                <c:otherwise>
                    <li><a style="color: black"
                           href="${pageContext.request.contextPath}/canteen/canteenDishes-show?currentPage=${pageInfo.pageNum-1}">«</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <%--遍历所有导航页号并显示出来，当遍历到当前页时使当前页的页码变色--%>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <c:choose>
                    <c:when test="${pageInfo.pageNum==num}">
                        <li class="am-active"><a
                                href="${pageContext.request.contextPath}/canteen/canteenDishes-show?currentPage=${num}">${num}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li style="color: black"><a style="color: black"
                                                    href="${pageContext.request.contextPath}/canteen/canteenDishes-show?currentPage=${num}">${num}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <%-- 设置下一页 » 按钮功能--%>
            <c:choose>
                <c:when test="${pageInfo.pageNum>=pageInfo.pages}">
                    <li class="am-disabled"><a style="color: black" href="#">»</a></li>
                </c:when>
                <c:otherwise>
                    <li><a style="color: black"
                           href="${pageContext.request.contextPath}/canteen/canteenDishes-show?currentPage=${pageInfo.pageNum+1}">»</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
</div>
<%--页码结束--%>

<%--尾部开始--%>
<footer>
    <p>友情链接 <a href="http://www.hsnc.edu.cn">进入官网</a>&nbsp;&nbsp;&nbsp; <a
            href="${pageContext.request.contextPath}/user/user-logout">注销用户</a></p>
</footer>
<%--尾部结束--%>
</body>
<script type="text/javascript">
    <%--    跳转点评菜品--%>

    function commentDish(dishid) {
        // alert("你点击的是"+dishid);
        location.href = "${pageContext.request.contextPath}/canteen/comment-dish-show?dishid=" + dishid;
    }

    //  跳转菜品详情
    function dishDetail(dishid) {
        location.href = "${pageContext.request.contextPath}/canteen/dish-detail-show?dishid=" + dishid;
    }

</script>
</html>
