package com.baizhi.entity;

import java.util.List;

public class Menu {
    private String id;
    private String title;
    private String iconCls;
    private String href;
    private List<Menu> menus;

    public Menu() {
    }

    public Menu(String id, String title, String iconCls, String href, List<Menu> menus) {
        this.id = id;
        this.title = title;
        this.iconCls = iconCls;
        this.href = href;
        this.menus = menus;
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

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", href='" + href + '\'' +
                ", menus=" + menus +
                '}';
    }
}
