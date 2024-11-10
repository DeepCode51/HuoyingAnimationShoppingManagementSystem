<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/25
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/hyrzResource.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/index.js"></script>
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
                <li><a href="${pageContext.request.contextPath}/tohyrzResource">精彩资源</a></li>
                <li><a href="${pageContext.request.contextPath}/toComment">坛友区</a></li>
                <li><a href="${pageContext.request.contextPath}/toUserApplyAddResource">上传资源</a></li>
                <li><a href="${pageContext.request.contextPath}/toUserShowApplyResource">上传审核状态</a></li>
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
            <div class="hyrzResource">
                <div class="hyrzResource2">
                    <p>精彩分享</p>
                </div>
<%--                <ul class="lianjie">--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>愣着干嘛，戴上耳机，这才是忍者世界的巅峰战力！！！</p><a target="_blank" href="https://www.bilibili.com/video/BV1aK4y1a7oT/?spm_id_from=333.788.videocard.1"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>【火影忍者/前方高能／无缝衔接】有一种强大叫做背负所有！（声音打击）</p><a target="_blank" href="https://www.bilibili.com/video/BV1mJ411p7BX?from=search&seid=12374180658788097467"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>潇洒飘逸，拳拳到肉，这才是火影该有的样子！</p><a target="_blank" href="https://www.bilibili.com/video/BV1zZ4y1s7u1?from=search&seid=12374180658788097467"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>把火影的忍术翻译成中文谐音之后，简直不要太沙雕。（笑点推荐）</p><a target="_blank" href="https://www.bilibili.com/video/BV1DJ411G7VZ/?spm_id_from=333.788.videocard.19"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>【火影】全程高能！纯忍术</p><a target="_blank" href="https://www.bilibili.com/video/BV1TJ41137vm/?spm_id_from=333.788.videocard.2"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>四代火影/超燃/AMV【今当为父 死又何妨！！！】</p><a target="_blank" href="https://www.bilibili.com/video/BV18p411R7be/?spm_id_from=333.788.videocard.3"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                    <li><img src="statics/images/hyrzResource/star.png"><p>带好耳机，前方高能！无缝衔接 为信仰而战！【混剪/踩点/火影忍者】</p><a target="_blank" href="https://www.bilibili.com/video/BV1G4411L7Fb/?spm_id_from=333.788.videocard.0"><img src="statics/images/hyrzResource/go.png"></a></li>--%>
<%--                </ul>--%>
                <ul class="lianjie">
                    <c:forEach items="${requestScope.get('allhyrzResourceList')}" var="hyrzResource">
                        <c:if test="${not empty allhyrzResourceList}">
                            <li>
                                <img src="statics/images/hyrzResource/star.png">
                                <p>${hyrzResource.hyrzResourceName}</p>
                                <a target="_blank" href="${hyrzResource.hyrzResourceLink}"><img src="statics/images/hyrzResource/go.png"></a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
