package com.ly.service.Refund;

import com.ly.pojo.Refund;

import java.util.List;

public interface RefundService {
    //用户提交退款处理
    int addFigureRefund(Refund refund);
    //通过orderId查询是否提交申请
    Refund queryRefundByOrderId(String orderId);
    //管理员查看所有退款申请
    List<Refund> queryAllRefund();
    //管理员完成处理订单,删除该处理
    int deleteRefund(String orderId);
    //管理员通过订单申请处理，将订单申请信息的处理状态“未处理”更改为“已处理（审核通过）”
    int AdminUpdateApplyOrder(String orderId);
    //管理员拒绝通过用户的订单申请请求，并更新用户那边的订单请求状态为“审核不通过”
    int AdminReduceApplyOrder(String orderId);
    //用户查询自己的订单审核进度的界面
    List<Refund> UserQueryApplyOrderByUserid(int userid);
}
