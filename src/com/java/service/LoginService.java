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
        Map rs=super.sqlSessionTemplate.selectOne("",map);
        User user=new User();
        if (password.equals(rs.get("password"))){
            user.setUserid((Integer) rs.get("userid"));
            user.setUsername(username);
        }
        return user;
    }
}
