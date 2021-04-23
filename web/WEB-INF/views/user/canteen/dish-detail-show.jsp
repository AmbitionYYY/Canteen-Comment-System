<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2020/11/25
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns:url="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>菜品详情</title>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

</head>
<style>
    * {
        box-sizing: border-box;
    }

    html, body {
        margin: 0;
        padding: 0;
        height: 100%;
    }

    #app {
        margin-right: 15%;
        margin-left: 15%;
    }

    #id_dish_picture {
        margin-top: 0px;
        margin-right: 50px;
        margin-bottom: 50px;
        float: right;
        width: 400px;
        height: 300px;
    }

    #e_dish_name {
        display: inline;
    }

    #dish_name {
        display: inline;
    }

    #id_name {
        width: 50%;
        height: 50px;
        /*background-color: wheat;*/
    }

    #star {
        width: 50%;
        height: 70px;
    }

    #id_star {
        width: 150px;
        float: left;
        height: 40px;
    }

    #id_star_wz {
        height: 40px;
        font-size: 14px;
        color: gray;
    }

    p {
        display: inline;
    }

    #id_info {
        width: 50%;
        height: 200px;
    }

    .id_info_h {
        height: 50px;
        font-size: 14px;
        color: gray;
    }
</style>
<body>
<p>${dishid}号菜品详情！</p>
<input id="dishid" value="${dishid}" hidden>

<!--页面主体-->
<div id="app">
    <div style="padding-left: 50px;">

        <!--菜品名称-->
        <div id="id_name">
            <p id="e_dish_name" style="font-size:22px;font-weight:700">菜品名称:&emsp;</p>
            <p id="dish_name" style="font-size:22px;font-weight:700">${dish.name}</p>
        </div>

        <!--菜品照片-->
        <img src="/dish/${dish.avatar}" id="id_dish_picture"/>
        <!--打星的一行-->
        <div id="id_star">
           <span>此菜品评分为：${avgScore}</span>
        </div>
        <div id="id_star_wz">
            <p class="e_size2">评论数量：</p>
            <p id="dish_comments">${dish.comments}&emsp;</p>
            <p class="e_size2">点赞数量：</p>
            <p id="dish_likes">${dish.likes}&emsp;</p>
            <p class="e_size2">菜品价格：</p>
            <p id="dish_price">${dish.price}</p>
        </div>
        <div id="id_info">
            <div class="id_info_h">
                <p id="e_dish_canteen">食堂地点：</p>
                <p id="dish_canteen">${dish.loc_Canteen}</p>
            </div>
            <div class="id_info_h">
                <p id="e_dish_window">窗口：</p>
                <p id="dish_window">第${dish.loc_Window}号窗口</p>
            </div>
            <div class="id_info_h">
                <p id="e_dish_discription">详细描述：</p>
                <p id="dish_discription">${dish.discription}</p>
            </div>
        </div>

        <!--点赞菜品-->
        <dish class="id_info_h">
            <p id="e_dish_like">我要点赞:</p>
            <p >
            <span id="star_type1" onclick="DishtoLike()">👍</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <span id="star_type0" onclick="DishtoNotLike()">👎</span>
            </p>
        </dish>

        <br/>
        <br/>

        <!--撰写评论-->
        <div class="id_info_h">
            <p id="e_dish_addcomment">我要写评论:</p>
          <a    href="javascript:AddcommentDish(${dishid})">点我评论</a>
        </div>
        <!--菜品评论-->
<%--        <input id="commentList"  value="${commentList}"  >--%>

        <el-table :data="dish_commentList"
                      border
                      style="width: 100%">
                <el-table-column prop="comment_id"
                                 label="评论id"
                                 width="100">
                </el-table-column>
                <el-table-column prop="username"
                                 label="用户名"
                                 width="130">
                </el-table-column>
                <el-table-column prop="createtime"
                                 label="日期"
                                 width="180">
                </el-table-column>
                <el-table-column prop="content"
                                 label="评论内容"
                                 width="300">
                </el-table-column>
                <el-table-column prop="score"
                                 label="星级评价"
                                 width="120">

                </el-table-column>
                <el-table-column prop="likes" label="点赞数量" width="100">
                </el-table-column>
                <el-table-column label="操作" min-width="10%">
                    <template scope="scope">
                        <el-button type="warning"  circle
                                   @click="handleLikeComment(scope.row)">
                            👍
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
</div>
</div>
</body>
<script>
<%--    获取commentList--%>
//     var commentList= $("#commentList").val();
    // alert(commentList);
    var dishid= $("#dishid").val();
    // var commentArray=new Array();
    //    引入Vue控制表格及其数据
    let app = new Vue({
        el: '#app',
        data: {
            dish_commentList:[]
        },
        mounted: function () {
            // alert(this.dish_commentList)
            this.getDishComment()
        },
        methods:{
            //此函数需要进行修改，动态给data里面的comments集合赋值
            getDishComment: function (){
                console.log("钩子函数运行正常！")
            },
            handleLikeComment:function (row) {
                //*******评论点赞模块开始***********
                  $.ajax({
                      url:"${pageContext.request.contextPath}/like/add",
                dataType:"json",
                type:"post",
                //      type=2代表当前点赞的是评论
                data:{type:2,
                    userId:${loginUser.userid},
                    typeId:200+parseInt(row.comment_id)
                },
                success:function(data){
                    //    成功返回的执行的内容
                    alert("状态码："+data.code+"   "+"当前状态： "+data.msg);
                    console.log(data)
                }
            })
                //*******评论点赞模块结束***********

            }
        }
    })

    //Vue组件结束

    //startype用来作为标志用户是否喜欢此菜品的标志
    // var startype=0;
    //定义一个变量来存储当前菜品的点赞数
    var currentlikes=${dish.likes};
    function DishtoLike(){

        // if (startype==0) {
            // startype=1;
            var type=1;
            var typeid=1;
            var userid;
            // alert("当前登录的用户id为"+userid+"="+type+"点赞id:"+typeId)


            //**********此处为菜品点赞模块!*********
            $.ajax({
                url:"${pageContext.request.contextPath}/like/add",
                dataType:"json",
                type:"post",
                data:{type:1,
                    userId:${loginUser.userid},
                    typeId:100+${dishid}
                },
                success:function(data){
                //    成功返回的执行的内容
                    console.log(data);
                   // var data1= JSON.stringify(data);
                   alert("状态码："+data.code+"   "+"当前状态："+data.msg);
                    //val()方法返回或设置被选元素的值，value()是返回值，text是赋值文本
                    $("#star_type1").text("👍已点赞，感谢您的支持！");
                    $("#star_type0").text("👎");
                    if(data.code==200){
                        currentlikes=currentlikes+1;
                    $("#dish_likes").text(currentlikes);
                    }
                }
            })
        // }
    }
        //*******菜品点赞模块结束***********


        //如果本身状态是点赞，再次点击就会取消点赞！状态码改为0.
        function DishtoNotLike(){
        //已经点过赞才能取消点赞！
        // if(startype==1){
        //     startype=0;
            $.ajax({
                url:"${pageContext.request.contextPath}/like/cancel",
                dataType:"json",
                type:"post",
                data:{type:1,
                    userId:${loginUser.userid},
                    typeId:100+${dishid}
                },
                success:function(data){
                    //    成功返回的执行的内容
                    console.log(data);
                    // alert("您取消了点赞！！！");
                    alert("状态码："+data.code+"   "+"当前状态："+data.msg);
                    $("#star_type0").text("👎您已经取消了赞！");
                    $("#star_type1").text("👍");
                    if(data.code==200){
                        currentlikes=currentlikes-1;
                    $("#dish_likes").text(currentlikes);
                    }
                }
            })
        // }
    }

    //评论菜品
    function AddcommentDish(dishid) {
        // alert("你点击的是"+dishid);
        location.href = "${pageContext.request.contextPath}/canteen/comment-dish-show?dishid=" + dishid;
    }

<%--    给评论列表赋值--%>
    var index=0;
    <c:forEach var="comment" items="${commentList}">
    app.dish_commentList.push({comment_id:""});
    app.dish_commentList[index].username="${comment.username}"
    app.dish_commentList[index].comment_id="${comment.comment_id}"
    app.dish_commentList[index].createtime="${comment.createtime}"
    app.dish_commentList[index].content="${comment.content}"
    app.dish_commentList[index].score="${comment.score}"
    app.dish_commentList[index].likes="${comment.likes}"
    index=index+1;
    </c:forEach>

</script>
</html>
