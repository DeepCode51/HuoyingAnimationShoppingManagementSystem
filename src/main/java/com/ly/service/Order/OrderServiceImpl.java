package com.ly.service.Order;

import com.ly.dao.Order.OrderMapper;
import com.ly.pojo.Order;
import com.ly.pojo.Refund;

import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService{
    private OrderMapper orderMapper;

    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public int addFigureOrder(Order order) {
        return orderMapper.addFigureOrder(order);
    }

    @Override
    public int queryOrderCount() {
        return orderMapper.queryOrderCount();
    }

    @Override
    public List<Order> queryUserOrder(Map map) {
        return orderMapper.queryUserOrder(map);
    }

    @Override
    public int updateIsreceive(String orderId) {
        return orderMapper.updateIsreceive(orderId);
    }

    @Override
    public List<Order> queryOrderByOrderId(String orderId) {
        return orderMapper.queryOrderByOrderId(orderId);
    }

    @Override
    public int updateIsevaluate(String orderId) {
        return orderMapper.updateIsevaluate(orderId);
    }

    @Override
    public int updateIsrefundprocess(String orderId) {
        return orderMapper.updateIsrefundprocess(orderId);
    }

    @Override
    public int updateOrderFulladdress(Refund refund) {
        return orderMapper.updateOrderFulladdress(refund);
    }


    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }

    @Override
    public List<Order> queryAllOrderSP(int startPlace, int pageSize) {
        return orderMapper.queryAllOrderSP(startPlace,pageSize);
    }

    @Override
    public int AdminDeliveryStatus(Order order) {
        return orderMapper.AdminDeliveryStatus(order);
    }

    @Override
    public int deleteOrderById(String orderId) {
        return orderMapper.deleteOrderById(orderId);
    }

    @Override
    public List<Order> queryUserOrderDateGroup(Map map) {
        return orderMapper.queryUserOrderDateGroup(map);
    }
}
