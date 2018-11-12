package com.baizhi.dao;

import com.baizhi.entity.Chapter;

import java.util.List;

public interface ChapterDao extends BasicDao<Chapter> {

    List<Chapter> queryByZid(String zid);

    void deleteByZid(String zid);
}
