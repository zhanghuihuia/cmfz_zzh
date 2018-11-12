package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;


    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findAll(Integer page,Integer rows) {
        Integer start = (page-1)*rows;
        return bannerDao.queryAll(start,rows);
    }

    @Override
    public void add(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        bannerDao.insert(banner);
    }

    @Override
    public void remove(String id) {
        bannerDao.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return bannerDao.queryTotal();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Banner findOne(String id) {
        return bannerDao.queryOne(id);
    }

    @Override
    public void motify(Banner banner) {
        bannerDao.update(banner);
    }
}
