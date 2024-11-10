package com.ly.dao.OrderEvaluate;

import com.ly.pojo.FigureOrderEvaluate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderEvaluateMapper {
    //评价该订单
    int addFigureEvaluate(FigureOrderEvaluate figureOrderEvaluate);
    //通过orderId查询该评论信息
    FigureOrderEvaluate queryEvaluateByOrderId(String orderId);
    //通过orderId删除评价信息
    int deleteEvaluateByOrderId(String orderId);
    //管理员查看所有评论
    List<FigureOrderEvaluate> queryAllEvaluate();
    //管理员查看评论总数
    int queryEvaluateCount();
    //用户查看商品评论
    List<FigureOrderEvaluate> queryFigureEvaluate(int figureId);
}
