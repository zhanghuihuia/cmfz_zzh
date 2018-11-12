package com.baizhi.dao;

import com.baizhi.entity.Admin;

public interface AdminDao {
    void insert(Admin admin);

    Admin queryByUsername(String name);

    void updatePassword(Admin admin);
}
