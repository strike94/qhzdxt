package com.java.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PlanService extends Origin{
    public int addPlan(int userid, String name, String docnum, String date, String local, String address, String filepath){
        Map map=new HashMap();
        String localadd = local+address;
        map.put("Plan_userid",userid);
        map.put("Plan_name",name);
        map.put("Plan_docnum",docnum);
        map.put("address",localadd);
        map.put("Plan_time",date);
        map.put("url",filepath);
        int rs=super.sqlSessionTemplate.insert("planNameSpace.addplan",map);
        return rs;
    }
    public void show(HttpServletRequest req, int currentPage) {
        ServletContext sc=req.getSession().getServletContext();
        int pageSize=5;
        Map map=new HashMap();
        map.put("pageSize",pageSize);
        map.put("pageNum",(currentPage-1)*5);
        int num=super.sqlSessionTemplate.selectOne("planNameSpace.count");
        int maxPage=(num+(pageSize-1))/pageSize;
        req.setAttribute("maxPage",maxPage);
        if (sc.getAttribute("plan")==null){
            List<Map> data=super.sqlSessionTemplate.selectList("planNameSpace.selectplan",map);
            sc.setAttribute("plan",data);
        }
    }
}
