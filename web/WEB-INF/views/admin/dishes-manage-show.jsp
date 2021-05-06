<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/22
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>菜品管理页面</title>
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
        <li class="nav-lists"><a style="color: white"
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

<%--主体开始--%>
<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">菜品管理界面</strong> /
                <small>dishes-manage-show</small>
            </div>
        </div>

        <hr>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" onclick="javascript:addDish()" class="am-btn am-btn-default"><span
                                class="am-icon-plus"></span> 新增菜品
                        </button>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-input-group am-input-group-sm">
                    <input type="text" id="inputDishName" class="am-form-field">
                    <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" onclick="javascript:searchAndPage(1)" type="button">搜索</button>
          </span>
                </div>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-check"><input type="checkbox"/></th>
                            <th class="table-id">菜品ID</th>
                            <th class="table-title">菜品名称</th>
                            <th class="table-type">位置</th>
                            <th class="table-author am-hide-sm-only">窗口</th>
                            <th class="table-author am-hide-sm-only">价格</th>
                            <th class="table-date am-hide-sm-only">收到的喜欢数量</th>
                            <th class="table-date am-hide-sm-only">评论数量</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="dish">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>${dish.dishid}</td>
                                <td><a href="#">${dish.name}</a></td>
                                <td>${dish.loc_Canteen}</td>
                                <td class="am-hide-sm-only">${dish.loc_Window}</td>
                                <td class="am-hide-sm-only">${dish.price}</td>
                                <td class="am-hide-sm-only">${dish.likes}</td>
                                <td class="am-hide-sm-only">${dish.comments}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button value="${dish.dishid}" onclick="javascript:editDishInfo(this.value)"
                                                    class="am-btn am-btn-default am-btn-xs am-text-secondary"><span
                                                    class="am-icon-pencil-square-o"></span> 编辑
                                            </button>
                                            <button value="${dish.dishid}" onclick="javascript:removeDish(this.value)"
                                                    class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
                                                <span class="am-icon-trash-o"></span> 删除
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="am-cf">
                        共 ${pageInfo.pages} 页数据
                        <div style="margin-right: 100px" class="am-fr">
                            <ul class="am-pagination">
                                <%--                                设置上一页 « 按钮功能--%>
                                <c:choose>
                                    <c:when test="${pageInfo.pageNum<=1}">
                                        <li class="am-disabled"><a href="#">«</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="javascript:searchAndPage(${pageInfo.pageNum-1})">«</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <%--遍历所有导航页号并显示出来，当遍历到当前页时使当前页的页码变色--%>
                                <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                                    <c:choose>
                                        <c:when test="${pageInfo.pageNum==num}">
                                            <li class="am-active">
                                                <a href="javascript:searchAndPage(${num})">${num}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="javascript:searchAndPage(${num})">${num}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <%-- 设置下一页 » 按钮功能--%>
                                <c:choose>
                                    <c:when test="${pageInfo.pageNum>=pageInfo.pages}">
                                        <li class="am-disabled"><a href="#">»</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="javascript:searchAndPage(${pageInfo.pageNum+1})">»</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                    <hr/>
                    <p>欢迎使用衡水学院校园餐厅点评管理系统</p>
                </form>
            </div>

        </div>
    </div>
</div>
<%--主体结束--%>
<%--隐藏表单，用于添加各种数据--%>
<form action="${pageContext.request.contextPath}/admin/dishes-manage-show" id="hidForm" method="post">
<input type="hidden" name="currentPage" id="currentPage">
<input type="hidden" name="dishName" id="dishName">
<%--    <input type="hidden" name="selectedCanteen" id="selectedCanteen">--%>
</form>
</body>



<%--<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/index.js">
</script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/nav.js">
</script>

<script type="text/javascript">

<%--   分页与搜索功能的结合--%>
    function searchAndPage(currentPage) {
        //给隐藏框设置值
        $("#currentPage").val(currentPage);
        //根据餐厅号来查询菜品
        var inputDishName=$("#inputDishName").val();
        $("#dishName").val(inputDishName);
        // var dishName= document.getElementById("dishName").value;
        //表单提交
        $("#hidForm").submit();
    }


    <%--    跳转到添加菜品界面--%>
    function addDish() {
        location.href = "${pageContext.request.contextPath}/dish/add-dish-show";
    }

    //编辑菜品信息
    function editDishInfo(dishid) {
        location.href = "${pageContext.request.contextPath}/dish/edit-DishInfo-show?dishId=" + dishid;
        alert("要修改菜品的id为：" + dishid);

    }

    //    删除菜品信息
    function removeDish(dishid) {
        // alert("要删除菜品的id为："+dishid);
        var con = confirm("您确定要删除id为" + dishid + "的菜品吗？");
        if (con == true) {
            location.href = "${pageContext.request.contextPath}/dish/removeDish?dishId=" + dishid;
            alert("您已成功删除！！")
        } else {
            alert("下次别乱点了！！");
        }
    }
</script>
</html>
