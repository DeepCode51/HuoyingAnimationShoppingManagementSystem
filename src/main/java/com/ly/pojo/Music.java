package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Music {
    private int musicId;
    private String musicName;
    private String musicLink;
    private String musicBelong;
    private String musicResource;
}
