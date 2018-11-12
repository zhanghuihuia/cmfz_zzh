package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.FileUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    private Map<String,Object> maps = new HashMap<String, Object>();
    private String address = "/back/video/chapter/";

    @RequestMapping("/queryAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page,Integer rows){
        try {
            List<Chapter> albums = chapterService.findAll(page, rows);
            Integer total = chapterService.findTotal();
            maps.put("rows",albums);
            maps.put("total",total);
        }catch (Exception e){
            e.printStackTrace();
        }
        return maps;
    }

    @RequestMapping("/save")
    public @ResponseBody Map<String,Object> save(Chapter chapter,MultipartFile file,HttpServletRequest request){
        try {
            String filename = FileUtil.saveFile(file, address, request);
            chapter.setDownPath(filename);
            String length = FileUtil.AudioLength(filename,request);
            chapter.setDuration(length);
            Double size = FileUtil.AudioSize(filename, request);
            chapter.setSize(size);
            chapterService.add(chapter);
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
            String imgPath = chapterService.findOne(id).getDownPath();
            FileUtil.deleteFile(imgPath,request);
            chapterService.remove(id);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "删除失败");
        }
        return maps;
    }

    @RequestMapping("/queryOne")
    public @ResponseBody Chapter queryOne(String id){
        return chapterService.findOne(id);
    }

    @RequestMapping("/update")
    public @ResponseBody Map<String,Object> update(Chapter chapter, HttpServletRequest request, MultipartFile file){
        try {
            String imgPath = chapterService.findOne(chapter.getId()).getDownPath();
            String filename = FileUtil.udpateFile(file, imgPath, address, request);
            chapter.setDownPath(filename);
            chapterService.motify(chapter);
            maps.put("success",true);
        }catch (Exception e) {
            e.printStackTrace();
            maps.put("success",false);
            maps.put("msg", "更新失败");
        }
        return maps;
    }

    @RequestMapping("download")
    public void download(String openStyle,String fileName,HttpServletRequest request,HttpServletResponse response) throws IOException {
        //根据接收的文件名去服务器中查找对应的文件
        String realName = request.getSession().getServletContext().getRealPath(fileName);
        File file = new File(realName);
        //以文件输入流读取文件
        InputStream is = new FileInputStream(file);
        // 设置响应头部信息
        response.setHeader("content-disposition", openStyle+";fileName="+ URLEncoder.encode(fileName, "UTF-8"));
        //获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //使用工具类复制文件
        IOUtils.copy(is, os);
        //关闭流
        IOUtils.closeQuietly(is);
        IOUtils.closeQuietly(os);
    }
}
