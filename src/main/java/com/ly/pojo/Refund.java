package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Refund {
    private String orderId;
    private int userid;
    private String username;
    private int figureId;
    private String figureName;
    private String figureImage;
    private String refundType;
    private String refundReason;
    private String refundTime;
    private String refundStatus;
    private Order order;
}
