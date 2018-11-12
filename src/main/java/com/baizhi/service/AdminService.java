package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    void addAdmin(Admin admin);

    Admin findByUsername(String username, String password);

    void motifyPassword(String username,String password);
}
