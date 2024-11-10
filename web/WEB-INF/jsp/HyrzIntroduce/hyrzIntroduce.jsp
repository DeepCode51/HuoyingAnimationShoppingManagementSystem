<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2022/2/13
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>火影之屋</title>
  <meta name="viewport" content="width=device-width" />
  <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/hyrzIntroduce.css" >
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
        <li><a href="${pageContext.request.contextPath}/toindex">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/tohyrzIntroduce">火影介绍</a></li>
        <li><a href="${pageContext.request.contextPath}/toXuanWoMingRenIntroduce">漩涡鸣人</a></li>
        <li><a href="${pageContext.request.contextPath}/toZuoZhuIntroduce">宇智波佐助</a></li>
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
      <div class="juqingjieshao">
        <p><span>剧情介绍</span> 详细请见<a target="_blank" href="https://baike.baidu.com/item/%E7%81%AB%E5%BD%B1%E5%BF%8D%E8%80%85/3206592?fr=aladdin">《火影忍者》</a>和<a target="_blank" href="https://baike.baidu.com/item/%E7%81%AB%E5%BD%B1%E5%BF%8D%E8%80%85%E7%96%BE%E9%A3%8E%E4%BC%A0/6216138?fr=aladdin">《火影忍者疾风传》</a></p>
<%--        <c:if test="${not empty UserOrAdmin}">--%>
<%--          <c:if test="${sessionScope.UserOrAdmin=='Admin'}">--%>
<%--            <div class="updaterenzheButton">--%>
<%--              <a href="${pageContext.request.contextPath}/toupdateIntroduce?id=${hyrzIntroduce.hyrzIntroduceId}">修改内容</a>--%>
<%--            </div>--%>
<%--          </c:if>--%>
<%--        </c:if>--%>
      </div>
      <img src="statics/images/hyrzIntroduce/quanrenzhe.png">
      <div class="wordP">
        <p>${hyrzIntroduce.hyrzIntroduceMain}</p>
<%--        <p>&nbsp;&nbsp;《火影忍者》是日本漫画家岸本齐史的代表作，作品自1999年开始在周刊《少年JUMP》上连载后，读者反应非常热烈。故事成功地将原本隐藏在黑暗中，用世界上最强大的毅力和最艰辛的努力去做最密不可宣和隐讳残酷的事情的忍者，描绘成了太阳下最值得骄傲最光明无限的的职业。在这个忍者的世界中，每一位年轻的主人翁都在开拓着属于自己的忍道。</p>--%>
<%--        <P>&nbsp;&nbsp;&nbsp;2002年10月3日，《火影忍者》这部动漫在东京电视台系列全6局、岐阜放送首播，共220话；第二季《火影忍者疾风传》于2007年2月15日－2017年3月23日在东京电视台播出，共500话；累计全720话。《火影忍者疾风传》根据漫画《火影忍者》的第二部（即单行本28卷开始的部分）改编而成，在《火影忍者》动画第一期结束后，于2007年2月15日开始在东京电视台播出，2017年3月23日正式完结。标题中的“疾风”则是主角鸣人的象征，既代表了他在作品中所拥有的“风”查克拉属性，也代表他如同疾风般勇往直前的性格。</P>--%>
<%--        <p>&nbsp;&nbsp;&nbsp;十多年前一只恐怖的尾兽“九尾妖狐”袭击了木叶隐村，当时的第四代火影拼尽全力，以自己的生命为代价将“九尾妖狐”封印在了刚出生的鸣人身上。木叶村终于恢复了平静，但村民们却把鸣人当成怪物看待，所有人都疏远他。无可奈何，鸣人用各种恶作剧试图吸引大家的注意力。在伊鲁卡老师的关心下，鸣人始终保持着乐观的精神。为了让更多的人认可自己，他下定决心要成为火影！鸣人怀着过人的自信与勇气开始了训练，但一切要比他想象的要困难的多！鸣人从小十分孤独，木叶村村民把他当成九尾的化身，当他是怪物看待。一晃十多年过去了， 鸣人考入了木叶村的忍者学校，结识了伙伴佐助和小樱。佐助是宇智波一族的末裔，当他还是小孩的时候他的哥哥 —— 一个拥有强大实力的忍者将他们家族的人都杀死了，然后投靠了一直想集齐尾兽的晓组织，佐助从小就发誓要杀死哥哥，为家族报仇。鸣人他们在忍者学校得到了卡卡西老师的精心指点，在他的帮助下去迎接成长中的一次又一次挑战！不久之后，在卡卡西老师的带领下，鸣人与佐助、小樱一起踏上了修行之路。等待他们的将是无穷无尽的艰险挑战，而鸣人等人也在这生与死的较量中逐渐成长起来。距离鸣人跟随自来也离开村子外出修行已经过去了两年半。时光流逝，修行归来的鸣人与已经成长了的伙伴们再次重逢，并继续朝着“成为火影”的目标而努力着。与此同时，曾经计划捕获九尾妖狐的忍者组织“晓”，也在长时间的沉默后终于开始行动，将目标指向了拥有“尾兽”的忍者村。鸣人与“晓”，双方之间的冲突一触即发。</p>--%>
<%--        <br>--%>
        <br>
      </div>
    </div>
  </div>
</div>
</body>
</html>
