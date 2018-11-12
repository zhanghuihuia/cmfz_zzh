package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.dao.UserDao;
import com.baizhi.entity.Course;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private UserDao userDao;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findAll(Integer page, Integer rows) {
        List<Course> courses = courseDao.queryAll((page - 1) * rows, rows);
        for (Course cours : courses) {
            if(cours.getUid()!=null){
                User user = userDao.queryOne(cours.getUid());
                cours.setUsername(user.getName());
                cours.setUser(user);
            }
        }
        return courses;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer findTotal() {
        return courseDao.queryTotal();
    }

    @Override
    public void add(Course course) {
        course.setId(UUID.randomUUID().toString());
        course.setMarking("必修");
        course.setUid(null);
        courseDao.insert(course);
    }

    @Override
    public void remove(String id) {
        courseDao.delete(id);
    }

    @Override
    public void motify(Course course){
        course.setMarking("必修");
        courseDao.update(course);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Course findOne(String id) {
        return courseDao.queryOne(id);
    }
}
