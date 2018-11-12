package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
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
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    private Map<String,Object> maps = new HashMap<String,Object>();
    private String address = "/back/img/article/";

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Article> articles = articleService.findAll(page, rows);
            Integer total = articleService.findTotal();
            maps.put("rows",articles);
            maps.put("total",total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return maps;
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Article article,MultipartFile file,HttpServletRequest request){
        try {
            String filename = FileUtil.saveFile(file, address, request);
            article.setImgPath(filename);
            articleService.add(article);
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
            String imgPath = articleService.findOne(id).getImgPath();
            FileUtil.deleteFile(imgPath,request);
            articleService.remove(id);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "删除失败");
        }
        return maps;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Article queryOne(String id){
        return articleService.findOne(id);
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Article article, HttpServletRequest request, MultipartFile file){
        try {
            String imgPath = articleService.findOne(article.getId()).getImgPath();
            String filename = FileUtil.udpateFile(file, imgPath, address, request);
            article.setImgPath(filename);
            articleService.motify(article);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "更新失败");
        }
        return maps;
    }
}
