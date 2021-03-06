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
    public int addNotice(int userid, String type, String name, String docnum, String date, String local1, String local2, String local3, String address, String filepath, String filename){
        Map map=new HashMap<>();
        map.put("type",type);
        map.put("name",name);
        map.put("docnum",docnum);
        map.put("local1",local1);
        map.put("local2",local2);
        map.put("local3",local3);
        map.put("add",address);
        map.put("date",date);
        map.put("g_userid",userid);
        map.put("url",filepath);
        map.put("filename",filename);
        int rs=super.sqlSessionTemplate.insert("noticeNameSpace.addnotice",map);
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
        if (sc.getAttribute("notice")==null){
                int maxPage;
                int num=super.sqlSessionTemplate.selectOne("noticeNameSpace.typecount",map);
                if (num==0){
                    maxPage=1;
                }else {
                    maxPage=(num+(pageSize-1))/pageSize;
                }
                req.setAttribute("maxPage",maxPage);
                List<Map> data=super.sqlSessionTemplate.selectList("noticeNameSpace.selectnotice",map);
                sc.setAttribute("notice",data);
            }
        }

    public int detailnotice(String noticeid,String state){
        Map map=new HashMap();
        map.put("notice_id",noticeid);
        map.put("stateid",state);
        int rs=super.sqlSessionTemplate.update("noticeNameSpace.detailnotice",map);
        if(Integer.parseInt(state)==5 && rs==1){
            rs=2;
            return rs;
        }
        return  rs;
    }
    
    public int updatenotice(String noticeid,int userid,String name,String docnum,String date,String local1,String local2,String local3,String address,String filepath,String filename,String state){
        Map map=new HashMap();
        map.put("notice_id",Integer.parseInt(noticeid));
        map.put("notice_userid",userid);
        map.put("notice_name",name);
        map.put("notice_docnum",docnum);
        map.put("local1",local1);
        map.put("local2",local2);
        map.put("local3",local3);
        map.put("address",address);
        map.put("s_time",date);
        map.put("url",filepath);
        map.put("filename",filename);
        map.put("stateid",Integer.parseInt(state));
        int rs=super.sqlSessionTemplate.update("noticeNameSpace.updatenotice",map);
        return rs;
    }

    public Map detail(String noticeid) {
        Map map=new HashMap();
        map.put("noticeid",noticeid);
        Map data=super.sqlSessionTemplate.selectOne("noticeNameSpace.noticedetail",map);
        return data;
    }

}
