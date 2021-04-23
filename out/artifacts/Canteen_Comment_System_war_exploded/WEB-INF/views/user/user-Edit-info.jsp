<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/17
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>衡水学院校园餐厅点评管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }

        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .header p {
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3 style="font-size: large;font-max-size: larger">个人资料:</h3>
        <br>
        <div style="margin-left: 25%">
            <form action="${pageContext.request.contextPath}/user/user-EditInfo" method="post" id="EditUserForm"
                  class="am-form" enctype="multipart/form-data">
                用户名:<input type="text" name="username" id="username" value="${user.username}" readonly>
                <br>
                密码:<input type="password" name="password" id="user-pwd1" placeholder="请输入你的密码">
                <span style="color:red" id="spanpwd1"></span>
                <br>
                请确认密码:<input type="password" onblur="repeatPassword()" name="password2" id="user-pwd2"
                             placeholder="请再次输入你的密码">
                <span style="color:red" id="spanpwd2"></span>
                <br>
                <label for="uploadavatar">头像(请上传尺寸大小为40*40px的图片):</label>
                <input type="file" name="uploadavatar" id="uploadavatar">
                <br>
                姓名:<input type="text" name="name" id="name" value="${user.name}">
                <br>
                学号:<input type="text" name="studentID" id="studentID" value="${user.studentID}">
                <br>
                专业:<input type="text" name="profession" id="profession" value="${user.profession}">
                <br>
                <label for="motto">座右铭:</label>
                <input type="text" name="motto" id="motto" value="${user.motto}">
                <br>

                <div class="am-cf">
                    <a href="javascript:EditUserInfo()" id="editbtn"
                       class="am-btn am-btn-primary am-btn-sm am-fl">保存并退出</a>&nbsp;&nbsp;&nbsp;
                    <%--                返回按钮--%>
                    <a href="${pageContext.request.contextPath}/index.jsp" id="registerbtn"
                       class="am-btn am-btn-primary am-btn-sm am-fl">返回首页</a>
                </div>
            </form>
        </div>
    </div>
</div>


<%--script代码--%>

<script type="text/javascript">

    // 两次输入的密码是否一致验证
    function repeatPassword() {
        //获取密码
        var p1 = $("#user-pwd1").val();
        var p2 = $("#user-pwd2").val();
        //alert(p1);
        //alert(p2);
        if (p1 != null && p1.length > 0) {
            if (p1 == p2) {
                $("#spanpwd1").text("");
                $("#spanpwd2").text("");
                return true;
            } else {
                $("#spanpwd1").text("");
                $("#spanpwd2").text("两次密码不一致！");
                return false;
            }
        } else {
            $("#spanpwd1").text("密码不能为空！");
            $("#spanpwd2").text("");
            return false;
        }
    }

    //    提交修改修改后的用户信息功能
    function EditUserInfo() {
        //alert("你点击了修改用户信息按钮！");
        var rp = repeatPassword();
        if (rp) {
            $("#EditUserForm").submit();
            alert("修改用户信息成功！");
        } else {
            alert("两次密码输入不一致，请检查您输入的密码！!");
        }
    }
</script>
</body>
</html>
