<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/13
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
<div class="header">
    <div class="am-g">
        <h1>衡水学院校园餐厅点评管理系统注册界面</h1>
        <p>Hengshui University canteen comment management system<br/>以服务求生存，以管理求效益以品质求发展。</p>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <h3 style="font-size: large;font-max-size: larger">注册:</h3>
        <br>
        <div style="margin-left: 25%">
            <form action="${pageContext.request.contextPath}/user/user-register" method="post" id="registerForm"
                  class="am-form">


                <label for="username">用户名:</label>
                <input type="text" name="username" id="username" onblur="checkName(this.value)" placeholder="请输入你的用户名">
                <span style="color:red" id="spanname"></span>

                <br>
                <label for="user-pwd1">密码:</label>
                <input type="password" name="password" id="user-pwd1" placeholder="请输入你的密码">
                <span style="color:red" id="spanpwd1"></span>

                <br>
                <label for="user-pwd2">请确认密码:</label>
                <input type="password" onblur="repeatPassword()" name="password2" id="user-pwd2"
                       placeholder="请再次输入你的密码">
                <span style="color:red" id="spanpwd2"></span>
                <br>
                <%--<label for="avatar" >头像:</label>
                <input type="file" name="avatar" id="avatar" value="请选择你的头像">
                <br>--%>
                <label for="name">姓名:</label>
                <input type="text" name="name" id="name" placeholder="请输入你的姓名">
                <br>
                <label for="studentID">学号:</label>
                <input type="text" name="studentID" id="studentID" placeholder="请输入你的学号">
                <br>
                <label for="studentID">专业:</label>
                <input type="text" name="profession" id="profession" placeholder="请输入你的专业">
                <br>
                <label for="motto">座右铭:</label>
                <input type="text" name="motto" id="motto" placeholder="随便说点什么吧...我啪的一下就点提交了，很快啊！">
                <br>
                <input type="hidden" name="avatar" id="avatar" value="dog.jpg">
                <div class="am-cf">
                    <a href="javascript:UserRegister()" id="loginbtn"
                       class="am-btn am-btn-primary am-btn-sm am-fl">提交</a>&nbsp;&nbsp;&nbsp;
                    <%--                注册按钮--%>
                    <a href="javascript:UserLogin()" value="返回登陆界面" id="registerbtn"
                       class="am-btn am-btn-primary am-btn-sm am-fl">返回登陆界面</a>
                </div>
            </form>
        </div>

        <hr>
        <p style="text-align: center;font-size: small;color: #c2c2c2">管理员登录点击此处</p>
    </div>
</div>
</body>
<script>
    <%--    登录跳转--%>

    function UserLogin() {
        location.href = "${pageContext.request.contextPath}/login.jsp";
    }

    //两次输入的密码是否一致验证
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

    //检查用户名是否存在
    var cn = false;

    function checkName(username) {
        //alert(username);
        //执行检测
        $.ajax({
            url: "${pageContext.request.contextPath }/user/check-username",
            type: "post",
            data: "username=" + username,
            dataType: "json",
            success: function (obj) {
                console.log(obj);
                //true表示存在
                if (obj.key) {
                    $("#spanname").text("用户名已经被人抢先注册了!换一个吧！");
                } else {
                    $("#spanname").text("");
                    cn = true;
                }

            }
        });
    }

    function UserRegister() {
        var rp = repeatPassword();

        //再次验证用户名是否存在  cn= true /false
        //再次验证两次密码是否一致  repeatPassword() true/false
        if (rp && cn) {
            $("#registerForm").submit();
            alert("提交成功！！");
        } else {
            alert("您输入的信息存在错误！请三思而后行！！！");
        }
    }

</script>
</html>