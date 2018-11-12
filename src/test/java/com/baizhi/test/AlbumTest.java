package com.baizhi.test;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AlbumTest extends BasicTest {
    @Autowired
    private AlbumService albumService;

    @Test
    public void method1(){
        List<Album> albums = albumService.findAll(1, 3);
       /* for (Album album : albums) {
            System.out.println(album);
        }*/
    }
}
