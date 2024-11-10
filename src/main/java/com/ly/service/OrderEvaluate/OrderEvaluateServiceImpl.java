package com.ly.service.OrderEvaluate;

import com.ly.dao.OrderEvaluate.OrderEvaluateMapper;
import com.ly.pojo.FigureOrderEvaluate;

import java.util.List;

public class OrderEvaluateServiceImpl implements OrderEvaluateService{
    private OrderEvaluateMapper orderEvaluateMapper;

    public void setOrderEvaluateMapper(OrderEvaluateMapper orderEvaluateMapper) {
        this.orderEvaluateMapper = orderEvaluateMapper;
    }

    @Override
    public int addFigureEvaluate(FigureOrderEvaluate figureOrderEvaluate) {
        return orderEvaluateMapper.addFigureEvaluate(figureOrderEvaluate);
    }

    @Override
    public FigureOrderEvaluate queryEvaluateByOrderId(String orderId) {
        return orderEvaluateMapper.queryEvaluateByOrderId(orderId);
    }

    @Override
    public int deleteEvaluateByOrderId(String orderId) {
        return orderEvaluateMapper.deleteEvaluateByOrderId(orderId);
    }

    @Override
    public List<FigureOrderEvaluate> queryAllEvaluate() {
        return orderEvaluateMapper.queryAllEvaluate();
    }

    @Override
    public int queryEvaluateCount() {
        return orderEvaluateMapper.queryEvaluateCount();
    }

    @Override
    public List<FigureOrderEvaluate> queryFigureEvaluate(int figureId) {
        return orderEvaluateMapper.queryFigureEvaluate(figureId);
    }
}
