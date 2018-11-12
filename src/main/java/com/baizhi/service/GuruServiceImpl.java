package com.baizhi.service;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService {
    @Autowired
    private GuruDao guruDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAll(Integer page, Integer rows) {
        return guruDao.queryAll((page-1)*rows,rows);
    }

    @Override
    public List<Guru> findAlls() {
        return guruDao.queryAlls();
    }

    @Override
    public void add(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);
    }

    @Override
    public void remove(String id) {
        guruDao.delete(id);
    }

    @Override
    public void motify(Guru guru) {
        guruDao.update(guru);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return guruDao.queryTotal();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru findOne(String id) {
        return guruDao.queryOne(id);
    }

}
