package com.java.service;

import com.java.beans.User;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LoginService extends  Origin{
    public User login(String username,String password){
        Map map=new HashMap();
        map.put("username",username);
        map.put("password",password);
        List<Map> list=super.sqlSessionTemplate.selectList("loginNameSpace.login",map);
        if(list.size()>0) {
            Map data=list.get(0);
            User user = new User();
            user.setUserid((Integer) data.get("userid"));
            user.setUsername(username);
            return user;
        }
        return null;
    }

    public Map count(){
        int article=super.sqlSessionTemplate.selectOne("loginNameSpace.artcount");
        int noticepre=super.sqlSessionTemplate.selectOne("loginNameSpace.noticepre");
        int noticenext=super.sqlSessionTemplate.selectOne("loginNameSpace.noticenext");
        int projectpre=super.sqlSessionTemplate.selectOne("loginNameSpace.projectpre");
        int projectnext=super.sqlSessionTemplate.selectOne("loginNameSpace.projectnext");
        Map map=new HashMap();
        map.put("article",article);
        map.put("noticepre",noticepre);
        map.put("noticenext",noticenext);
        map.put("projectpre",projectpre);
        map.put("projectnext",projectnext);
        return map;

    }
}
