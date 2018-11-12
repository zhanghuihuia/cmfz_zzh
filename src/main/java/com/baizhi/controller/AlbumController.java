package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
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
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    private AlbumService albumService;

    private Map<String,Object> maps = new HashMap<String, Object>();
    private String address = "/back/img/album/";

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Album> albums = albumService.findAll(page, rows);
            Integer total = albumService.findTotal();
            maps.put("rows",albums);
            maps.put("total",total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return maps;
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Album album,MultipartFile file,HttpServletRequest request){
        try {
            String filename = FileUtil.saveFile(file, address, request);
            album.setCoverImg(filename);
            albumService.add(album);
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
            String imgPath = albumService.findOne(id).getCoverImg();
            FileUtil.deleteFile(imgPath,request);
            albumService.remove(id);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "删除失败");
        }
        return maps;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Album queryOne(String id){
        return albumService.findOne(id);
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Album album, HttpServletRequest request, MultipartFile file){
        try {
            String imgPath = albumService.findOne(album.getId()).getCoverImg();
            String filename = FileUtil.udpateFile(file, imgPath, address, request);
            album.setCoverImg(filename);
            albumService.motify(album);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "更新失败");
        }
        return maps;
    }
}
