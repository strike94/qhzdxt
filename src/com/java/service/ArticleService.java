package com.java.service;

import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
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
    public void show(HttpServletRequest req, int currentPage) {
        ServletContext sc=req.getSession().getServletContext();
        int pageSize=5;
        Map map=new HashMap();
        map.put("pageSize",pageSize);
        map.put("pageNum",(currentPage-1)*5);
        int num=super.sqlSessionTemplate.selectOne("articleNameSpace.count");
        int maxPage=(num+(pageSize-1))/pageSize;
        req.setAttribute("maxPage",maxPage);
        if (sc.getAttribute("article")==null){
            List<Map> data=super.sqlSessionTemplate.selectList("articleNameSpace.selectarticle",map);
            sc.setAttribute("article",data);
        }
    }
}
