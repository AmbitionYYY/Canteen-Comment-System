<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2021/4/11
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        #dog{
            text-align: center;
        }
        #queryMessageButton{
            margin-left: 45%;
        }
    </style>
</head>
<body>
<%--引入头部--%>
<jsp:include page="/WEB-INF/views/user/user-header.jsp"></jsp:include>
<%--引入头部结束--%>
<!-- content start -->
<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">200</strong> / <small>The request is successful！</small></div>
        </div>

        <hr>

        <div class="am-g">
            <div class="am-u-sm-12">
                <h2 class="am-text-center am-text-xxxl am-margin-top-lg">Success! 感谢您的反馈！</h2>
                <a id="queryMessageButton" href="javascript:showfeedBackMessage('${sessionScope.username}')" class="am-btn am-btn-primary" >查看我的反馈信息</a>
                <pre id="dog" class="page-404">
          .----.
       _.'__    `.
   .--($)($$)---/#\
 .' @          /###\
 :         ,   #####
  `-..__.-' _.-\###/
        `;_:    `"'
      .'"""""`.
     /,  ya ,\\
    //  200!  \\
    `-._______.-'
    ___`. | .'___
   (______|______)
        </pre>
            </div>
        </div>
    </div>
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


    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>
</div>
<!-- content end -->
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
