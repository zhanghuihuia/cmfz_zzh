package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Album;
import com.baizhi.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    private AlbumDao albumDao;
    @Autowired
    private ChapterDao chapterDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Chapter> findAll(Integer page, Integer rows) {
        return chapterDao.queryAll((page - 1) * rows, rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return chapterDao.queryTotal();
    }

    @Override
    public void add(Chapter chapter) {
        Album album = albumDao.queryOne(chapter.getId());
        album.setCount(album.getCount()+1);
        albumDao.update(album);
        chapter.setId(UUID.randomUUID().toString());
        chapter.setZid(album.getId());
        chapterDao.insert(chapter);
    }

    @Override
    public void remove(String id) {
        chapterDao.delete(id);
    }

    @Override
    public void motify(Chapter chapter) {

        chapterDao.update(chapter);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Chapter findOne(String id) {
        return chapterDao.queryOne(id);
    }
}
