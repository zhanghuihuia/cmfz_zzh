package com.baizhi.test;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserTest extends BasicTest {
    @Autowired
    private UserService userService;

    @Test
    public void method1(){
        User user = new User();
        user.setPhoneNum("13453976074");
        user.setName("哈哈");
        user.setPassword("123123");
        user.setSex("男");
        user.setHeadPic("aaa");
        user.setCity("运城市");
        user.setNickName("悟空");
        user.setProvince("山西省");
        user.setSign("hahaha");
        userService.add(user);
    }

}
