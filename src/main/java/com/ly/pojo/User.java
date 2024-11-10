package com.ly.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int userid;
    private String username;
    private String userpass;
    private String sex;
    private int age;
    private String userAvatar;
    private String province;
    private String city;
    private String fulladdress;
    private String userPhone;
    private String introduce;

    private String userNewName;
}
