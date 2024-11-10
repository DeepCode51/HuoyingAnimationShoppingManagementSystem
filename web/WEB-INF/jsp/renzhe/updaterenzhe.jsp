<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/23
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
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
                <li><a href="${pageContext.request.contextPath}/toAdminrenzhejianjie">忍者一览</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminxiaozuzhi">晓组织</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminlidaihuoying">历代火影</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminrendaoqiren">忍刀七人众</a></li>
                <li><a href="${pageContext.request.contextPath}/toAdminbamendunjia">八门遁甲</a></li>
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
                <form action="${pageContext.request.contextPath}/updaterenzhe" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="renzheId" value="${updaterenzhe.renzheId}"/>
                    忍者名称：
                    <input name="renzheName" type="text" value="${updaterenzhe.renzheName}"><br>

                    忍者链接：
                    <input name="renzheLink" type="text" value="${updaterenzhe.renzheLink}"><br>

                    忍者图片：
                    <input name="renzheImg" type="file"><br>
<%--                    ${if(updaterenzhe.renzheBelong.equals("无")) selected="selected"}--%>
                    忍者所属：
                    <select name="renzheBelong">
                        <option value="${updaterenzhe.renzheBelong}">${updaterenzhe.renzheBelong}</option>
                        <option value="无">--请选择--</option>
                        <option value="晓组织">晓组织</option>
                        <option value="历代火影">历代火影</option>
                        <option value="忍刀七人众">忍刀七人众</option>
                        <option value="八门遁甲">八门遁甲</option>
                    </select><br>

                    忍者介绍：
                    <textarea cols="20" rows="10" name="renzheIntroduce">${updaterenzhe.renzheIntroduce}</textarea><br>

                    <input type="submit" value="修改">
                    <input type="reset" value="重置">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
