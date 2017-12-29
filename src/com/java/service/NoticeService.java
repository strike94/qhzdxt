package com.java.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeService extends Origin{
    public int addNotice(int userid, String type, String name, String docnum, String date, String local
            , String address, String filepath){
        String localadd=local+address;
        Map map=new HashMap<>();
        map.put("type",type);
        map.put("name",name);
        map.put("docnum",docnum);
        map.put("address",localadd);
        map.put("date",date);
        map.put("g_userid",userid);
        map.put("url",filepath);
        int rs=super.sqlSessionTemplate.insert("noticeNameSpace.addnotice",map);
        return rs;
    }

    public void show(HttpServletRequest req, int currentPage) {
        ServletContext sc=req.getSession().getServletContext();
        int pageSize=5;
        Map map=new HashMap();
        map.put("pageSize",pageSize);
        map.put("pageNum",(currentPage-1)*5);
        int num=super.sqlSessionTemplate.selectOne("noticeNameSpace.count");
        int maxPage=(num+(pageSize-1))/pageSize;
        req.setAttribute("maxPage",maxPage);
        if (sc.getAttribute("notice")==null){
            List<Map> data=super.sqlSessionTemplate.selectList("noticeNameSpace.selectnotice",map);
            sc.setAttribute("notice",data);
        }
    }
}
