<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/16
  Time: 11:32
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/figureclassify.css" >
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
                <div class="renzhejieshao2">
                    <p><span>精致手办一览</span> 心动就去挑一挑&nbsp;<a target="_blank" href="https://www.taobao.com/">淘宝</a></p>
                    <div class="addrenzheButton">
                        <a href="${pageContext.request.contextPath}/toAddFigure">新增手办</a>
                    </div>
                </div>
                <ul class="figureClassify">
                    <li><a href="${pageContext.request.contextPath}/toAdminFigure"><div>全部忍者</div></a></li>
<%--                    <c:forEach var="figureBelong" items="${requestScope.get('allFigureBelongList')}">--%>
<%--                        <li><a href="${pageContext.request.contextPath}/toAdminxiaozuzhiFigure"><div>${figureBelong.getFigureBelongName()}</div></a></li>--%>
<%--                    </c:forEach>--%>
                    <li><a href="${pageContext.request.contextPath}/toAdminxiaozuzhiFigure"><div>晓组织成员</div></a></li>
                    <li><a href="${pageContext.request.contextPath}/toAdminlidaihuoyingFigure"><div>历代火影</div></a></li>
                    <li><a href="${pageContext.request.contextPath}/toAdminrendaoqirenFigure"><div>忍刀七人众</div></a></li>
                    <li><a href="${pageContext.request.contextPath}/toAdminbamendunjiaFigure"><div>八门遁甲</div></a></li>
                    <li><a href="${pageContext.request.contextPath}/toAdminSalesSortFigure"><div>销售量(降序)</div></a></li>
                </ul>
                <table>
                    <c:forEach items="${requestScope.get('allrenzheFigureList')}" var="figure" varStatus="status">
                        <c:if test="${not empty allrenzheFigureList}">
                            <c:if test="${(status.index) mod 2 == 0}">
                                <tr>
                                <td>
                                    <img src="/statics/images/figure/${figure.figureImage}" alt="图片显示失败">
                                    <a class="title-link" target="_blank" href="${figure.figureLink}">${figure.figureName}</a>
                                    <p>${figure.figureIntroduce}</p>
                                    <p>￥：${figure.figurePrice}&nbsp;&nbsp;&nbsp;销量：${figure.figureSales}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                    <div class="TworenzheButton">
                                        <a href="${pageContext.request.contextPath}/toUpdateFigure?id=${figure.figureId}">修改手办</a>
                                        <a href="${pageContext.request.contextPath}/deleteFigureById/${figure.figureId}">删除手办</a>
                                    </div>
                                </td>
                            </c:if>
                            <c:if test="${(status.index) mod 2 == 1}">
                                <td>
                                    <img src="/statics/images/figure/${figure.figureImage}" alt="图片显示失败">
                                    <a class="title-link" target="_blank" href="${figure.figureLink}">${figure.figureName}</a>
                                    <p>${figure.figureIntroduce}</p>
                                    <p>￥：${figure.figurePrice}&nbsp;&nbsp;&nbsp;销量：${figure.figureSales}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                    <div class="TworenzheButton">
                                        <a href="${pageContext.request.contextPath}/toUpdateFigure?id=${figure.figureId}">修改手办</a>
                                        <a href="${pageContext.request.contextPath}/deleteFigureById/${figure.figureId}">删除手办</a>
                                    </div>
                                </td>
                                </tr>
                            </c:if>
                            <c:if test="${(status.last) && (status.index) mod 2 == 0}">
                                </tr>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

