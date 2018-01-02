package com.java.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LooklistUpdate extends Origin{
    public void updatelookarticle(){
        Map user =new HashMap();
        List<Map> list=super.sqlSessionTemplate.selectList("looklistSpace.lookarticleselect");
        super.sqlSessionTemplate.delete("looklistSpace.lookarticletruncate");
        if(list.size()>0) {
            for(int i=0;i<list.size();i++) {
                Map data = list.get(i);
                user.put("userid",data.get("userid"));
                user.put("nickname", data.get("nickname"));
                user.put("s_time", data.get("s_time"));
                user.put("article_name", data.get("article_name"));
                user.put("article_context", data.get("article_context"));
                user.put("article_type", data.get("article_type"));
                user.put("article_url", data.get("article_url"));
                user.put("article_userid", data.get("article_userid"));
                user.put("article_time", data.get("article_time"));
                super.sqlSessionTemplate.insert("looklistSpace.lookarticleinsert",user);
            }
        }
    }

    public void updatelooknotice(){
        Map user =new HashMap();
        List<Map> list=super.sqlSessionTemplate.selectList("looklistSpace.looknoticeselect");
        super.sqlSessionTemplate.delete("looklistSpace.looknoticetruncate");
        if(list.size()>0) {
            for(int i=0;i<list.size();i++) {
                Map data = list.get(i);
                user.put("userid",data.get("userid"));
                user.put("nickname", data.get("nickname"));
                user.put("s_time", data.get("s_time"));
                user.put("notice_name", data.get("notice_name"));
                user.put("notice_passtime", data.get("notice_passtime"));
                user.put("notice_date", data.get("notice_date"));
                user.put("notice_userid", data.get("notice_userid"));
                user.put("s_id", data.get("s_id"));
                user.put("notice_address", data.get("notice_address"));
                user.put("notice_level", data.get("notice_level"));
                user.put("notice_docnum", data.get("notice_docnum"));
                user.put("notice_type", data.get("notice_type"));
                user.put("notice_url", data.get("notice_url"));
                user.put("notice_street", data.get("notice_street"));
                super.sqlSessionTemplate.insert("looklistSpace.looknoticeinsert",user);
            }
        }
    }

    public void updatelookplan(){
        Map user =new HashMap();
        List<Map> list=super.sqlSessionTemplate.selectList("looklistSpace.lookplanselect");
        super.sqlSessionTemplate.delete("looklistSpace.lookplantruncate");
        if(list.size()>0) {
            for(int i=0;i<list.size();i++) {
                Map data = list.get(i);
                user.put("userid",data.get("userid"));
                user.put("nickname", data.get("nickname"));
                user.put("s_time", data.get("s_time"));
                user.put("Plan_name", data.get("Plan_name"));
                user.put("Plan_docnum", data.get("Plan_docnum"));
                user.put("Plan_url", data.get("Plan_url"));
                user.put("Plan_address", data.get("Plan_address"));
                user.put("Plan_userid", data.get("Plan_userid"));
                user.put("Plan_time", data.get("Plan_time"));
                user.put("Plan_street", data.get("Plan_street"));
                user.put("Plan_context", data.get("Plan_context"));
                super.sqlSessionTemplate.insert("looklistSpace.lookplaninsert",user);
            }
        }
    }

    public void updatelookproject(){
        Map user =new HashMap();
        List<Map> list=super.sqlSessionTemplate.selectList("looklistSpace.lookprojectselect");
        super.sqlSessionTemplate.delete("looklistSpace.lookprojecttruncate");
        if(list.size()>0) {
            for(int i=0;i<list.size();i++) {
                Map data = list.get(i);
                user.put("userid",data.get("userid"));
                user.put("nickname", data.get("nickname"));
                user.put("s_time", data.get("s_time"));
                user.put("project_name", data.get("project_name"));
                user.put("project_docnum", data.get("project_docnum"));
                user.put("project_passtime", data.get("project_passtime"));
                user.put("project_type", data.get("project_type"));
                user.put("project_address", data.get("project_address"));
                user.put("project_userid", data.get("project_userid"));
                user.put("project_time", data.get("project_time"));
                user.put("project2_userid", data.get("project2_userid"));
                user.put("project2_time", data.get("project2_time"));
                user.put("project3_userid", data.get("project3_userid"));
                user.put("project3_time", data.get("project3_time"));
                user.put("gp_url", data.get("gp_url"));
                user.put("sp_url", data.get("sp_url"));
                user.put("project_url", data.get("project_url"));
                user.put("project_street", data.get("project_street"));
                user.put("project_state", data.get("project_state"));
                user.put("project_context", data.get("project_context"));
                super.sqlSessionTemplate.insert("looklistSpace.lookprojectinsert",user);
            }
        }
    }
}
