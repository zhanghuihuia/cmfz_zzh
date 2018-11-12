package com.baizhi.test;

import com.baizhi.service.ArticleService;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Random;

public class ArticleTest extends  BasicTest {
    @Autowired
    private ArticleService articleService;

    @Test
    public void method1(){
       /* List<Article> articles = articleService.findAll(1, 5);
        for (Article article : articles) {
            System.out.println(article);
        }*/
       /*int[] a = {9,6,4,8,3,9,0,4,5,2};
        for(int i=0;i<a.length;i++){
            for(int j=1;j<a.length-i;j++){
                if(a[j-1]>a[j]){
                    int o = a[j];
                    a[j] = a[j-1];
                    a[j-1] = o;
                }
            }
        }
        for (int i : a) {
            System.out.print(i);
        }*/
        String salt = getSalt(4);
        System.out.println(salt);
        DigestUtils.md5Hex("123");
    }
   /* public static void main(String[] args) {

    }*/

    public static String getSalt(Integer lenth){
        String s="abcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<lenth;i++){
            Random r=new Random();
            int d=r.nextInt(s.length());
            String ss = s.substring(d,d+1);
            sb.append(ss);
        }
        return sb.toString();
    }
}
