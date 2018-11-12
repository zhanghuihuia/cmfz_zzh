package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    private Map<String,Object> maps = new HashMap<String,Object>();
    private String address = "/back/img/user/";

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(User user, HttpServletRequest request, MultipartFile file){
        try{
            String filename = FileUtil.saveFile(file, address, request);
            user.setHeadPic(filename);
            userService.add(user);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
        }
        return maps;
    }

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer  rows){
        try{
            List<User> users = userService.findAll(page, rows);
            Integer total = userService.findTotal();
            maps.put("rows",users);
            maps.put("total",total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return maps;
    }

    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id,HttpServletRequest request){
        try{
            String imgPath = userService.findOne(id).getHeadPic();
            FileUtil.deleteFile(imgPath,request);
            userService.remove(id);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","删除失败");
        }
        return maps;
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(User user, HttpServletRequest request, MultipartFile file){
        try{
            String imgPath = userService.findOne(user.getId()).getHeadPic();
            String filename = FileUtil.udpateFile(file, imgPath, address, request);
            user.setHeadPic(filename);
            userService.motify(user);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","更新失败");
        }
        return maps;
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request,String username, String password, String code){
        HttpSession session = request.getSession();
        String validationCode = (String) session.getAttribute("validationCode");
        if(validationCode.equals(code)){

            User user = userService.findByUsername(username, password);
            if(user!=null){
                session.setAttribute("user",user);
                return "redirect:/back/main/main.jsp";
            }
        }
        return "redirect:/back/login.jsp";
    }

    @RequestMapping("/disable")
    public @ResponseBody Map<String,Object> disable(String id){
        try{
            User user = new User();
            user.setId(id);
            user.setStatus("已封禁");
            userService.motifyStatus(user);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","禁用失败");
        }
        return maps;
    }

    @RequestMapping("/unset")
    public @ResponseBody Map<String,Object> unset(String id){
        try{
            User user = new User();
            user.setId(id);
            user.setStatus("正常使用");
            userService.motifyStatus(user);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","解封失败");
        }
        return maps;
    }

    @RequestMapping("/updatePassword")
    public @ResponseBody Map<String,Object> updatePassword(String name,String password,HttpServletRequest request){
        try{
            userService.motifyPassword(name,password);
            clear(request);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","密码更改失败");
        }
        return maps;
    }

    @RequestMapping("clear")
    public String clear(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("user",null);
        return "login";
    }
}
