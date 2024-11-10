package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int adminId;
    private String adminName;
    private String adminPass;
    private String adminSex;
    private String adminAge;
    private String adminAvatar;
    private String adminProvince;
    private String adminCity;
    private String adminIntroduce;

    private String adminNewName;
}
