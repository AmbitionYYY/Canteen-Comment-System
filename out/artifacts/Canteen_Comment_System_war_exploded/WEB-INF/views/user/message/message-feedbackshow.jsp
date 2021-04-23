<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2021/4/11
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>

<html>
<head>
    <title>信息反馈页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/amazeui.js"></script>

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

<div class="am-u-sm-12 am-u-md-8 ">
    <form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/Message/feedback-submit">
        <div class="am-form-group">
            <label for="feedbackTitle" class="am-u-sm-3 am-form-label">反馈标题</label>
            <div class="am-u-sm-9">
                <input type="text" name="feedbackTitle" required id="feedbackTitle" placeholder="请输入反馈标题 / Tittle">
                <small>简要概况需要反馈的内容</small>
            </div>
        </div>

        <div class="am-form-group">
            <label for="address"  class="am-u-sm-3 am-form-label">地点 / Address</label>
            <div class="am-u-sm-9">
                <select id="address" name="address">
                    <option value="canteen1">第一餐厅</option>
                    <option value="canteen2">第二餐厅</option>
                    <option value="canteen3">第三餐厅</option>
                </select>
                <small>需要改进的食堂</small>
            </div>
        </div>
        <div class="am-form-group">
            <label for="user-email"  class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
            <div class="am-u-sm-9">
                <input type="email" name="email" id="user-email" required placeholder="输入你的电子邮件 / Email">
                <small>常用的邮箱地址</small>
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-phone"  class="am-u-sm-3 am-form-label">电话 / Telephone</label>
            <div class="am-u-sm-9">
                <input type="tel" name="phoneNumber" id="user-phone" required placeholder="输入你的电话号码 / Telephone">
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
            <div class="am-u-sm-9">
                <input type="number" name="qq" pattern="[0-9]*" id="user-QQ" placeholder="输入你的QQ号码">
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-intro" class="am-u-sm-3 am-form-label">反馈内容 / Content of the feedback</label>
            <div class="am-u-sm-9">
                <textarea  required rows="5" name="feedbackContent" id="user-intro" placeholder="请输入您需要反馈的内容。"></textarea>
                <small>我们会根据您的反馈做出相应的改进！</small>
            </div>
        </div>
        <%--        用来保存存储登录用户的id--%>
        <input hidden name="userid" value="${sessionScope.loginUser.userid}">
<%--        用来存储默认ResolveType值--%>
        <input hidden name="ResolveType" value="0">
        <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="submit" class="am-btn am-btn-primary">提交</button>
                <button type="reset" class="am-btn am-btn-primary">重置</button>
                <a href="javascript:showfeedBackMessage('${sessionScope.username}')" class="am-btn am-btn-primary">查看我的反馈信息</a>
            </div>
        </div>
    </form>
<%--    模态窗口开始--%>
    <div class="am-popup" id="message-model">
        <div class="am-popup-inner">
            <div class="am-popup-hd">
                <h4 class="am-popup-title">我的反馈</h4>
                <span data-am-modal-close
                      class="am-close">&times;</span>
            </div>
            <div class="am-popup-bd">
                <table>
                    <thead>
                    <tr>
                        <th width="100px" style="padding-right: 50px">反馈标题</th>
                        <th width="100px" style="padding-right: 100px">反馈时间</th>
                        <th width="100px">反馈状态</th>
                    </tr>
                    </thead>
                    <tbody id="test">

                    <tr>
                        <td id="mid"></td>
                        <td id="createtime"></td>
                        <td id="status"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%--    模态窗口结束--%>


</div>
</body>
<script type="text/javascript">
    function showfeedBackMessage(username) {
        var i=0;
        $.ajax({
            url:"${pageContext.request.contextPath}/Message/viewMyMessage",
            type:"GET",
            // dataType:"json",
            data:{
                username:username},
            success:function (data) {

                $("#message-model").modal();
                var str1 = "";   //声明str1，防止产生undefined
                for (i;i<data.length;i++){
                   var status;
                   if (data[i].resolveType==0){status="未解决"}else {status="已解决"};
                    //遍历
                    str1 += "<tr cate-id='0' fid='0'>" +
                        "<td>" + data[i].feedbackTitle+ "</td>" +    //i代表下标，获取数据中的下标为i的1的值
                        "<td>" + data[i].createtime+"</td>"+    //i代表下标，获取数据中的下标为i的n的值，1-n是属性名
                        "<td>" + status+"</td>"
                }
                test.innerHTML = str1;   //将数据写入html中
            },
            error:function () {
                alert("发生未知错误！");
            }
        })
    }
</script>
</html>
