<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/3/29
  Time: 22:04
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/cart.css" >
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
<%--                <c:if test="${not empty UserOrAdmin}">--%>
<%--                    <c:if test="${sessionScope.UserOrAdmin=='User'}">--%>
<%--                        <li><a href="${pageContext.request.contextPath}/toCart">购物车</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/toUserOrder">我的订单</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/toUserShowApplyOrder">售后申请状态</a></li>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${sessionScope.UserOrAdmin=='Admin'}">--%>
<%--                        <li><a href="${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=0">订单管理</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/AdminShowAllRefund">售后管理</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/toAdminShowFigureReportForms">报表统计</a></li>--%>
<%--                    </c:if>--%>
<%--                </c:if>--%>
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
                <div class="renzhejieshao2">
                    <p><span>精致手办一览</span> 心动就去挑一挑&nbsp;<a target="_blank" href="https://www.taobao.com/">淘宝</a></p>
                </div>
                <c:if test="${!empty cart}">
                    <table class="product-table">
                        <tr><th>商品</th><th>物品价格</th><th>数量</th><th>操作</th></tr>
                        <c:forEach items="${cart}" var="item">
                            <form action="${pageContext.request.contextPath}/ModifyCart" method="post">
                                <input type="hidden" name="figureId" value="${item.figure.figureId}"/>
                                    <tr>
                                        <td class="td1">
                                            <img src="/statics/images/figure/${item.figure.figureImage}" alt="图片显示失败">
                                            <a class="product-name" target="_blank" href="${item.figure.figureLink}">${item.figure.figureName}</a>
                                        </td>
                                        <td class="td2">
                                            <p class="product-price">￥：${item.figure.figurePrice}</p>
                                        </td>
                                        <td class="td3">
                                            <input type="number" name="quantity" type="text" value="${item.quantity}" size="5" />
<%--                                            <p style="color: #aaa;text-align: center;">有货</p>--%>
                                        </td>
                                        <td class="td4">
                                            <input class="modify-cart" type="submit" name="action" value="修改" />
                                            <input class="delete-cart" type="submit" name="action" value="删除" />
                                        </td>
                                    </tr>
                            </form>
                        </c:forEach>
                    </table>
                    <div class="button-container">
                        <a class="clear-cart" href="${pageContext.request.contextPath}/clearCart">清空购物车</a>
                        <a class="continue-shopping" href="${pageContext.request.contextPath}/toFigure">继续购物</a>
                        <a class="checkout" href="${pageContext.request.contextPath}/makeSureCart">进入结算</a>
                    </div>
                </c:if>

                <c:if test="${empty cart}">
                    <div class="cart-container">
                        <h1>购物车中的信息</h1>
                        <hr>
                        <div class="countain">
                            <p>购物车空空的哦，去看看心仪的商品吧~</p>
                            <a href="${pageContext.request.contextPath}/toFigure">去购物</a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>

