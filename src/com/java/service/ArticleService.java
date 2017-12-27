package com.java.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ArticleService extends Origin {
    public int addArticle(int userid, String date, String name, String content, String type){
        Map map=new HashMap();
        map.put("userid",userid);
        map.put("date",date);
        map.put("name",name);
        map.put("content",content);
        map.put("type",type);
        int rs=super.sqlSessionTemplate.insert("articleNameSpace.addarticle",map);
        return rs;
    }
}
