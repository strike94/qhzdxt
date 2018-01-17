package com.java.service;

import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PlanService extends Origin{
    public int addPlan(int userid, String name, String docnum, String date, String local1,String local2,String local3, String address, String filepath, String filename,String state){
        Map map=new HashMap();
        map.put("Plan_userid",userid);
        map.put("Plan_name",name);
        map.put("Plan_docnum",docnum);
        map.put("local1",local1);
        map.put("local2",local2);
        map.put("local3",local3);
        map.put("address",address);
        map.put("s_time",date);
        map.put("url",filepath);
        map.put("filename",filename);
        map.put("Plan_state",state);
        int rs=super.sqlSessionTemplate.insert("PlanNameSpace.addPlan",map);
        return rs;
    }
    public void show(HttpServletRequest req, int currentPage,String local1, String local2) {
        ServletContext sc=req.getSession().getServletContext();
        int pageSize=5;
        Map map=new HashMap();
        map.put("pageSize",pageSize);
        map.put("pageNum",(currentPage-1)*5);
        map.put("local1",local1);
        map.put("local2",local2);
        req.removeAttribute("maxPage");
        if (sc.getAttribute("Plan")==null){
            int maxPage;
            int num=super.sqlSessionTemplate.selectOne("PlanNameSpace.typecount",map);
            if (num==0){
                maxPage=1;
            }else {
                maxPage=(num+(pageSize-1))/pageSize;
            }
            req.setAttribute("maxPage",maxPage);
            List<Map> data=super.sqlSessionTemplate.selectList("PlanNameSpace.selectPlan",map);
            sc.setAttribute("Plan",data);
        }
    }

    public int detailPlan(String Planid,String state){
        Map map=new HashMap();
        map.put("Plan_id",Planid);
        map.put("Plan_state",state);
        int rs=super.sqlSessionTemplate.update("PlanNameSpace.detailPlan",map);
        if(state=="修改中" && rs==1){
        rs=2;
        }
        return  rs;
    }

    public int updatePlan(String Planid,int userid,String name,String docnum,String date,String local1,String local2,String local3,String address,String filepath,String filename,String state){
        Map map=new HashMap();
        map.put("Plan_id",Planid);
        map.put("Plan_userid",userid);
        map.put("Plan_name",name);
        map.put("Plan_docnum",docnum);
        map.put("local1",local1);
        map.put("local2",local2);
        map.put("local3",local3);
        map.put("address",address);
        map.put("s_time",date);
        map.put("url",filepath);
        map.put("filename",filename);
        map.put("Plan_state",state);
        int rs=super.sqlSessionTemplate.update("PlanNameSpace.updatePlan",map);
        return rs;
    }
    
    public Map detail(String Planid) {
        Map map=new HashMap();
        map.put("Plan_id",Planid);
        Map data=super.sqlSessionTemplate.selectOne("PlanNameSpace.Plandetail",map);
        return data;
    }
}
