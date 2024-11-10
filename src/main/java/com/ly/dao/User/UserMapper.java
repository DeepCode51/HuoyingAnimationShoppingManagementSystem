package com.ly.dao.User;

import com.ly.pojo.Admin;
import com.ly.pojo.Renzhe;
import com.ly.pojo.User;

public interface UserMapper {
    //新增用户
    int addUser (User user);
    //删除用户
    int deleteUser(int userid);
    //用户登录，查找用户是否在数据库
    User checkUser(User user);
    //personal页进行更新当前用户信息
    int updatePersonal(User user);
    //管理员登录，查找用户名
    Admin checkAdmin(Admin admin);
    //adminPersonal页进行更新当前管理员信息
    int updateAdminPersonal(Admin admin);
    //用户注册时查找用户名，若用户名已经存在，就session存下existUser值为true，跳回注册页面，弹窗已经用户名存在
    User checkRegisterUser(User user);
}
