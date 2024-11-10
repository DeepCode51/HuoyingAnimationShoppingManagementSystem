package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Renzhe implements Serializable {
    private int renzheId;
    private String renzheName;
    private String renzheLink;
    private String renzheImage;
    private String renzheBelong;
    private String renzheIntroduce;
}
