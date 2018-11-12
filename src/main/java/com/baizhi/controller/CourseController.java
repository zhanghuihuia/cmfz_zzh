package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;
    private Map<String,Object> maps = new HashMap<String,Object>();

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Course> courses = courseService.findAll(page, rows);
            Integer total = courseService.findTotal();
            maps.put("rows",courses);
            maps.put("total",total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return maps;
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Course course){
        try {
            courseService.add(course);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "保存失败");
        }
        return maps;
    }
    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id){
        try {
            courseService.remove(id);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "删除失败");
        }
        return maps;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Course queryOne(String id){
        return courseService.findOne(id);
    }

    @RequestMapping("/update")
    public @ResponseBody
    Map<String,Object> update(Course course){
        try {
            courseService.motify(course);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "更新失败");
        }
        return maps;
    }

}
