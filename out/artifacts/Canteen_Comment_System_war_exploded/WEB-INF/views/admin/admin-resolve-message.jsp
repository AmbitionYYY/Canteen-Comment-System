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
    <title>反馈信息处理页面</title>
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
        <li class="nav-lists"><a href="master.html"></a></li>
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">反馈信息处理管理</strong> / <small>feedback-message-manage</small></div>
        </div>
        <hr>

        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th  class="table-title">反馈标题</th>
                            <th class="table-date am-hide-sm-only">餐厅地点</th>
                            <th class="table-type">反馈用户id</th>
                            <th class="table-author am-hide-sm-only">邮箱</th>
                            <th class="table-date am-hide-sm-only">电话</th>
                            <th class="table-date am-hide-sm-only">QQ</th>
                            <th class="table-date am-hide-sm-only">反馈内容</th>
                            <th class="table-date am-hide-sm-only">反馈时间</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="message">
                        <tr>
                            <td>${message.feedbackTitle}</td>
                            <td>
                                <c:if test="${message.address=='canteen1'}">
                                        第一餐厅
                                </c:if>
                                <c:if test="${message.address=='canteen2'}">
                                    第二餐厅
                                </c:if>
                                <c:if test="${message.address=='canteen3'}">
                                    第三餐厅
                                </c:if>
                            </td>
                            <td>${message.userid}</td>
                            <td class="am-hide-sm-only">${message.email}</td>
                            <td class="am-hide-sm-only">${message.phoneNumber}</td>
                            <td class="am-hide-sm-only">${message.qq}</td>
                            <td class="am-hide-sm-only">${message.feedbackContent}</td>
                            <td class="am-hide-sm-only">${message.createtime}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <%--<form id="delMessageForm" action="${pageContext.request.contextPath}/admin/delMessage"  method="post">
                                            <input hidden name="mid" value="${message.mid}">
                                        </form>--%>
<%--                                        <button onclick="javascript:delMessage(${message.mid})" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 反馈问题已解决</button>--%>
                                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="${pageContext.request.contextPath}/admin/delMessage?mid=${message.mid}">反馈问题已解决</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="am-cf">
                        共${pageInfo.pages}条记录
                        <div class="am-fr">
                            <ul class="am-pagination">
                            <%--   choose相当于switch,when相当于case,other相当于defalst  --%>
                                <%--设置上一页 « 按钮功能--%>
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
                    <hr />
                </form>
            </div>

        </div>
    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>
<!-- 正文结束 -->
</body>

  <script type="text/javascript">
             <%--   分页功能--%>
            function searchAndPage(currentPage) {
           //给隐藏框设置值
          location.href="${pageContext.request.contextPath}/admin/resolveMessage?currentPage="+currentPage;
                 }
      function delMessage(mid) {

          /*var url="${pageContext.request.contextPath}/admin/delMessage?mid="+mid;
          location.href=url;*/


        /* $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/admin/delMessage",
             data:{mid:mid},
             success:function (data) {
                 console.info("问题处理成功！");
             },
             error:function () {
                 console.info("未知错误！");
             }
         })*/
      }
 </script>
</html>