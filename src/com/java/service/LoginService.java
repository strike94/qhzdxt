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
        List<Map> data=super.sqlSessionTemplate.selectList("loginNameSpace.login",map);
        if(data.size()>0) {
            User user = new User((Integer) data.get(0).get("userid"),username);
            return user;
        }
        return null;
    }
}
