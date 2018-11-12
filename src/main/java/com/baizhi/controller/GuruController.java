package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
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
@RequestMapping("/guru")
public class GuruController {
    @Autowired
    private GuruService guruService;
    private Map<String,Object> maps = new HashMap<String, Object>();
    private String address = "/back/img/guru/";

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer rows){
        List<Guru> gurus = guruService.findAll(page, rows);
        Integer total = guruService.findTotal();
        maps.put("rows",gurus);
        maps.put("total",total);
        return maps;
    }

    @RequestMapping("/queryAlls")
    public @ResponseBody List<Guru> queryAlls(){
        return guruService.findAlls();
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Guru guru, HttpServletRequest request, MultipartFile file){
        try{
            String filename = FileUtil.saveFile(file, address,request);
            guru.setHeadPic(filename);
            guruService.add(guru);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","添加失败");
        }
        return maps;
    }

    @RequestMapping("/delete")
    public @ResponseBody Map<String,Object> delete(String id, HttpServletRequest request){
        try{
            Guru guru = guruService.findOne(id);
            String fileName = guru.getHeadPic();
            FileUtil.deleteFile(fileName,request);
            guruService.remove(id);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","删除失败");
        }
        return maps;
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Guru guru, HttpServletRequest request, MultipartFile file){
        try{
            Guru guru2 = guruService.findOne(guru.getId());
            String yPath = guru2.getHeadPic();
            String filename = FileUtil.udpateFile(file, yPath, address, request);
            guru.setHeadPic(filename);
            guruService.motify(guru);
            maps.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg","更新失败");
        }
        return maps;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Guru queryOne(String id){
       return  guruService.findOne(id);
    }
}
