<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/24
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/hyrzIntroduce.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>
</head>
<body>
<script src="${pageContext.request.contextPath}/statics/js/indexCanvas.js"></script>
<%--  <div class="indexback">--%>
<%--  </div>--%>
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
            <a href="${pageContext.request.contextPath}/Userlogout"><img src="statics/images/same/cancel.png" class="imgcancel"></a>
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
                <li><a href="${pageContext.request.contextPath}/toindex">首页</a></li>
                <%--                <li><a href="${pageContext.request.contextPath}/tohyrzIntroduce">火影介绍</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/torenzhejianjie">忍者简介</a></li>
                <li><a href="${pageContext.request.contextPath}/toOPED">OPED</a></li>
                <li><a href="${pageContext.request.contextPath}/tohyrzResource">火影迷资源</a></li>
                <li><a href="${pageContext.request.contextPath}/toFigure">精致手办</a></li>
                <li><a href="${pageContext.request.contextPath}/toPersonal">个人中心</a></li>
            </ul>
        </div>
    </div>
    <div class="navleftback">
        <div class="navleft">
            <ul>
                <li><a href="${pageContext.request.contextPath}/toindex">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/tohyrzIntroduce">火影介绍</a></li>
                <li><a href="${pageContext.request.contextPath}/toXuanWoMingRenIntroduce">漩涡鸣人</a></li>
                <li><a href="${pageContext.request.contextPath}/toZuoZhuIntroduce">宇智波佐助</a></li>
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
            <div class="juqingjieshao">
                <p><span>剧情介绍</span> 详细请见<a target="_blank" href="https://baike.baidu.com/item/%E7%81%AB%E5%BD%B1%E5%BF%8D%E8%80%85/3206592?fr=aladdin">《火影忍者》</a>和<a target="_blank" href="https://baike.baidu.com/item/%E7%81%AB%E5%BD%B1%E5%BF%8D%E8%80%85%E7%96%BE%E9%A3%8E%E4%BC%A0/6216138?fr=aladdin">《火影忍者疾风传》</a></p>
<%--                <c:if test="${not empty UserOrAdmin}">--%>
<%--                    <c:if test="${sessionScope.UserOrAdmin=='Admin'}">--%>
<%--                        <div class="updaterenzheButton">--%>
<%--                            <a href="${pageContext.request.contextPath}/toupdateIntroduce?id=${IntroduceClassify.hyrzIntroduceId}">修改内容</a>--%>
<%--                        </div>--%>
<%--                    </c:if>--%>
<%--                </c:if>--%>
            </div>
<%--            <img src="statics/images/hyrzIntroduce/quanrenzhe.png">--%>
            <img src="statics/images/hyrzIntroduce/${IntroduceClassify.hyrzIntroduceImg}">
            <div class="wordP">
                <p>${IntroduceClassify.hyrzIntroduceMain}</p>
                <br>
            </div>
        </div>
    </div>
</div>
</body>
</html>
