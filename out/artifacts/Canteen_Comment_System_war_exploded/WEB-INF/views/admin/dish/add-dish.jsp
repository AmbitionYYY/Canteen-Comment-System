<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/22
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加菜品信息界面</title>
    <meta name="keywords" content="form">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->


<!-- content start -->
<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf">
                <strong class="am-text-primary am-text-lg">添加菜品</strong> /
                <small>add-dish</small>
            </div>
        </div>

        <hr>

        <div class="am-tabs am-margin" data-am-tabs>
            <ul class="am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active"><a href="#tab1">菜品信息</a></li>
            </ul>

            <div class="am-tabs-bd">
                <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                    <form id="add_form" action="${pageContext.request.contextPath}/dish/add-dish" method="post"
                          enctype="multipart/form-data">
                        菜品名称：<input name="name" required placeholder="请输入菜品名称"><br>
                        <p></p>
                        菜品价格：<input id="price" required name="price" placeholder="请输入菜品价格"><br>
                        <p></p>
                        选择餐厅:
                        <select name="loc_Canteen" data-am-selected="{btnSize: 'sm'}">
                            <option value="第一餐厅">第一餐厅</option>
                            <option value="第二餐厅">第二餐厅</option>
                            <option value="第三餐厅">第三餐厅</option>
                        </select><br>
                        <p></p>
                        菜品窗口：<input id="loc_Window" required name="loc_Window" placeholder="请输入菜品售卖窗口"><br>
                        <p></p>
                        选择上传菜品图片：
                        <div class="am-form-group am-form-file">
                            <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                <i class="am-icon-cloud-upload"></i> 选择要上传的图片
                            </button>
                            <input id="doc-form-file" name="dishavatar" type="file" multiple>
                        </div>
                        <%--                        设置喜欢数量与评论数量默认值为0--%>
                        <input type="hidden" name="likes" value="0">
                        <input type="hidden" name="comments" value="0">

                        请输入菜品详情：<br>

                        <textarea name="discription" rows="3" cols="50" id="doc-ta-1"></textarea>
                        <div class="am-margin">
                            <button type="button" onclick="javascript:submitAdd_form()" class="am-btn am-btn-primary am-btn-xs">提交菜品信息</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" onclick="javascript:toDishesManagePage()"
                                    class="am-btn am-btn-primary am-btn-xs">返回
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>
<!-- content end -->


<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>
<script type="text/javascript">
    function toDishesManagePage() {
        location.href = "${pageContext.request.contextPath}/admin/dishes-manage-show";
    }

    function submitAdd_form() {
            //添加是否含中文校验
            var price= $("#price").val();
            var loc_Window= $("#loc_Window").val();
            if (!isChineseChar(loc_Window)&&!isChineseChar(price)){
                $("#add_form").submit();
            }else {
                alert("菜品价格以及菜品售卖窗口中不允许出现中文字符！");
            }
    }
    //是否含中文校验
    function isChineseChar(str) {
        var  reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
        return  reg.test(str);
    }

    function stripscript(s)
    {
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = rs+s.substr(i, 1).replace(pattern, '');
        }
        return rs;
    }


</script>
</html>

