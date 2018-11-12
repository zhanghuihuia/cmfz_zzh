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
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDao albumDao;
    @Autowired
    private ChapterDao chapterDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAll(Integer page, Integer rows) {
        List<Album> albums = albumDao.queryAll((page - 1) * rows, rows);
        for (Album album : albums) {
            List<Chapter> chapters = chapterDao.queryByZid(album.getId());
            album.setChildren(chapters);
        }
        return albums;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return albumDao.queryTotal();
    }

    @Override
    public void add(Album album) {
        album.setCount(0);
        album.setId(UUID.randomUUID().toString());
        albumDao.insert(album);
    }

    @Override
    public void remove(String id) {
        chapterDao.deleteByZid(id);
        albumDao.delete(id);
    }

    @Override
    public void motify(Album album) {
       album.setCount(albumDao.queryOne(album.getId()).getCount());
        albumDao.update(album);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Album findOne(String id) {
        return albumDao.queryOne(id);
    }
}
