package com.java.service;

import com.java.beans.User;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginService extends  Origin{
    public User login(String username,String password){
        Map map=new HashMap();
        map.put("username",username);
        map.put("password",password);
        map=super.sqlSessionTemplate.selectOne("loginNameSpace.login",map);
        User user = new User((Integer)map.get("userid"),username);
        return user;
    }
}
