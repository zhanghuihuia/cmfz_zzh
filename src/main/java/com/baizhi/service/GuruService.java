package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService extends BasicService<Guru> {
    List<Guru> findAlls();

}
