package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Figure {
    private int figureId;
    private String figureName;
    private String figureLink;
    private String figureImage;
    private String figureBelong;
    private String figureIntroduce;
    private float figurePrice;
    private int figureSales;

//    private float figureSalesAmount;
}
