package com.java.service;

import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProjectService extends Origin{
    public int addProject(int userid, String name, String date, String accessdate, String local, String address, String type, String docnum, String filepath){
        String localadd=local+address;
        Map map =new HashMap();
        map.put("z_userid",userid);
        map.put("z_name",name);
        map.put("z_docnum",docnum);
        map.put("z_time",date);
        map.put("z_passtime",accessdate);
        map.put("address",localadd);
        map.put("type",type);
        map.put("url",filepath);
        int rs=super.sqlSessionTemplate.insert("projectNameSpace.addproject",map);
        return rs;
    }
    public void show(HttpServletRequest req, int currentPage) {
        ServletContext sc=req.getSession().getServletContext();
        int pageSize=5;
        Map map=new HashMap();
        map.put("pageSize",pageSize);
        map.put("pageNum",(currentPage-1)*5);
        int num=super.sqlSessionTemplate.selectOne("projecetNameSpace.count");
        int maxPage=(num+(pageSize-1))/pageSize;
        req.setAttribute("maxPage",maxPage);
        if (sc.getAttribute("projecet")==null){
            List<Map> data=super.sqlSessionTemplate.selectList("projecetNameSpace.selectprojecet",map);
            sc.setAttribute("projecet",data);
        }
    }
}
