package com.baizhi.dao;

import com.baizhi.entity.User;

public interface UserDao  extends BasicDao<User> {
    void updateStatus(User user);

    User queryByUsername(String phoneNum);

    void updatePassword(User user);
}
