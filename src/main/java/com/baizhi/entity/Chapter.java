package com.baizhi.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Chapter {
    private String id;
    private String zid;
    private String title;
    private Double size;
    private String duration;//时长
    private String downPath;
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date uploadTime;

    public Chapter() {
    }

    public Chapter(String id, String zid, String title, Double size, String duration, String downPath, Date uploadTime) {
        this.id = id;
        this.zid = zid;
        this.title = title;
        this.size = size;
        this.duration = duration;
        this.downPath = downPath;
        this.uploadTime = uploadTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getZid() {
        return zid;
    }

    public void setZid(String zid) {
        this.zid = zid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Double getSize() {
        return size;
    }

    public void setSize(Double size) {
        this.size = size;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDownPath() {
        return downPath;
    }

    public void setDownPath(String downPath) {
        this.downPath = downPath;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id='" + id + '\'' +
                ", zid='" + zid + '\'' +
                ", title='" + title + '\'' +
                ", size=" + size +
                ", duration='" + duration + '\'' +
                ", downPath='" + downPath + '\'' +
                ", uploadTime=" + uploadTime +
                '}';
    }
}
