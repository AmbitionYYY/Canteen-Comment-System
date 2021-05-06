<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/25
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>星级评分系统</title>
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <style>
        body, div, ul, li, p {
            margin: 0;
            padding: 0;
        }

        body {
            color: #666;
            font: 12px/1.5 Arial;
        }

        ul {
            list-style-type: none;
        }

        #star {
            position: relative;
            width: 600px;
            margin: 15px auto;
        }

        #star ul, #star span {
            float: left;
            display: inline;
            height: 35px;
            line-height: 35px;
        }

        #star ul {
            margin: 0 10px;
        }

        #star li {
            float: left;
            width: 35px;
            cursor: pointer;
            text-indent: -9999px;
            background: url(${pageContext.request.contextPath}/assets/img/star1.png) no-repeat;
        }

        #star strong {
            color: #f60;
            padding-left: 10px;
        }

        #star li.on {
            /*background-position: 0 -10px;*/
            background-image: url("${pageContext.request.contextPath}/assets/img/star1.png");

        }

        #star li.off {
            background-image: url("${pageContext.request.contextPath}/assets/img/star0.png");
        }

        #star p {
            position: absolute;
            top: 20px;
            width: 159px;
            height: 60px;
            display: none;
            background: url(${pageContext.request.contextPath}/assets/img/duihuakuang.jpg) no-repeat;
            padding: 7px 10px 0;
        }

        #star p em {
            color: #f60;
            display: block;
            font-style: normal;
        }

        #formdiv {
            margin-top: 90px;
            margin-left: 30%;
        }
    </style>
</head>
<body>

<%--<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/user/user-header.jsp"></jsp:include>--%>
<div id="star">

    <span>当前评价的菜品id为:${dishid}</span><br/><br/><br/>
    <span>点击星星就能打分</span>

    <ul>
        <li><a id="1" href="javascript:;">1</a></li>
        <li><a id="2" href="javascript:;">2</a></li>
        <li><a id="3" href="javascript:;">3</a></li>
        <li><a id="4" href="javascript:;">4</a></li>
        <li><a id="5" href="javascript:;">5</a></li>
    </ul>
    <p></p>
    <span></span>
</div>
<br/>
<%--评论信息和打分情况--%>
<div id="formdiv">
    <span>请输入评价：</span>
    <form id="commentform" action="${pageContext.request.contextPath}/canteen/comment-dish" method="post">
        <textarea id="commentcontent" rows="8" cols="80" name="content" placeholder="请输入评价"></textarea>
        <%--                此处为score设置了默认值3--%>
        <input type="hidden" id="score" value="3" name="score"/>
        <input type="hidden" id="dishid" value="" name="dishid"/>

        <br/><br/><br/><br/>
        <div class="am-cf">
            <a href="javascript:SaveCommentInfo(${dishid})" class="am-btn am-btn-primary am-btn-sm am-fl">保存并退出</a>&nbsp;&nbsp;&nbsp;
            <%--                返回按钮--%>
            <a href="${pageContext.request.contextPath}/canteen/canteenDishes-show" id="registerbtn"
               class="am-btn am-btn-primary am-btn-sm am-fl">返回菜品页面</a>
        </div>
    </form>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript">
    // 开始实现五星打分功能
    var obj, aMsg = [
        "很不满意|差得太离谱，与餐厅描述的严重不符，非常不满",
        "不满意|菜品很差，与餐厅描述的不符，不满意",
        "一般|味道一般，没有卖家描述的那么好",
        "满意|菜品不错，与餐厅描述的基本一致，还是挺满意的",
        "非常满意|味道非常好，与餐厅描述的完全一致，超赞！"
    ];
    $("ul li").on({
        "mouseenter": function () {
            $("ul li").removeClass("on");
            $(this).removeClass("off").prevAll().addClass("on").removeClass("off");
            $(this).nextAll().addClass("off");

            //悬浮框
            var index = $(this).index();
            $("p").html("<em><b>" + (index + 1) + "分&nbsp;</b>" + aMsg[index].match(/(.+)\|/)[1] + "</em>" + aMsg[index].match(/\|(.+)/)[1]).css({"left": $("p").offset().left + (index + 1) * 24}).show();
        },
        "mouseleave": function () {
            $("ul li").removeClass("on");
            obj && obj.addClass("on").prevAll().addClass("on");
            $("p").hide();
        },
        "click": function () {
            obj = $(this);//记录当前点击的小星星
            $(this).removeClass("off").prevAll().addClass("on").removeClass("off");
            $(this).nextAll().addClass("off");

            //显示框
            var index = $(this).index();
            $("span").eq(1).html("<strong>" + (index + 1) + "分&nbsp;</strong>(" + aMsg[index].match(/\|(.+)/)[1] + ")");
            alert("您给此菜打了" + (index + 1) + "分！");
            $("#score").val(index + 1);
        }
    });
    // 结束实现五星打分功能

    //    提交评论信息按钮
    function SaveCommentInfo(dishid) {
        var content=$("#commentcontent").val();
        if(content==""|| content==null){
            alert("评论内容不能为空！！")
        }else {
            filter();
            $("#dishid").val(dishid);
            $("#commentform").submit();
        }
    }
    
//    评论信息敏感词过滤
    function filter() {
// 获取输入框的内容inputContent
        var inputContent = document.getElementById("commentcontent");
        console.info(inputContent.value);
        // 多个敏感词，这里直接以数组的形式展示出来
        var arrMg = ["辣鸡","垃圾", "tmd", "他妈的","混蛋"];

        // 显示的内容--showContent
        var showContent = inputContent.value;
        showContent=showContent.toString();
        // 正则表达式
        // \d 匹配数字

        for (var i = 0; i < arrMg.length; i++) {

            // 创建一个正则表达式
            var r = new RegExp(arrMg[i], "ig");
            showContent = showContent.replace(r, "*");
        }
        // 显示的内容--showInput
        $("#commentcontent").val(showContent);
        console.info(showContent);
    }
</script>
</body>
</html>