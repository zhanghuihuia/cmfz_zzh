package com.baizhi.test;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class AdminTest extends BasicTest {
    @Autowired
    private AdminService adminService;

    @Test
    public void method1(){
        Admin admin = new Admin();
        admin.setName("qweqwe");
        admin.setPassword("asdasd");
        admin.setJurisdiction("2");
        adminService.addAdmin(admin);
    }

    @Test
    public void method2(){
        Admin admin = adminService.findByUsername("qweqwe", "asdasd");
        System.out.println(admin);
    }
}
