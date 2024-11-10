<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/26
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>火影之屋</title>
  <meta name="viewport" content="width=device-width" />
  <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}statics/css/personal.css" >
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
  <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
  <script src="${pageContext.request.contextPath}/statics/js/address.js"></script>
  <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>
<%--  <link rel="stylesheet" type="text/css" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">--%>
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
        <li><a href="${pageContext.request.contextPath}/toindex">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/toPersonal">个人中心</a></li>
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
      <div class="personal">
        <div class="personal2">
          <p>编辑个人信息</p>
        </div>
        <div class="personalUpdate">
          <form action="${pageContext.request.contextPath}/personalUpdate.do" enctype="multipart/form-data" method="post">
            <input type="hidden" name="hyrzResourceId" value="${loginSession.userid}"/>
            用户昵称：
            <input name="username" type="text" value="${loginSession.username}" required><br>

            更改密码：
            <input name="userpass" type="password" value="${loginSession.userpass}" required><br>

            性别：
            <label><input type="radio" name="sex" value="男" class="sexUpdate">男</label> &nbsp;|&nbsp;
            <label><input type="radio" name="sex" value="女" class="sexUpdate">女</label><br>

            年龄：
            <input name="age" type="text" value="${loginSession.age}" required><br>

            <div class="personalImgUpdate">
              <img src="statics/images/User/${loginSession.userAvatar}" id="cropedBigImg" value='custom' alt="lorem ipsum dolor sit" data-address='' title="自定义背景"/><br>
              <input name="userAvatarUpdate" id="chooseImage" type="file" value="选择头像" required><br>
              <script>
                $('#chooseImage').on('change',function(){
                  var filePath = $(this).val(),         //获取到input的value，里面是文件的路径
                          fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),
                          src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
                  // 检查是否是图片
                  if( !fileFormat.match(/.png|.jpg|.jpeg|.jfif/) ) {
                    error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg/jfif');
                    return;
                  }
                  $('#cropedBigImg').attr('src',src);
                });
              </script>
            </div>

            籍贯：
            <select name="province" id="province" onchange="getCity()" class="addressSelectProvince" required>
              <option value="">省份</option>
              <!-- 利用js把省份添加到下拉列表里-->
              <script type="text/javascript">
                for(var i=0;i<provinceArr.length;i++)
                {
                  document.write("<option value='"+provinceArr[i]+"'>"+provinceArr[i]+"</option>");
                }
              </script>
            </select>
            <select name="city" id="city" class="addressSelectCity" required> <option value="">城市</option></select><br>

            详细地址：
            <input name="fulladdress" type="text" value="${loginSession.fulladdress}" required><br>

            手机号：
            <input name="userPhone" type="text" value="${loginSession.userPhone}" required><br>

            个人介绍：
            <textarea cols="20" rows="10" name="introduce" required>${loginSession.introduce}</textarea><br>

            <div class="submitAndreset">
              <input type="submit" value="修改" class="submitUpdate">
              <input type="reset" value="重置" class="resetUpdate">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
