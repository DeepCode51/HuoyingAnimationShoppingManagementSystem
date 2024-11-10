<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/1
  Time: 16:10
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
                    <h2 class="OrderPayH2Title">我的收银台</h2>
                </div>
                <div>
                    <form class="OrderPay-form" action="${pageContext.request.contextPath}/orderPay" method="post">
                        <table class="OrderPay-table">
                            <input type="hidden" value="${orderInfo.username}" name="username">
                            <input type="hidden" value="${orderInfo.fulladdress}" name="fulladdress">
<%--                            <input type="hidden" value="${orderInfo.uphone}" name="bophone">--%>
                            <tr>
                                <td>需要支付：</td>
                                <td><input name="price" type="hidden" value="${sum}" id="price" />
                                    <div>
                                        <em>${sum}元</em>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>付款方式：</td>
                                <td>
                                    <select name="payWay" >
                                        <option value="支付宝">支付宝</option>
                                        <option value="微信">微信</option>
                                        <option value="银行卡">银行卡</option>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td>请扫码支付：</td>
                                <td>
                                    <img class="payImg" src="/statics/images/figure/支付二维码.jpg" alt="图片显示失败">
                                </td>
                            </tr>
                        </table>
                        <div class="OrderPay-secure">安全设置检测成功！无需短信校验</div>
                        <input class="OrderPaySubmit" type="submit" name="action" value="确认支付" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>



