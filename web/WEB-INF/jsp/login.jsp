<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/13
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/login.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/register.css" >
    <script src="${pageContext.request.contextPath}/statics/js/register.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<%--    <script>--%>
<%--        function ifuser(){--%>
<%--            alert("${iflogin}");--%>
<%--        }--%>
<%--        if(test="${!empty iflogin}"){--%>
<%--            window.onload=ifuser;--%>
<%--        }--%>
<%--    &lt;%&ndash;alert("${iflogin}");&ndash;%&gt;--%>
<%--    </script>--%>
</head>
<body>
<div>
    <canvas id="canvas"></canvas>
    <canvas id="snow"></canvas>
    <div class="am-g" style="position: fixed; bottom:0px;">
        <div class="am-u-sm-12">
            <div style="z-index: 9999" id="player" class="aplayer">
            </div>
        </div>
    </div>
</div>
<%--<canvas id="evanyou" width="1920" height="934"></canvas>--%>
<script src="${pageContext.request.contextPath}/statics/js/registerCanva.js"></script>

<div class="registerwhole">
    <div class="registerback"></div>
    <div class="registerback2"></div>
    <div class="registerback3"></div>
    <div class="registerback4"></div>
    <div class="registerback5"></div>
    <div class="registerback6"></div>
    <div class="main">
        <div class="mainContent">
            <div class="maintitle">
                <h3>登录/<a href="${pageContext.request.contextPath}/toregister" class="toregister">去注册</a></h3><br>
            </div>
            <div class="registerContent">
                <form action="${pageContext.request.contextPath}/login" method="post" >
                    <span class="xinghao">*</span>
                    用户名：<input name="username" id="username" type="text" placeholder="请输入用户名" onblur="checkUname()" required>
                    <span id="usernameSpan"></span><br>

                    <span class="xinghao">*</span>
                    密码：<input name="userpass" id="pwd" type="password" placeholder="请输入密码" onblur="checkPwd()" required>
                    <span id="pwdSpan"></span><br>

                    <span class="xinghao">*</span>
                    <tr>
                        <td>验证码：</td>
                        <td>
                            <input type="text" id="code" value="" style="width:100px;" onblur="checkCode()" required />&nbsp;&nbsp;&nbsp;
                            <span id="codeSpan" class="yzm" onclick="createCode()">点击</span>
                            <span id="codeSpan2"></span>
                        </td>
                    </tr><br>

                    <span class="xinghao">*</span>
                    <tr>
                        <td colspan="2">是否同意该网站协议
                            <input type="checkbox" name="agree" id="agree" value="" onclick="checkLoginAgree()" />
                        </td>
                    </tr><br>

                    <div class="contentSubmit">
                        <input type="submit" value="提交" id="sub" name="sub" disabled="disabled" class="btn btn-large btn-primary" >
                        <input type="reset" value="重置" class="btn btn-large btn-primary">
                    </div>
                    <div class="adminAndLogin">
                        <label><a href="${pageContext.request.contextPath}/toadmin">管理员登录</a></label>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<%--<%--%>
<%--    String s="";--%>
<%--    if(session.getAttribute("iflogin")!=null){--%>
<%--        s=(String)session.getAttribute("iflogin");--%>
<%--        System.out.println(s);--%>
<%--        session.setAttribute("iflogin",null);--%>
<%--    }--%>
<%--%>--%>


<%--<h3>登录/<a href="${pageContext.request.contextPath}/toregister" class="toregister">去注册</a></h3><br>--%>
<%--<form action="${pageContext.request.contextPath}/login" method="post">--%>
<%--    用户名：<input type="text" placeholder="请输入用户名"><br>--%>
<%--    密码：<input type="password" placeholder="请输入密码">--%>
<%--</form>--%>
</body>
</html>
