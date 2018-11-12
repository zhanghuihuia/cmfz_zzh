package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void add(User user) {
        user.setId(user.getPhoneNum());
        user.setStatus("正常使用");
        String salt = MD5Util.getSalt();
        user.setSalt(salt);
        String md5 = MD5Util.getMD5(user.getPassword(), salt);
        user.setPassword(md5);
        userDao.insert(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<User> findAll(Integer page, Integer rows) {
        return userDao.queryAll((page-1)*rows,rows);
    }

    @Override
    public void remove(String id) {
        userDao.delete(id);
    }


    @Override
    public void motify(User user) {
        String salt = MD5Util.getSalt();
        user.setSalt(salt);
        String md5 = MD5Util.getMD5(user.getPassword(), salt);
        user.setPassword(md5);
        user.setStatus("正常使用");
        userDao.update(user);
    }


    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public User findOne(String id) {
        return userDao.queryOne(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return userDao.queryTotal();
    }

    @Override
    public void motifyStatus(User user) {
        userDao.updateStatus(user);
    }

    @Override
    public User findByUsername(String username, String password) {
        System.out.println(username+"---"+password);
        try{
            User user = userDao.queryByUsername(username);
            if(user!=null){
                System.out.println(user);
                String salt = user.getSalt();
                String md5 = MD5Util.getMD5(password, salt);
                if(user.getPassword().equals(md5)){
                    return user;
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
    public void motifyPassword(String username,String password) {
        try {
            User user = new User();
            user.setId(username);
            String salt = MD5Util.getSalt();
            user.setSalt(salt);
            String md5 = MD5Util.getMD5(password, salt);
            user.setPassword(md5);
            userDao.updatePassword(user);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
