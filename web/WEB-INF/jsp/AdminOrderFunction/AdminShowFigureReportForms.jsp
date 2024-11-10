<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/9
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/renzhejianjie.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/figureclassify.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/AdminOrder.css" >
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
                <li><a href="${pageContext.request.contextPath}/toAdminFigure">展品区</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminShowFigureBelong">手办分类管理</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=0">订单管理</a></li>
                <li><a href="${pageContext.request.contextPath}/AdminShowAllRefund">售后管理</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminShowFigureReportForms">报表统计</a></li>
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
                    <h2 class="AdminShowFigureReportForms-H2Title">手办报表信息</h2>
                </div>
                <div class="UserOrder-choose">
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportForms">默认</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportFormsToday">最近一天</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportFormsDays?jspDays=7">过去一周</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportFormsDays?jspDays=30">一个月内</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportFormsSalesUp">销售量升序</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportFormsSalesDown">销售量降序</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowFigureReportFormsSalesPriceList">销售额榜单</a>
                </div>
                <table class="AdminShowFigureReportForms-table">
                    <tr>
                        <th>手办图片</th>
                        <th>手办名称</th>
                        <th>单价</th>
                        <th>销售量</th>
                        <th>销售总金额</th>
                    </tr>
                    <c:forEach var="figureList" items="${requestScope.get('allrenzheFigureList')}">
                        <tr>
                            <c:if test="${figureList.getFigureImage()!=null}">
                                <td class="td1">
                                    <img src="/statics/images/figure/${figureList.getFigureImage()}" width="100px" height="100px">
                                </td>
                            </c:if>
                            <c:if test="${figureList.getFigureImage() eq null}">
                                <td class="td1">无图片</td>
                            </c:if>
                            <td class="td2">${figureList.getFigureName()}</td>
                            <td class="td3">${figureList.getFigurePrice()}</td>
                            <td class="td4">${figureList.getFigureSales()}</td>
                            <td class="td5">
                                <fmt:formatNumber type="number" value="${figureList.getFigurePrice()*figureList.getFigureSales()}" pattern="0.00"/>
                            </td>
<%--                            <td>${figureList.getFigurePrice()*figureList.getFigureSales()}</td>--%>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>


