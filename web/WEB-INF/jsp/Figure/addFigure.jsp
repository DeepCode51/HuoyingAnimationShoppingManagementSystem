<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/5
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/addrenzhe.css" >
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
            <div class="addrenzhe">
                <form action="${pageContext.request.contextPath}/addFigure" enctype="multipart/form-data" method="post">
                    手办名称：
                    <input name="figureName" type="text" placeholder="请输入手办名称" required><br>

                    手办链接：
                    <input name="figureLink" type="text" placeholder="请填入手办链接" required><br>

                    手办图片：
                    <input name="figureImg" type="file" required><br>

                    手办所属：
<%--                    <select name="figureBelong" required>--%>
<%--                        <option value="无">--请选择--</option>--%>
<%--                        <option value="晓组织">晓组织</option>--%>
<%--                        <option value="历代火影">历代火影</option>--%>
<%--                        <option value="忍刀七人众">忍刀七人众</option>--%>
<%--                        <option value="八门遁甲">八门遁甲</option>--%>
<%--                        <option value="宇智波">宇智波一族</option>--%>
<%--                        &lt;%&ndash;                        <option value="天才忍者">天才忍者</option>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        <option value="人柱力">人柱力</option>&ndash;%&gt;--%>
<%--                    </select><br>--%>
                    <select name="figureBelong" required>
                        <option value="无">--请选择--</option>
                        <c:forEach var="figureBelong" items="${requestScope.get('allFigureBelongList')}">
                            <option value="${figureBelong.getFigureBelongName()}">${figureBelong.getFigureBelongName()}</option>
                        </c:forEach>

                        <%--                        <option value="晓组织">晓组织</option>--%>
                        <%--                        <option value="历代火影">历代火影</option>--%>
                        <%--                        <option value="忍刀七人众">忍刀七人众</option>--%>
                        <%--                        <option value="八门遁甲">八门遁甲</option>--%>
                    </select><br>

                    手办价格：
                    <input name="figurePrice" type="text" placeholder="请输入手办价格" required><br>

                    手办介绍：
                    <textarea cols="20" rows="10" name="figureIntroduce" placeholder="这里是手办的介绍说明" required></textarea><br>

                    <input type="submit" value="添加">
                    <input type="reset" value="重置">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

