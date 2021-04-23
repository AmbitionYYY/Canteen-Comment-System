<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/20
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>衡水学院校园餐厅后台管理页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/faicon.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/heal.css"/>
<style>
    .strong{
        display: block;
        width: 140px;
        height: 36px;
        margin-top: 30px;
        line-height: 36px;
        color: white;
        text-align: center;
        background-color: rgb(172, 145, 90);
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
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/admin/dishes-manage-show">菜品管理</a></li>
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/admin/commentsAudit">评论审核</a></li>
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/admin/releaseAnnouncement">校园公告</a></li>
        <li class="nav-lists"><a href="${pageContext.request.contextPath}/admin/resolveMessage">反馈处理</a></li>
        <li class="nav-lists"><a href="master.html"></a></li>
        <li class="nav-lists"><a href="master.html"></a></li>

        <li style="width: 230px"><a href="javascript:">欢迎您：&nbsp;&nbsp;&nbsp;<span
                style="color: #0e90d2;font-size: larger " class="am-badge am-badge-warning">${sessionScope.name}</span></a>
        </li>
        <li class="ico">三</li>
    </ul>
</div>
<header>
    <div id="benner">
        <img src="${pageContext.request.contextPath}/assets/img/banner1.jpg">
    </div>
</header>
<%--头部结束--%>

<nav>
    <h3>后台管理</h3>
</nav>

<div class="heal min-width">.
    <div class="heal-left">
        <h1>菜品批量管理</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;稳定菜品质量。菜品做了量化以后，每出一道菜，包括面点和凉菜，都有合理标准量化表，操作人员可以根据配料表来配菜，避免了以往根据感觉和经验来下料，从而使每一道菜，每一次的菜量保持一致，使菜品的质量和数量有了保障，也减少了顾客的投诉率</p>
        <a class="strong" href="${pageContext.request.contextPath}/admin/dishes-manage-show">了解更多</a>
    </div>
    <div class="heal-right">
        <img src="${pageContext.request.contextPath}/assets/img/t4.jpg"/>
    </div>
    <div class="heal-left">
        <img src="${pageContext.request.contextPath}/assets/img/t1.jpg"/>
    </div>
    <div class="heal-right">
        <h1>评论审核</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理员需要对学校的餐厅评论信息进行一些审核过滤，有的同学可能会借此平台发布一些与食堂菜品无关的信息，对影响学生用餐氛围带有敏感字眼的评论需要管理员及时处理删除。</p>
        <a class="strong" href="${pageContext.request.contextPath}/admin/commentsAudit" >了解更多</a>
    </div>
    <div class="heal-left">
        <h1>校园公告</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学校餐厅是学生用餐的地方，校园公告栏放在本系统的首页最显眼的地方，使得学生进入系统即可看到餐厅或学校发布的一些信息，方便了学校以及餐厅的统一管理。</p>
        <a class="strong" href="${pageContext.request.contextPath}/admin/releaseAnnouncement" >了解更多</a>
    </div>
    <div class="heal-right">
        <img src="${pageContext.request.contextPath}/assets/img/health-1.jpg"/>
<%--        500*333大小的图片--%>
    </div>
</div>

<div class="heals min-width">.
    <ul>
        <li>
            <div class="heals-info">
                <div class="heals-span">❤</div>
                <div class="heals-wrpa">
                    <h3>健康小常识</h3>
                    <p>良好合理的健康饮食习惯，可使身体健康地生长、发育；不良的饮食习惯则会导致人体正常的生理功能紊乱而感染疾病。相反，恰当的饮食对疾病会起到治疗的作用，帮助人体恢复健康。</p>
                </div>
            </div>
            <div class="heals-p">
                <p>喝豆浆时不要加鸡蛋及红糖，也不要喝太多</p>
                <p>每天摄取均衡的饮食，不过量</p>
                <p>减少食用盐腌、烟熏及烧烤的食物</p>
                <p>每天摄取富含高纤维的五谷类及豆类</p>
                <p>空腹时不要吃蕃茄，最好饭后吃</p>
                <p>刚出炉的面包不宜马上食用</p>
                <p>坚持饮食健康习惯身体倍棒！</p>
            </div>


        </li>
        <li>
            <div class="heals-info">
                <div class="heals-span">❤</div>
                <div class="heals-wrpa">
                    <h3>健康小常识</h3>
                    <p>良好合理的健康饮食习惯，可使身体健康地生长、发育；不良的饮食习惯则会导致人体正常的生理功能紊乱而感染疾病。相反，恰当的饮食对疾病会起到治疗的作用，帮助人体恢复健康。</p>
                </div>
            </div>
            <div class="heals-p">
                <p>喝豆浆时不要加鸡蛋及红糖，也不要喝太多</p>
                <p>每天摄取均衡的饮食，不过量</p>
                <p>减少食用盐腌、烟熏及烧烤的食物</p>
                <p>每天摄取富含高纤维的五谷类及豆类</p>
                <p>空腹时不要吃蕃茄，最好饭后吃</p>
                <p>刚出炉的面包不宜马上食用</p>
                <p>坚持饮食健康习惯身体倍棒！</p>
            </div>


        </li>
        <li>
            <div class="heals-info">
                <div class="heals-span">❤</div>
                <div class="heals-wrpa">
                    <h3>健康小常识</h3>
                    <p>良好合理的健康饮食习惯，可使身体健康地生长、发育；不良的饮食习惯则会导致人体正常的生理功能紊乱而感染疾病。相反，恰当的饮食对疾病会起到治疗的作用，帮助人体恢复健康。</p>
                </div>
            </div>
            <div class="heals-p">
                <p>喝豆浆时不要加鸡蛋及红糖，也不要喝太多</p>
                <p>每天摄取均衡的饮食，不过量</p>
                <p>减少食用盐腌、烟熏及烧烤的食物</p>
                <p>每天摄取富含高纤维的五谷类及豆类</p>
                <p>空腹时不要吃蕃茄，最好饭后吃</p>
                <p>刚出炉的面包不宜马上食用</p>
                <p>坚持饮食健康习惯身体倍棒！</p>
            </div>

        </li>
    </ul>

</div>
<%--尾部开始--%>
<footer>
    <p>友情链接 <a href="http://www.hsnc.edu.cn">进入官网</a>&nbsp;&nbsp;&nbsp; <a
            href="${pageContext.request.contextPath}/admin/admin-logout">注销</a></p>
</footer>
<%--尾部结束--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/nav.js">
</script>
</body>
</html>
