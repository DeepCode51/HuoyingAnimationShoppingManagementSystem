<%--
  Created by IntelliJ IDEA.
  User: 28781
  Date: 2023/4/8
  Time: 10:17
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
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/layui.css" >--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/renzhejianjie.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/figureclassify.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/same.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/AdminOrder.css" >
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/index.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/same.js"></script>

    <link href="${pageContext.request.contextPath}/statics/images/layui/css/layui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/images/layui/layui.js"></script>
<%--    <link href="${pageContext.request.contextPath}/statics/css/layui.css" rel="stylesheet">--%>
<%--    <script src="${pageContext.request.contextPath}/statics/js/layui.js"></script>--%>
<%--    <script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>--%>
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
            <audio src="statics/music/青鸟页面BGM.mp3" loop controls></audio>
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
<%--                <li><a href="${pageContext.request.contextPath}/toFigure">订单处理状态</a></li>--%>
<%--                <li><a href="${pageContext.request.contextPath}/toFigure">退货处理状态</a></li>--%>
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
                <table class="AdminShowAllOrder-table">
                    <tr>
                        <th>订单号</th>
                        <th>用户</th>
                        <th>图片</th>
                        <th>手办名称</th>
                        <th>数量</th>
                        <th>收货地址</th>
                        <th>支付方式</th>
                        <th>发货状态</th>
                        <th>支付时间</th>
                        <th>发货处理</th>
                    </tr>
                    <c:forEach var="order" items="${requestScope.get('adminAllOrder')}" varStatus="i">
                        <tr>
                            <td class="td1" name="orderId">${order.getOrderId()}</td>
                            <td class="td2" name="orderUserName">${order.getUsername()}</td>
                            <td class="td3"><img src="/statics/images/figure/${order.getFigure().getFigureImage()}" height="100" width="100" /></td>
                            <td class="td4">${order.getFigure().getFigureName()}</td>
                            <td class="td5">${order.getFigureQuantity()}</td>
<%--                            <td>${order.getBophone()}</td>--%>
                            <td class="td6" name="orderAddress">${order.getFulladdress()}</td>
                            <td class="td7" name="orderPayWay">${order.getPayWay()}</td>
                            <td class="td8" name="orderDeliveryStatus">${order.getDeliveryStatus()}</td>
                            <td class="td9" name="orderPayTime">${order.getPayTime()}</td>
                            <td class="td10" name="orderWay">
                                <c:if test="${order.getDeliveryStatus() eq '已发货'}">
<%--                                    <span>该订单已发货</span>--%>
                                    <span>物流方式：${order.getTrackingBelong()}</span><br><br>
                                    <span style="color: #dc3b20">${order.getTrackingNumber()}</span>
                                </c:if>
                                <c:if test="${order.getDeliveryStatus() eq '未发货'}">
                                    <button class="layui-btn AdminOrderWay${i.index}">确认发货</button>
                                    <script>
                                        var h=document.querySelector('.AdminOrderWay${i.index}');
                                        //管理员点击“确认发货”，弹窗显示物流填写信息，选择快递公司，并填写快递单号，即可修改对应物流信息
                                        h.onclick=function() {
                                            //示范一个公告层
                                            layer.open({
                                                type: 1,
                                                title: false, //不显示标题栏
                                                closeBtn: false,
                                                area: '500px;',
                                                shade: 0.8,
                                                id: 'LAY_layuipro', //设定一个id，防止重复弹出
                                                btn: ['确认发货', '取消'],
                                                btnAlign: 'c',
                                                moveType: 1, //拖拽模式，0或者1
                                                content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;" xmlns="http://www.w3.org/1999/html">' + '' +
                                                    '<div><h2 style="font-size: 30px;font-weight: bold;color: white;text-align: center;margin: 0px 0 12px 0;">物流单号</h2></div>' +
                                                    '</br><span style="font-size: 18px">物流公司：</span><select id="trackingBelong" required style="padding: 5px;width: 180px;"><option value="请选择">--请选择--</option><option value="顺丰">顺丰</option> <option value="申通">申通</option> <option value="EMS">EMS</option><option value="跨越速运">跨越速运</option></select>' +
                                                    '</br></br><span style="font-size: 18px">快递单号：</span><input id="trackingNumber" type="text" placeholder="请填入快递单号" required style="padding: 5px;border-radius: 10px;">'+
                                                    '<br></div>',
                                                yes:function (){
                                                    $.ajax({
                                                        type:'POST',
                                                        <%--url:'${pageContext.request.contextPath}/AdmingetDeliveryStatus?orderId=${order.getOrderId()}&nowPage=${nowPage}&allPage=${allPage}&pageSize=${pageSize}',--%>
                                                        url:'/AdmingetDeliveryStatus/${order.getOrderId()}',
                                                        data:{
                                                            <%--'orderId':${order.getOrderId()},--%>
                                                            'trackingBelong':document.getElementById('trackingBelong').value,
                                                            'trackingNumber':document.getElementById('trackingNumber').value,
                                                            'nowPage':${nowPage},
                                                            'allPage':${allPage},
                                                            'pageSize':${pageSize}
                                                        },
                                                        success:function(res){
                                                            window.location.href='${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=0'
                                                            <%--window.location.href='${pageContext.request.contextPath}/AdmingetDeliveryStatus'--%>
                                                        }
                                                        <%--success:function(res){--%>
                                                        <%--    window.location.href='${pageContext.request.contextPath}/AdmingetDeliveryStatus?orderId=${order.getOrderId()}&nowPage=${nowPage}&allPage=${allPage}&pageSize=${pageSize}'--%>
                                                        <%--}--%>
                                                    })
                                                }
                                                <%--success: function (layero) {--%>
                                                <%--    var btn = layero.find('.layui-layer-btn');--%>
                                                <%--    var trackingBelong=document.getElementsByName('trackingBelong');--%>
                                                <%--    var trackingNumber=document.getElementsByName('trackingNumber');--%>
                                                <%--    btn.find('.layui-layer-btn0').attr({--%>
                                                <%--        href: '${pageContext.request.contextPath}/AdmingetDeliveryStatus?orderId=${order.getOrderId()}&trackingBelong=${trackingBelong}&trackingNumber=${trackingNumber}&nowPage=${nowPage}&allPage=${allPage}&pageSize=${pageSize}'--%>
                                                <%--    });--%>
                                                <%--}--%>
                                            });
                                        }
                                    </script>
                                </c:if>
                            </td>
<%--                            <td class="td10" name="orderWay">--%>
<%--                                <a href="${pageContext.request.contextPath}/AdmingetDeliveryStatus?orderId=${order.getOrderId()}&nowPage=${nowPage}&allPage=${allPage}&pageSize=${pageSize}">确认发货</a>--%>
<%--                            </td>--%>
                        </tr>
                    </c:forEach>
                </table>
                <div class="AdminShowAllOrder-bottom">
                    <a href="${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=0">首页</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=${(nowPage-2)*pageSize}">上一页</a>
                    当前页${nowPage}/${allPage}
                    <a href="${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=${nowPage*pageSize}">下一页</a>
                    <a href="${pageContext.request.contextPath}/toAdminShowAllOrderSP?startPlace=${(allPage-1)*pageSize}">尾页</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //管理员订单管理界面，同订单号合并订单号、用户名、收货地址、付款方式、发货情况、下单时间、管理操作
    var orderId=document.getElementsByName("orderId");
    var orderUserName=document.getElementsByName("orderUserName");
    var orderAddress=document.getElementsByName("orderAddress");
    var orderPayWay=document.getElementsByName("orderPayWay");
    var orderDeliveryStatus=document.getElementsByName("orderDeliveryStatus");
    var orderPayTime=document.getElementsByName("orderPayTime");
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
            orderUserName[i].setAttribute("rowspan",ij);
            orderAddress[i].setAttribute("rowspan",ij);
            orderPayWay[i].setAttribute("rowspan",ij);
            orderDeliveryStatus[i].setAttribute("rowspan",ij);
            orderPayTime[i].setAttribute("rowspan",ij);
            orderWay[i].setAttribute("rowspan",ij);
            for(let ji=i+1;ji<i+ij;ji++){
                orderId[ji].setAttribute("hidden",true);
                orderUserName[ji].setAttribute("hidden",true);
                orderAddress[ji].setAttribute("hidden",true);
                orderPayWay[ji].setAttribute("hidden",true);
                orderDeliveryStatus[ji].setAttribute("hidden",true);
                orderPayTime[ji].setAttribute("hidden",true);
                orderWay[ji].setAttribute("hidden",true);
            }
            i=i+ij-1;
            ij=1;
        }
    }
</script>
</body>
</html>

