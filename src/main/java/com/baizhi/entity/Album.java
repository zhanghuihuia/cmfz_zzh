package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Album {
    private String id;
    private String title;
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publishDate;//发布日期
    private Integer count;//音频数
    private String coverImg;//封面图片
    private Integer star;//星级
    private String author;//作者
    private String broadCast;//播音
    private String brief;//简介
    private List<Chapter> children;
    public Album() {
    }

    public Album(String id, String title, Date publishDate, Integer count, String coverImg, Integer star, String author, String broadCast, String brief, List<Chapter> children) {
        this.id = id;
        this.title = title;
        this.publishDate = publishDate;
        this.count = count;
        this.coverImg = coverImg;
        this.star = star;
        this.author = author;
        this.broadCast = broadCast;
        this.brief = brief;
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBroadCast() {
        return broadCast;
    }

    public void setBroadCast(String broadCast) {
        this.broadCast = broadCast;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public List<Chapter> getChildren() {
        return children;
    }

    public void setChildren(List<Chapter> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Album{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", publishDate=" + publishDate +
                ", count=" + count +
                ", coverImg='" + coverImg + '\'' +
                ", star=" + star +
                ", author='" + author + '\'' +
                ", broadCast='" + broadCast + '\'' +
                ", brief='" + brief + '\'' +
                ", children=" + children +
                '}';
    }
}
