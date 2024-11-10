package com.ly.service.Refund;

import com.ly.dao.Refund.RefundMapper;
import com.ly.pojo.Refund;

import java.util.List;

public class RefundServiceImpl implements RefundService{
    private RefundMapper refundMapper;

    public void setRefundMapper(RefundMapper refundMapper) {
        this.refundMapper = refundMapper;
    }

    @Override
    public int addFigureRefund(Refund refund) {
        return refundMapper.addFigureRefund(refund);
    }

    @Override
    public Refund queryRefundByOrderId(String orderId) {
        return refundMapper.queryRefundByOrderId(orderId);
    }

    @Override
    public List<Refund> queryAllRefund() {
        return refundMapper.queryAllRefund();
    }

    @Override
    public int deleteRefund(String orderId) {
        return refundMapper.deleteRefund(orderId);
    }

    @Override
    public int AdminUpdateApplyOrder(String orderId) {
        return refundMapper.AdminUpdateApplyOrder(orderId);
    }

    @Override
    public int AdminReduceApplyOrder(String orderId) {
        return refundMapper.AdminReduceApplyOrder(orderId);
    }

    @Override
    public List<Refund> UserQueryApplyOrderByUserid(int userid) {
        return refundMapper.UserQueryApplyOrderByUserid(userid);
    }
}
