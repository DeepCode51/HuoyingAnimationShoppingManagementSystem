<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/1
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火影之屋</title>
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" href="${pageContext.request.contextPath}/statics/images/same/renIcon2.png">
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/layui.css" >--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/renzhejianjie.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/order.css" >
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>
<%--    <script src="${pageContext.request.contextPath}/statics/js/layui.js"></script>--%>
<%--    <link href="//unpkg.com/layui@2.7.6/dist/css/layui.css" rel="stylesheet">--%>
<%--    <script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>--%>

    <link href="${pageContext.request.contextPath}/statics/images/layui/css/layui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/images/layui/layui.js"></script>
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
                    <h2 class="UserOrderH2Title">我的订单</h2>
                </div>
                <div class="UserOrder-choose">
                    <a href="${pageContext.request.contextPath}/toUserOrder">全部订单</a>
                    <a href="${pageContext.request.contextPath}/toUserOrder?vcheck=1">待收货</a>
                    <a href="${pageContext.request.contextPath}/toUserOrder?vcheck=2">待评价</a>
                    <a href="${pageContext.request.contextPath}/toUserOrder?vcheck=3">已评价</a>
                </div>
                <table class="UserOrder-table">
                    <tr>
                        <th class="th0">订单号</th>
                        <th class="th1">订单详情</th>
                        <th class="th2">总价</th>
                        <th class="th3">收货人信息</th>
                        <th class="th4">发货状态</th>
                        <th class="th5">操作</th>
                    </tr>
                    <c:forEach var="order" items="${requestScope.get('orders')}" varStatus="i">
                        <tr>
                            <td class="td0" name="orderId">
                                <div>
                                    <p>订单号:${order.getOrderId()}</p>
                                </div>
                            </td>
                            <td class="td1" name="orderInformation">
                                <div>
                                    <img src="/statics/images/figure/${order.getFigure().getFigureImage()}" height="100" width="100" />
                                </div>
                                <div>
                                    <p>${order.getFigure().getFigureName()}</p>
                                </div>
                                <div>
                                    <p>单价:${order.getFigure().getFigurePrice()}</p>
                                </div>
                                <div>
                                    <p>购买数量：${order.getFigureQuantity()}</p>
                                </div>
                                <br><br>
<%--                                <div>--%>
<%--                                    <p>订单号:${order.getOrderId()}</p>--%>
<%--                                </div>--%>
                                <div>
                                    <p class="p4">购买时间：${order.getPayTime()}</p>
                                </div>
                            </td>
                            <td class="td2" name="orderPay">
                                <div>
                                    <strong>已付：¥${order.getPrice()}</strong><br>
                                    <span>支付方式：${order.getPayWay()}</span>
                                </div>
                            </td>
                            <td class="td3" name="orderAddress">
                                <div>
                                    <div>
                                        <strong>用户：${order.getUsername()}</strong>
                                        <p class="p2">收货地址：${order.getFulladdress()}</p>
                                        <c:if test="${order.getIsreceive() eq 'false'}">
                                            <span>收货状态：未收货</span>
                                        </c:if>
                                        <c:if test="${order.getIsreceive() eq 'true'}">
                                            <span>收货状态：已收货</span>
                                        </c:if>
<%--                                        <p>${order.getBophone()}</p>--%>
                                    </div>
                                    <div></div>
                                </div>
                            </td>
                            <td class="td4" name="orderDeliveryStatus">
                                <div>
                                    <span>${order.getDeliveryStatus()}</span><br>
                                    <c:if test="${order.getDeliveryStatus() eq '已发货'}">
                                        <span style="color: #000000;font-weight: bold;">物流方式↓↓<br>${order.getTrackingBelong()}</span><br>
                                        <span style="color: #dc3b20;font-weight: bold;">${order.getTrackingNumber()}</span>
                                    </c:if>
                                </div>
                            </td>
                            <td class="td5" name="orderWay">
                                <div>
                                    <c:choose>
                                        <c:when test="${order.getIsreceive() eq 'false'}">
                                            <c:if test="${order.getDeliveryStatus() eq '未发货'}">
                                                <button class="layui-btn OrderWay${i.index}">确认收货</button>
<%--                                                <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>--%>
                                                <script>
                                                    var h=document.querySelector('.OrderWay${i.index}');
                                                    //用户确认收货，如果是“未收货”，点击确认收货会弹窗提示用户该商品还未发货，还打算确认收货吗？
                                                    h.onclick=function() {
                                                        //示范一个公告层
                                                        layer.open({
                                                            type: 1,
                                                            title: false, //不显示标题栏
                                                            closeBtn: false,
                                                            area: '300px;',
                                                            shade: 0.8,
                                                            id: 'LAY_layuipro', //设定一个id，防止重复弹出
                                                            btn: ['执意确认收货', '取消'],
                                                            btnAlign: 'c',
                                                            moveType: 1, //拖拽模式，0或者1
                                                            content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' + '' +
                                                                '你知道吗？亲！<br>您的商品还未发货噢~~~现在确认收货可能会造成您的损失呢! <br><br>' +
                                                                '另外发货了也请确定货到了再确认收货噢 ^_^</div>',
                                                            success: function (layero) {
                                                                var btn = layero.find('.layui-layer-btn');
                                                                btn.find('.layui-layer-btn0').attr({
                                                                    href: '${pageContext.request.contextPath}/receiveMakeSure/${order.getOrderId()}'
                                                                    // target: '_blank'
                                                                });
                                                            }
                                                        });
                                                    }
                                                </script>
                                            </c:if>
                                            <c:if test="${order.getDeliveryStatus() eq '已发货'}">
                                                <a href="${pageContext.request.contextPath}/receiveMakeSure/${order.getOrderId()}">确认收货</a>
                                            </c:if>
                                        </c:when>
                                        <c:when test="${order.getIsreceive() eq 'true' and order.getIsevaluate() eq 'false' }">
                                            <a href="${pageContext.request.contextPath}/toFigureOrderEvaluate/${order.getOrderId()}">评价</a>
                                        </c:when>
                                        <c:when test="${order.getIsreceive() eq 'true' and order.getIsevaluate() eq 'true' }">
                                            <a href="${pageContext.request.contextPath}/showUserEvaluate/${order.getOrderId()}">查看评价</a>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
<%--                                        <c:when test="${order.getIsrefundprocess() eq 'false'}">--%>
                                        <c:when test="${order.getIfSubmitRefund() eq 'false'}">
                                            <a href="${pageContext.request.contextPath}/toAddFigureRefund/${order.getOrderId()}">申请处理</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/toUserShowApplyOrder">查看处理</a>
<%--                                            <p class="UserOrder-shouhouOK">售后已处理</p>--%>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<%--<script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/statics/js/layui.js"></script>--%>
<script>
    // layui.use('layer', function(){ //独立版的layer无需执行这一句
    // var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
    //触发事件
    <%--var active = {--%>
    <%--    //用户确认收货，如果是“未收货”，点击确认收货会弹窗提示用户该商品还未发货，还打算确认收货吗？--%>
    <%--    notice: function() {--%>
    <%--        //示范一个公告层--%>
    <%--        layer.open({--%>
    <%--            type: 1,--%>
    <%--            title: false, //不显示标题栏--%>
    <%--            closeBtn: false,--%>
    <%--            area: '300px;',--%>
    <%--            shade: 0.8,--%>
    <%--            id: 'LAY_layuipro', //设定一个id，防止重复弹出--%>
    <%--            btn: ['执意确认收货', '取消'],--%>
    <%--            btnAlign: 'c',--%>
    <%--            moveType: 1, //拖拽模式，0或者1--%>
    <%--            content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">' + '' +--%>
    <%--                '你知道吗？亲！<br>您的商品还未发货噢~~~现在确认收货可能会造成您的损失呢! <br><br>' +--%>
    <%--                '另外发货了也请确定货到了再确认收货噢 ^_^</div>',--%>
    <%--            success: function (layero) {--%>
    <%--                var btn = layero.find('.layui-layer-btn');--%>
    <%--                btn.find('.layui-layer-btn0').attr({--%>
    <%--                    href: '${pageContext.request.contextPath}/receiveMakeSure/${order.getOrderId()}'--%>
    <%--                    // target: '_blank'--%>
    <%--                });--%>
    <%--            }--%>
    <%--        });--%>
    <%--    }--%>
    <%--}--%>
    // });

    //同订单号合并订单号、支付信息、收货地址、发货情况和操作
    var orderId=document.getElementsByName("orderId");
    var orderAddress=document.getElementsByName("orderAddress");
    var orderDeliveryStatus=document.getElementsByName("orderDeliveryStatus");
    var orderWay=document.getElementsByName("orderWay");
    let ij=1;
    for(let i=0;i<orderId.length-1;i++){
        for(let j=i+1;j<orderId.length;j++){
            if(orderId[i].innerText==orderId[j].innerText){
                ij++;
            }else{
                break;
            }
        }
        if(ij>1){
            orderId[i].setAttribute("rowspan",ij);
            orderAddress[i].setAttribute("rowspan",ij);
            orderDeliveryStatus[i].setAttribute("rowspan",ij);
            orderWay[i].setAttribute("rowspan",ij);
            for(let ji=i+1;ji<i+ij;ji++){
                orderId[ji].setAttribute("hidden",true);
                orderAddress[ji].setAttribute("hidden",true);
                orderDeliveryStatus[ji].setAttribute("hidden",true);
                orderWay[ji].setAttribute("hidden",true);
            }
            i=i+ij-1;
            ij=1;
        }
    }
</script>
<%--<script src="${pageContext.request.contextPath}/statics/js/layui.js"></script>--%>
<%--<script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>--%>
</body>
</html>




