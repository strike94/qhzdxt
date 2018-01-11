package com.java.service;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProjectService extends Origin{
    public int addProject(int userid, String name, String date, String accessdate, String local, String address, String type, String docnum, String filepath, String filename){
        Map map =new HashMap();
        map.put("z_userid",userid);
        map.put("z_name",name);
        map.put("z_docnum",docnum);
        map.put("z_time",date);
        map.put("z_passtime",accessdate);
        map.put("local",local);
        map.put("add",address);
        map.put("type",type);
        map.put("url",filepath);
        map.put("state",0);
        map.put("filename",filename);
        int rs=super.sqlSessionTemplate.insert("projectNameSpace.addproject",map);
        return rs;
    }

    public void show(HttpServletRequest req, int currentPage, String type, String local1, String local2) {
        ServletContext sc=req.getSession().getServletContext();
        int pageSize=5;
        Map map=new HashMap();
        map.put("type",type);
        map.put("pageSize",pageSize);
        map.put("pageNum",(currentPage-1)*5);
        map.put("local1",local1);
        map.put("local2",local2);
        req.removeAttribute("maxPage");
        if (sc.getAttribute("project")==null){
            int maxPage;
            int num=super.sqlSessionTemplate.selectOne("projectNameSpace.typecount",map);
            if (num==0){
                maxPage=1;
            }else {
                maxPage=(num+(pageSize-1))/pageSize;
            }
            req.setAttribute("maxPage",maxPage);
            List<Map> data=super.sqlSessionTemplate.selectList("projectNameSpace.selectproject",map);
            sc.setAttribute("project",data);
        }
    }
    
}
