package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService extends BasicService<User> {
    void motifyStatus(User user);

    User findByUsername(String username,String password);

    void motifyPassword(String username,String password);
}
