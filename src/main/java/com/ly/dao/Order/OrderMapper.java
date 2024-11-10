package com.ly.dao.Order;

import com.ly.pojo.Order;
import com.ly.pojo.Refund;
import com.ly.pojo.Renzhe;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    //用户购买后付款，新增了一个订单
    int addFigureOrder(Order order);
    //查询当天订单数量
    int queryOrderCount();
    //查询该用户的订单
    List<Order> queryUserOrder(Map map);
    //确认收货,修改isreceive（用户是否已收货）,变为ture
    int updateIsreceive(String orderId);
    //通过订单查询该订单信息
//    Order queryOrderByOrderId(String orderId);
    List<Order> queryOrderByOrderId(String orderId);
    //用户完成评价,修改isevaluate（用户是否对该商品订单进行了评价）,变为true
    int updateIsevaluate(String orderId);
    //管理员完成退款处理,修改isrefundprocess,变为true
    int updateIsrefundprocess(String orderId);
    //管理员完成更换地址处理,修改order表里的fulladdress，地址变更为‘用户填写的申请内容’
    int updateOrderFulladdress(Refund refund);
    //管理员查询所有订单
    List<Order> queryAllOrder();
    //管理员查询所有订单(页码和每页数量限制)
    List<Order> queryAllOrderSP(@Param("startPlace")int startPlace, @Param("pageSize")int pageSize);
    //管理员确认发货
//    int AdminDeliveryStatus(String orderId);
    int AdminDeliveryStatus(Order order);
    //管理员删除订单
    int deleteOrderById(String orderId);
    //用户点击我的订单，查看以时间进行分组的订单，有需求可以点击后面的“查看订单详情”则可以查看该时间订单的所有商品购买
    List<Order> queryUserOrderDateGroup(Map map);
}
