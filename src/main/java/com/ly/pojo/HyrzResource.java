package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HyrzResource {
    private int hyrzResourceId;
    private String hyrzResourceName;
    private String hyrzResourceLink;
}
