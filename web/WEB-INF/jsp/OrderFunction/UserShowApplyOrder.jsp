<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/9
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/renzhejianjie.css" >
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/UserApplyHyrzResource.css" >--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/order.css" >
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
                <li><a href="${pageContext.request.contextPath}/toFigure">展品区</a></li>
                <li><a href="${pageContext.request.contextPath}/toCart">购物车</a></li>
                <li><a href="${pageContext.request.contextPath}/toUserOrder">我的订单</a></li>
                <li><a href="${pageContext.request.contextPath}/toUserShowApplyOrder">售后申请状态</a></li>
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
            <div class="renzhejieshao">
                <div>
                    <h2 class="UserShowApplyOrder-H2Title">售后申请状态</h2>
                </div>
                <table class="UserShowApplyOrder-table">
                    <tr>
                        <th>订单号</th>
                        <th>用户</th>
                        <th>手办图片</th>
<%--                        <th>手办名称</th>--%>
                        <th>申请类别</th>
                        <th>申请理由</th>
                        <th>申请时间</th>
                        <th>审核状态</th>
                    </tr>
                    <c:forEach var="OrderApply" items="${requestScope.get('UserShowAllOrderApply')}">
                        <tr>
                            <td class="td1">${OrderApply.getOrderId()}</td>
                            <td class="td2">${OrderApply.getUsername()}</td>
                            <td class="td3">
                                <c:if test="${OrderApply.getRefundType() eq '更改地址'}">
                                    <span style="color: red">更换地址不需要图片</span>
                                </c:if>
                                <c:if test="${OrderApply.getRefundType() eq '取消订单' or OrderApply.getRefundType() eq '换货' }">
                                    <img src="/statics/images/refund/${OrderApply.getFigureImage()}" height="100" width="100" />
                                </c:if>
                            </td>
<%--                            <td class="td4">${OrderApply.getFigureName()}</td>--%>
                            <td class="td5">${OrderApply.getRefundType()}</td>
                            <td class="td6">${OrderApply.getRefundReason()}</td>
                            <td class="td7">${OrderApply.getRefundTime()}</td>
                            <td class="td8">${OrderApply.getRefundStatus()}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<%
    if(session.getAttribute("UserRefundSubmit")!=null)
    {
        session.setAttribute("UserRefundSubmit",null);
    }

%>
</body>
</html>






