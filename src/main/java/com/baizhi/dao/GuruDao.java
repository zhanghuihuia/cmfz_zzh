package com.baizhi.dao;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruDao extends BasicDao<Guru> {

    List<Guru> queryAlls();

}
