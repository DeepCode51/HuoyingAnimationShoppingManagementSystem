<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/13
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>火影之屋</title>
      <meta name="viewport" content="width=device-width" />
      <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/index.css" >
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
<%--                  <li><a href="${pageContext.request.contextPath}/toindex">首页</a></li>--%>
                  <li><a href="${pageContext.request.contextPath}/tohyrzIntroduce">火影介绍</a></li>
                  <li><a href="${pageContext.request.contextPath}/torenzhejianjie">忍者简介</a></li>
                  <li><a href="${pageContext.request.contextPath}/toOPED">OPED</a></li>
                  <li><a href="${pageContext.request.contextPath}/tohyrzResource">火影迷资源</a></li>
                  <li><a href="${pageContext.request.contextPath}/toFigure">精致手办</a></li>
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
              <div class="shouyecontent">
                  <img src="statics/images/index/contentTop.jpeg">
                  <div class="daohang">
                      <p>站点导航</p><img src="statics/images/index/daohang.png">
                  </div>
                  <div class="renzheyvlan">
                      <p>忍者介绍预览</p><a href="${pageContext.request.contextPath}/torenzhejianjie"><img src="statics/images/hyrzResource/go.png"></a>
                      <table>
                          <c:forEach items="${requestScope.get('renzheclassify')}" var="renzhe">
                              <c:if test="${not empty renzheclassify}">
                                  <tr>
                                      <td>
                                          <img src="/statics/images/renzhejianjie/${renzhe.renzheImage}" alt="图片显示失败"><a target="_blank" href="${renzhe.renzheLink}">${renzhe.renzheName}</a><p>${renzhe.renzheIntroduce}</p>
                                          <c:if test="${not empty UserOrAdmin}">
                                              <c:if test="${sessionScope.UserOrAdmin=='Admin'}">
                                                  <div class="TworenzheButton">
                                                      <a href="${pageContext.request.contextPath}/toupdaterenzhe?id=${renzhe.renzheId}">修改忍者</a>
                                                      <a href="${pageContext.request.contextPath}/DeleterenzheById/${renzhe.renzheId}">删除忍者</a>
                                                  </div>
                                              </c:if>
                                          </c:if>
                                      </td>
                                  </tr>
                              </c:if>
                          </c:forEach>
                      </table>
                  </div>
                  <div class="OPEDyvlan">
                      <p>OP+ED预览</p><a href="${pageContext.request.contextPath}/toOPED"><img src="statics/images/hyrzResource/go.png"></a>
<%--                      <br><br><br>--%>
                      <ul class="OPEDshunxv">
                          <c:forEach items="${requestScope.get('musicclassify')}" var="music">
                              <c:if test="${not empty musicclassify}">
                                  <li>
                                      <p>${music.musicName}</p><p>音乐播放：</p><a target="_blank" href="${music.musicLink}"><img src="statics/images/OPED/音乐.png"></a><i>在线试听</i><audio src="statics/music/${music.musicResource}" controls="controls"></audio>
                                      <c:if test="${not empty UserOrAdmin}">
                                          <c:if test="${sessionScope.UserOrAdmin=='Admin'}">
                                              <div class="TworenzheButton">
                                                  <a href="${pageContext.request.contextPath}/toupdatemusic?id=${music.musicId}">修改音乐</a>
                                                  <a href="${pageContext.request.contextPath}/DeletemusicById/${music.musicId}">删除音乐</a>
                                              </div>
                                          </c:if>
                                      </c:if>
                                  </li>
                              </c:if>
                          </c:forEach>
                      </ul>
                  </div>
                  <div class="fenxiang">
                      <p>精彩分享</p><a href="${pageContext.request.contextPath}/tohyrzResource"><img src="statics/images/hyrzResource/go.png"></a>
                      <ul class="lianjie">
                          <c:forEach items="${requestScope.get('allhyrzResourceList')}" var="hyrzResource">
                              <c:if test="${not empty allhyrzResourceList}">
                                  <li>
                                      <img src="statics/images/hyrzResource/star.png">
                                      <p>${hyrzResource.hyrzResourceName}</p>
                                      <a target="_blank" href="${hyrzResource.hyrzResourceLink}"><img src="statics/images/hyrzResource/go.png"></a>
                                      <c:if test="${not empty UserOrAdmin}">
                                          <c:if test="${sessionScope.UserOrAdmin=='Admin'}">
                                              <div class="TworenzheButton">
                                                  <a href="${pageContext.request.contextPath}/toupdateResource?id=${hyrzResource.hyrzResourceId}">修改</a> &nbsp;|&nbsp;
                                                  <a href="${pageContext.request.contextPath}/DeleteResourceById/${hyrzResource.hyrzResourceId}">删除</a>
                                              </div>
                                          </c:if>
                                      </c:if>
                                  </li>
                              </c:if>
                          </c:forEach>
                      </ul>
                  </div>
                  <div class="shouyebottomback">
                  </div>
                  <div class="shouyebottom">
                      <p>QQ：287813722</p>
                      <p>QQ-email：<a href="mailto:28781*****@qq.com">28781*****@qq.com</a></p>
                      <p>VX：_1Y-*****（现）</p>
                      <p>喜欢火影的小伙伴可以一起做哦!</p>
                  </div>
              </div>
          </div>
<%--          <div class="container">--%>
<%--              <img src="statics/images/index/lunbo/1.jpeg" class="on">--%>
<%--              <img src="statics/images/index/lunbo/2.jpeg">--%>
<%--              <img src="statics/images/index/lunbo/3.jpg">--%>
<%--              <img src="statics/images/index/lunbo/4.jpeg">--%>
<%--              <img src="statics/images/index/lunbo/5.jpg">--%>
<%--          </div>--%>
<%--          <!-- 左右按钮 -->--%>
<%--          <div class="left">&lt;</div>--%>
<%--          <div class="right">&gt;</div>--%>
<%--          <!-- 焦点 -->--%>
<%--          <ul>--%>
<%--              <li class="active"></li>--%>
<%--              <li></li>--%>
<%--              <li></li>--%>
<%--              <li></li>--%>
<%--              <li></li>--%>
<%--          </ul>--%>
      </div>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>
<%--      <p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p><p>1</p>--%>

  </div>
  </body>
</html>
