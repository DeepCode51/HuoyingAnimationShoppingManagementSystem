package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HyrzResourceApply {
    private int resourceApplyAddID;
    private int userid;
    private String username;
    private String hyrzResourceName;
    private String hyrzResourceLink;
    private String applyAddTime;
    private String passStatus;
}
