package com.baizhi.controller;

import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    private Map<String,Object> maps = new HashMap<String,Object>();

    @RequestMapping("queryAll")
    public @ResponseBody Map<String,Object> queryAll(){
        List<Menu> menus = menuService.findAll();
        maps.put("rows",menus);
        return maps;
    }
}
