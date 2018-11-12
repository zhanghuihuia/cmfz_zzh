package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    private Map<String,Object> maps = new HashMap<String,Object>();

    @RequestMapping("/login")
    public String login(String username,String password,String encode, HttpServletRequest request){


        HttpSession session = request.getSession();
        String validationCode = (String) session.getAttribute("validationCode");
        if(validationCode.equals(encode)){

            Admin admin = adminService.findByUsername(username, password);
            if(admin!=null){
                session.setAttribute("admin",admin);
                return "redirect:/back/main/main.jsp";
            }
        }
        return "redirect:/back/login.jsp";
    }

    @RequestMapping("/updatePassword")
    public @ResponseBody Map<String,Object> updatePassword(String name,String password,HttpServletRequest request){
        try{
            adminService.motifyPassword(name,password);
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
        System.out.println("this is clear");
        HttpSession session = request.getSession();
        session.setAttribute("admin",null);
        return "back/login";
    }
}
