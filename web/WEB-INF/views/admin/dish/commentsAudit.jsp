<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2021/3/27
  Time: 10:37
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

<%--主体开始--%>
<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">菜品评论审核界面</strong> /
                <small>dishes-comments-audit</small>
            </div>
        </div>
        <hr>

        <%--菜品评论查看模块开始--%>
        <div class="am-g">
            <div class="am-u-sm-12">
                <table   class="am-table am-table-bd am-table-striped admin-content-table">
                    <thead>
                    <tr>
                        <th >菜品ID</th>
                        <th >菜品图片</th>
                        <th>菜品名称</th>
                        <th>位置</th>
                        <th >评论数量</th>
                        <th>管理</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="dish">
                    <tr>
                        <td style="padding-top: 145px" >${dish.dishid}</td>
                        <td ><div class="cp-img"><img src="/dish/${dish.avatar}"/></div></td>
                        <td style="padding-top: 145px">${dish.name}</td>
                        <td style="padding-top: 145px">${dish.loc_Canteen}</td>
                        <td style="padding-top: 145px">${dish.comments}</td>
                        <td style="padding-top: 145px">
<%--                            <button class="am-btn am-btn-default"  onclick="javascript:viewCommentsByDishId(${dish.dishid})">查看此菜品所有评论</button>--%>
                            <button class="am-btn am-btn-danger" onclick="javascript:viewCommentsByDishId(${dish.dishid})" >查看此菜品所有评论</button>
<%--                            data-am-modal="{target: '#comment-model'}"--%>

                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%--菜品评论模块结束结束--%>

    </div>
</div>
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
                           href="${pageContext.request.contextPath}/admin/commentsAudit?currentPage=${pageInfo.pageNum-1}">«</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <%--遍历所有导航页号并显示出来，当遍历到当前页时使当前页的页码变色--%>
            <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                <c:choose>
                    <c:when test="${pageInfo.pageNum==num}">
                        <li class="am-active"><a
                                href="${pageContext.request.contextPath}/admin/commentsAudit?currentPage=${num}">${num}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li style="color: black"><a style="color: black"
                                                    href="${pageContext.request.contextPath}/admin/commentsAudit?currentPage=${num}">${num}</a>
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
                           href="${pageContext.request.contextPath}/admin/commentsAudit?currentPage=${pageInfo.pageNum+1}">»</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<%--页码结束--%>

<%--        模态窗口开始--%>
<%--<button class="am-btn am-btn-danger" data-am-modal="{target: '#comment-model'}">Popup</button>--%>
<div class="am-popup" id="comment-model">
    <div class="am-popup-inner">
        <div class="am-popup-hd">
            <h4 class="am-popup-title">评论列表</h4>
            <span data-am-modal-close
                  class="am-close">&times;</span>
        </div>
        <div class="am-popup-bd">
            <table>
                <thead>
                <tr>
                    <th width="100px">评论ID</th>
                    <th width="100px">用户名</th>
                    <th width="350px">内容</th>
                    <th width="150px">评论时间</th>
                    <th width="150px">星级评价</th>
                    <th width="100px">管理</th>
                </tr>
                </thead>
                <tbody id="test">

            <tr>
                <td id="comment_id"></td>
                <td id="username"></td>
                <td id="content"></td>
                <td id="createtime"></td>
                <td id="score"></td>
                <td>
                    <button class="am-btn am-btn-default" onclick="javascript;">删除</button>
                </td>
            </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%--        模态窗口结束--%>

</body>


<script type="text/javascript">
<%--    用来给模态窗口的数据赋值--%>

    function viewCommentsByDishId(dishId) {
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/viewComments",
            dataType:"json",
            type:"get",
            data:{
            dishId:dishId},
            success:function(data){
                $("#comment-model").modal();
                var commentList=data;
            //    给表格赋值
                var str1 = "";   //声明str1，防止产生undefined

                for (var i = 0; i < commentList.length; i++) {   //遍历
                    str1 += "<tr cate-id='0' fid='0'>" +
                        "<td>" + commentList[i].comment_id+ "</td>" +    //i代表下标，获取数据中的下标为i的1的值
                        "<td>" + commentList[i].username+ "</td>" +    //i代表下标，获取数据中的下标为i的2的值
                        "<td>" + commentList[i].content+ "</td>" +
                        "<td>" + commentList[i].createtime+ "</td>" +
                        "<td>" + commentList[i].score+"星"+"</td>"+    //i代表下标，获取数据中的下标为i的n的值，1-n是属性名
                        "<td>" + "<button class=\"am-btn am-btn-default\" onclick=\"javascript:delComment("+commentList[i].comment_id+");\">删除</button>" +"</td>";
                }
                test.innerHTML = str1;   //将数据写入html中
            },
            error:function () {
            console.log("未知错误！！")
            }
        })
    }
    //删除评论
    function delComment(commentId) {
        // alert(commentId);
       var conf= confirm("确定要删除此评论吗？");
       if (conf==true){
           location.href="${pageContext.request.contextPath}/admin/delComment?commentId="+commentId
       }
    }
</script>
</html>
