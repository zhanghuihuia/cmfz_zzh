package com.baizhi.service;

import java.util.List;

public interface BasicService<T> {
    List<T> findAll(Integer page, Integer rows);

    Integer findTotal();

    void add(T t);

    void remove(String id);

    void motify(T t);

    T findOne(String id);
}
