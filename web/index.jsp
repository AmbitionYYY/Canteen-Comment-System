<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/12
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html;" pageEncoding="utf-8" %>

<%--引入头部--%>
<jsp:include page="/WEB-INF/views/user/user-header.jsp"></jsp:include>
<%--引入头部结束--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<header>
    <div id="benner">
        <div class="img">
            <img src="${pageContext.request.contextPath}/assets/img/thirdCanteen1.png" class="imga active">
            <img src="${pageContext.request.contextPath}/assets/img/secondCanteen1.png" class="imga">
            <img src="${pageContext.request.contextPath}/assets/img/firstCanteen1.png" class="imga">
        </div>
        <ul class="title">
            <li class="nr active"></li>
            <li class="nr"></li>
            <li class="nr"></li>
        </ul>
    </div>
</header>
<nav >
    <h3>校园公告</h3>
    <p id="Announcementmsg">当前无校园公告</p>
   <p>发布日期： <span id="Announcementtime"></span></p>
</nav>
<div class="wrap">
    <h3>特性服务</h3>
    <ul class="wrap-uu">
        <li>
            <h2>美味的食物</h2>
            <p>这里的食物既美味又有营养，美食多多，种类丰富，欢迎您的到来！</p>
        </li>
        <li>
            <h2>各种饮料</h2>
            <p>闲暇的时光与同学品尝一杯牛奶燕麦，聊聊考试成绩也是一种不错的方式！</p>
        </li>
        <li>
            <h2>您的认可</h2>
            <p>我们专致于服务，以最好的姿态服务学生，您肯定是对我们最大的支持！</p>
        </li>
        <li>
            <h2>送货上门</h2>
            <p>我们为了更好服务同学，开通了外卖，让您足不出宿舍就能享受美食！</p>
        </li>
        <li>
            <h2>礼品赠送</h2>
            <p>我们在双“十二”推出了礼品赠送活动，礼品丰厚，期待您的参与！</p>
        </li>
        <li>
            <h2>私人订制</h2>
            <p>在您的特殊日子，例如：生日，纪念日等我们接受您的特殊要求！</p>
        </li>
    </ul>
</div>

<div class="news ">
    <ul class="min-width">
        <li>
            <div class="news-img">
                <img src="${pageContext.request.contextPath}/assets/img/pu1.jpg"/>
            </div>
            <h4>第一餐厅特色菜</h4>
            <p>我们有自己的特色菜，种类繁多，有家乡菜、农家菜、也有各地著名美食。</p>
        </li>
        <li>
            <div class="news-img">
                <img src="${pageContext.request.contextPath}/assets/img/pu2.jpg"/>
            </div>
            <h4>第二餐厅特色菜</h4>
            <p>我们有自己的特色菜，种类繁多，有家乡菜、农家菜、也有各地著名美食。</p>
        </li>
        <li>
            <div class="news-img">
                <img src="${pageContext.request.contextPath}/assets/img/pu3.jpg"/>
            </div>
            <h4>第三餐厅特色菜</h4>
            <p>我们有自己的特色菜，种类繁多，有家乡菜、农家菜、也有各地著名美食。</p>
        </li>
    </ul>
</div>
<%--尾部开始--%>
<footer>
    <p>友情链接 <a href="http://www.hsnc.edu.cn">进入官网</a>&nbsp;&nbsp;&nbsp; <a
            href="${pageContext.request.contextPath}/user/user-logout">注销用户</a></p>
</footer>
<%--尾部结束--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/index.js">
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/nav.js">
</script>
<script type="text/javascript">
    window.onload=function() {
        var announcementmsg;
        var announcementtime;
       $.ajax({
            url:"${pageContext.request.contextPath}/user/loadAnnouncement",
            dataType:"json",
            type:"get",
            success:function(data){
               announcementmsg= data.announcement;
               announcementtime=data.createtime;
               $("#Announcementmsg").text(announcementmsg);
               $("#Announcementtime").text(announcementtime);
            },
            error:function () {
                console.log("未知错误！");
            }
        })
    }
</script>
</body>
</html>
