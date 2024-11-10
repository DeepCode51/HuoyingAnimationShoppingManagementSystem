<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/8
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/renzhejianjie.css">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/UserApplyHyrzResource.css" >
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
            <div class="UserApplyHyrzResource">
                <table>
                    <tr>
                        <td class="headTd1">用户</td>
                        <td class="headTd2">资源名称</td>
                        <td class="headTd3">资源链接</td>
                        <td class="headTd4">上传时间</td>
                        <td class="headTd5">审核状态</td>
                    </tr>
                    <c:forEach var="ResourceApply" items="${requestScope.get('UserShowAllResourceApply')}">
                        <tr>
                            <td class="contentTd1">${ResourceApply.getUsername()}</td>
                            <td class="contentTd2">${ResourceApply.getHyrzResourceName()}</td>
                            <td class="contentTd3">${ResourceApply.getHyrzResourceLink()}</td>
                            <td class="contentTd4">${ResourceApply.getApplyAddTime()}</td>
                            <td class="contentTd5">${ResourceApply.getPassStatus()}</td>
<%--                            <c:choose>--%>
<%--                                <c:when test="${ResourceApply.getPassStatus() eq '审核通过' or ResourceApply.getPassStatus() eq '审核不通过' }">--%>
<%--                                    <td>已处理（${ResourceApply.getPassStatus()}）</td>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <td><a href="${pageContext.request.contextPath}/AdminPassApplyResource/${ResourceApply.getResourceApplyAddID()}">审核通过</a></td>--%>
<%--                                    <td><a href="${pageContext.request.contextPath}/AdminRefuseApplyResource/${ResourceApply.getResourceApplyAddID()}">拒绝请求</a></td>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
                                <%--                            <td><a href="${pageContext.request.contextPath}/AdminPassApplyResource/${ResourceApply.getResourceApplyAddID()}">审核通过</a></td>--%>
                                <%--                            <td><a href="${pageContext.request.contextPath}/AdminRefuseApplyResource/${ResourceApply.getResourceApplyAddID()}">拒绝请求</a></td>--%>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>


