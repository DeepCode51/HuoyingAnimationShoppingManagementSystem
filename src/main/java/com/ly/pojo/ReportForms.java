package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportForms {
    private int reportFormsId;
    private int figureId;
    private String figureImage;
    private String figureName;
    private String figurePrice;
    private String figureSalesQuantity;
    private String figureSalesAmount;
}
