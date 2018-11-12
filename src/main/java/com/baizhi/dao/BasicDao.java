package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BasicDao<T> {
    List<T> queryAll(@Param("start") Integer start, @Param("rows") Integer rows);

    Integer queryTotal();

    void insert(T t);

    void delete(String id);

    void update(T t);

    T queryOne(String id);

}
