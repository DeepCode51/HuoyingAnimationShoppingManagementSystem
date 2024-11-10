package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private String orderId;
    private int userid;
    private String username;
    private int figureId;
    private String figureName;
    private int figureQuantity;
    private double price;
    private String payWay;
    private String deliveryStatus;
    private String payTime;
    private String fulladdress;
    private String isreceive;
    private String isevaluate;
    private String isrefundprocess;
    private String ifSubmitRefund;
    private String trackingBelong;
    private String trackingNumber;

    private User user;
    private Figure figure;
}
