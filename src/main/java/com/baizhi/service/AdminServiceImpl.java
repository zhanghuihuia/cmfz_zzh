package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import com.baizhi.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public void addAdmin(Admin admin) {
        admin.setId(UUID.randomUUID().toString());
        String salt = MD5Util.getSalt();
        admin.setSalt(salt);
        String md5 = MD5Util.getMD5(admin.getPassword(), salt);
        admin.setPassword(md5);
        admin.setStatus("正常使用");
        adminDao.insert(admin);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin findByUsername(String username,String password) {
        try{
            Admin admin = adminDao.queryByUsername(username);
            if(admin!=null){
                String salt = admin.getSalt();
                String md5 = MD5Util.getMD5(password, salt);
                if(admin.getPassword().equals(md5)){
                    return admin;
                }
                return null;
            }else{
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void motifyPassword(String username, String password) {
        try {
            Admin admin = new Admin();
            admin.setName(username);
            admin.setPassword(password);
            adminDao.updatePassword(admin);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
