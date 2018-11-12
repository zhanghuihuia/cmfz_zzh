package com.baizhi.entity;

public class Admin {
    private String id;
    private String name;
    private String password;
    private String salt;
    private String status;//状态
    private String jurisdiction;//权限

    public Admin() {
    }

    public Admin(String id, String name, String password, String salt, String status, String jurisdiction) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.salt = salt;
        this.status = status;
        this.jurisdiction = jurisdiction;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getJurisdiction() {
        return jurisdiction;
    }

    public void setJurisdiction(String jurisdiction) {
        this.jurisdiction = jurisdiction;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", status='" + status + '\'' +
                ", jurisdiction='" + jurisdiction + '\'' +
                '}';
    }
}
