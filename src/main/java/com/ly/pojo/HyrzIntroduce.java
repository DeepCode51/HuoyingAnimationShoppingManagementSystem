package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HyrzIntroduce {
    private int hyrzIntroduceId;
    private String hyrzIntroduceName;
    private String hyrzIntroduceImg;
    private String hyrzIntroduceMain;
}
