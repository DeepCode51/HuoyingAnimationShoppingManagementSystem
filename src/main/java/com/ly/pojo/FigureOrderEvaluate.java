package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FigureOrderEvaluate {
    private String orderId;
    private int userid;
    private String username;
    private int figureId;
    private String figureName;
    private String figureImage;
    private String evaluateContent;
    private String evaluateTime;
}
