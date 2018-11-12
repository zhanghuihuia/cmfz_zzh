package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    private Map<String,Object> maps = new HashMap<String,Object>();
    private String address = "/back/img/banner/";

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer rows){
        List<Banner> banners = bannerService.findAll(page,rows);
        Integer total = bannerService.findTotal();
        maps.put("rows",banners);
        maps.put("total",total);
        return maps;
    }
    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Banner banner, HttpServletRequest request, MultipartFile file){
        try {
            String filename = FileUtil.saveFile(file, address, request);
            banner.setImgPath(filename);
            bannerService.add(banner);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "保存失败");
        }
        return maps;
    }
    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id, HttpServletRequest request){
        try {
            String imgPath = bannerService.findOne(id).getImgPath();
            FileUtil.deleteFile(imgPath,request);
            bannerService.remove(id);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("msg", "删除失败");
        }
        return maps;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Banner queryOne(String id){
        Banner banner = bannerService.findOne(id);
        return banner;
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Banner banner, HttpServletRequest request, MultipartFile file){
        try {
            System.out.println(banner);
            String imgPath = bannerService.findOne(banner.getId()).getImgPath();
            String filename = FileUtil.udpateFile(file, imgPath, address, request);
            banner.setImgPath(filename);
            bannerService.motify(banner);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "更新失败");
        }
        return maps;
    }
}
