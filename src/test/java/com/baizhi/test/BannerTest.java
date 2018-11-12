package com.baizhi.test;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import java.io.IOException;
import java.util.Date;

public class BannerTest extends BasicTest {
    @Autowired
    private BannerService bannerService;
    @Test
    public void save(){
        Banner banner = new Banner();
        banner.setTitle("经院转经轮");
        banner.setImgPath("/back/img/banner/5.jpg");
        banner.setDescription("转经轮");
        banner.setCreateDate(new Date());
        banner.setStatus("1");
        bannerService.add(banner);
    }
    @Test
    public void queryAll() throws UnsupportedAudioFileException, IOException, LineUnavailableException {
        /*List<Banner> banners = bannerService.findAll(2,2);
        for (Banner banner : banners) {
            System.out.println(banner);
        }*/
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //FileUtil.AudioLength(request);
    }
}
