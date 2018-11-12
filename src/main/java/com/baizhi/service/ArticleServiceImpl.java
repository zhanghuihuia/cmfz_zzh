package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Article;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private GuruDao guruDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Article> findAll(Integer page, Integer rows) {
        List<Article> articles = articleDao.queryAll((page-1)*rows, rows);
        return articles;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return articleDao.queryTotal();
    }

    @Override
    public void add(Article article) {
        article.setSid(article.getId());
        article.setId(UUID.randomUUID().toString());
        System.out.println(article);
        articleDao.insert(article);
    }

    @Override
    public void remove(String id) {
        articleDao.delete(id);
    }

    @Override
    public void motify(Article article) {
        articleDao.update(article);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Article findOne(String id) {
        Article article = articleDao.queryOne(id);
        Guru guru = guruDao.queryOne(article.getSid());
        article.setGuru(guru);
        return article;
    }
}
