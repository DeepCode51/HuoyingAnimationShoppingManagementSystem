<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/13
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/register.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <script src="${pageContext.request.contextPath}/statics/js/address.js"></script>
    <script src="/WEB-INF/statics/js/address.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/register.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>
<%--    <script src="${pageContext.request.contextPath}/statics/js/registerCanva.js"></script   >--%>
    <link rel="stylesheet" type="text/css" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<%--<script>--%>
<%--    laydate.render({--%>
<%--        elem: '#test2'--%>
<%--        ,position: 'static'--%>
<%--        ,change: function(value, date){ //监听日期被切换--%>
<%--            lay('#testView').html(value);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<%--<span id="testView"></span>--%>
<%--<div id="test2"></div>--%>
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
                <h3>注册/<a href="${pageContext.request.contextPath}/tologin" class="tologin">去登录</a></h3>
            </div>
            <div class="registerContent">
                <form action="${pageContext.request.contextPath}/register" enctype="multipart/form-data" method="post" onsubmit="return checkSub()">
                    <span class="xinghao">*</span>用户名：
                    <input name="username" id="username" type="text" placeholder="请输入用户名" onblur="checkUname()" required>
                    <span id="usernameSpan"></span><br>

                    <span class="xinghao">*</span>密码：
                    <input name="userpass" id="pwd" type="password" placeholder="请输入密码" onblur="checkPwd()" required>
                    <span id="pwdSpan"></span><br>

                    <span class="xinghao">*</span>确认密码：
                    <input name="userpasstwo" id="pwd2" type="password" placeholder="再次输入密码" onblur="checkPwd2()" required>
                    <span id="pwd2Span"></span><br>

                    &nbsp;&nbsp;性别：<label><input type="radio" name="sex" value="男">男</label> &nbsp;|&nbsp;
                    <label><input type="radio" name="sex" value="女">女</label><br>

                    <span class="xinghao">*</span>
                    年龄：<input name="age" id="age" type="text" placeholder="请输入年龄" onblur="checkAge()" required>
                    <span id="ageSpan"></span><br>

<%--                    头像：<input name="userAvatarFile" type="file"><br>--%>

                    &nbsp;&nbsp;籍贯：
                    <select name="province" id="province" onchange="getCity()" class="addressSelectProvince">
                        <option value="">省份</option>
                        <!-- 利用js把省份添加到下拉列表里-->
                        <script type="text/javascript">
                            for(var i=0;i<provinceArr.length;i++)
                            {
                                document.write("<option value='"+provinceArr[i]+"'>"+provinceArr[i]+"</option>");
                            }
                        </script>
                    </select>
                    <select name="city" id="city" class="addressSelectCity"> <option value="">城市</option></select><br>

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
                            <input type="checkbox" name="agree" id="agree" value="" onclick="checkAgree()" />
                        </td>
                    </tr><br>

                    <div class="contentSubmit">
                        <input type="submit" value="提交" id="sub" name="sub" disabled="disabled" class="btn btn-large btn-primary">
                        <input type="reset" value="重置" class="btn btn-large btn-primary">
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    if(${not empty existUser}){
        if (${sessionScope.existUser=='用户名已经存在，请重新填写！！！'}){
            // window.onload=existUser;
            alert("${existUser}");
        }
    }
</script>
<%
    if(session.getAttribute("existUser")!=null)
    {
        session.setAttribute("existUser",null);
    }
%>
</body>
</html>
