<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/25
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/comment.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <%--    <script src="${pageContext.request.contextPath}/statics/js/comment.js"></script>--%>
    <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>
</head>
<body>
<script src="${pageContext.request.contextPath}/statics/js/indexCanvas.js"></script>
<div class="whole">
    <div class="top">
        <img src="statics/images/same/muye.png " class="muye">
        <img src="statics/images/same/logo.png" class="narutologo">
        <div class="bgm">
            <p>青鸟ブルーバード / いきものがかり</p>
            <audio src="statics/music/青鸟页面BGM.mp3"   loop controls></audio>
        </div>
        <div class="navUpperRight">
            <a href="${pageContext.request.contextPath}/tologin"><img src="statics/images/same/login.png" class="imglogin"></a>
            <a href="${pageContext.request.contextPath}/toregister"><img src="statics/images/same/register.png" class="imgregister"></a>
            <a href="${pageContext.request.contextPath}/Adminlogout"><img src="statics/images/same/cancel.png" class="imgcancel"></a>
        </div>
        <img src="statics/images/same/juanzhou2.png" class="juanzhou">
        <div class="navimg">
            <img src="statics/images/same/mingren.png">
            <img src="statics/images/same/kakaxi.png">
            <img src="statics/images/same/zilaiye.png">
            <img src="statics/images/same/shuimen.png">
            <img src="statics/images/same/bai2.png">
            <img src="statics/images/same/you2.png">
            <img src="statics/images/same/ningci.png">
            <img src="statics/images/same/xiaoying.png">
            <img src="statics/images/same/zuozhu.png" class="navzuozhu">
        </div>
        <div class="nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/toAdminIndex">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminrenzhejianjie">忍者简介</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminOPED">OPED</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminHyrzResource">火影迷资源</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminFigure">精致手办</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminPersonal">个人中心</a></li>
            </ul>
        </div>
    </div>
    <div class="navleftback">
        <div class="navleft">
            <ul>
                <li><a href="${pageContext.request.contextPath}/toAdminHyrzResource">精彩资源</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminComment">坛友区</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminAllApplyResource">用户上传审核</a></li>
            </ul>
        </div>
    </div>
    <div class="Content">
        <div class="ContentTop">
            <img src="statics/images/index/hyrz.png">
            <div class="muyefeiwu">
                <p><span>木叶飞舞之处，火亦生生不息</span></p>
            </div>
        </div>
        <div class="ContentMain">
            <div class="comment">
                <div class="comment2">
                    <p>欢迎来到火影迷的小屋圈~~~</p>
                </div>
                <div id="qq">
                    <p>有什么新鲜事想告诉大家?</p>
                    <form action="${pageContext.request.contextPath}/AdminfabiaoComment">
                        <input type="hidden" name="commentName" value="${AdminLoginSession.adminName}"/>
                        <input type="hidden" name="commentImg" value="${AdminLoginSession.adminAvatar}"/>
                        <textarea class="commentTextarea" id="commentTextarea" name="commentMain" required></textarea>
                        <div class="But">
                            <img src="statics/images/hyrzResource/emoji/bba_thumb.gif" class='bq' />
                            <input type="submit" value="发表" id="fabiaobtn" class="fabiaosubmit">
                            <!--face begin-->
                            <div class="face">
                                <ul>
                                    <c:forEach items="${requestScope.get('allEmoji')}" var="emoji">
                                        <li><img src="statics/images/hyrzResource/emoji/${emoji.emojiImg}"></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!--face end-->
                        </div>
                    </form>
                </div>
                <div class="msgCon">
                    <div class='msgBox'>
                        <c:forEach items="${requestScope.get('commentList')}" var="comment">
                            <div class="headUrl">
                                <img src="statics/images/User/${comment.commentImg}" width='50' height='50'>
                                <div>
                                    <span class="title">${comment.commentName}</span>
                                        <%--                                    <span class="time">2018-01-01</span>--%>
                                </div>
                                <a class="del" href="${pageContext.request.contextPath}/deleteCommentById/${comment.commentId}">删除</a>
                            </div>
                            <div class='msgTxt'>${comment.commentMain}</div>
                        </c:forEach>
                    </div>`
                </div>
                <%--                <script>--%>
                <%--                    //点击发表时，利用Ajax进行输出新评论--%>
                <%--                    $("#fabiaobtn").click(function (){--%>
                <%--                        $.post("${pageContext.request.contextPath}/fabiaoComment",function (data){--%>
                <%--                            var html="";--%>
                <%--                            for (let i = 0; i < data.length; i++) {--%>
                <%--                                html="<div class="+ +"headUrl""+--%>
                <%--                                    "" +--%>
                <%--                                    "";--%>
                <%--                            }--%>
                <%--                        })--%>
                <%--                    })--%>
                <%--                </script>--%>
                <script src="${pageContext.request.contextPath}/statics/js/comment.js"></script>
            </div>
        </div>
    </div>
</div>
</body>
</html>

