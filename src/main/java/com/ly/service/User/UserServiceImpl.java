package com.ly.service.User;

import com.ly.dao.User.UserMapper;
import com.ly.pojo.Admin;
import com.ly.pojo.User;

public class UserServiceImpl implements UserService{
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int deleteUser(int userid) {
        return userMapper.deleteUser(userid);
    }

    @Override
    public User checkUser(User user) {
        return userMapper.checkUser(user);
    }

    @Override
    public int updatePersonal(User user) {
        return userMapper.updatePersonal(user);
    }

    @Override
    public Admin checkAdmin(Admin admin) {
        return userMapper.checkAdmin(admin);
    }

    @Override
    public int updateAdminPersonal(Admin admin) {
        return userMapper.updateAdminPersonal(admin);
    }

    @Override
    public User checkRegisterUser(User user) {
        return userMapper.checkRegisterUser(user);
    }
}
