package com.java.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@Service
public class Userservice extends Origin {
    public int addUser(String username,String lock,String nickname,String email,String phonenum,String address,int roleid,int groupid,String remark) {
        Map map = new HashMap();
        Map a1 = new HashMap();
        int rs = 2;
        map.put("username", username);
        map.put("password", "123456");
        map.put("lock", lock);
        map.put("nickname", nickname);
        map.put("e-mail", email);
        map.put("phonenum", phonenum);
        map.put("address", address);
        map.put("roleid", roleid);
        map.put("groupid", groupid);
        map.put("remark", remark);
        a1 = super.sqlSessionTemplate.selectOne("UserNameSpace.selectuser", map);
        if (a1 == null) {
            rs = super.sqlSessionTemplate.insert("UserNameSpace.adduser", map);
            return rs;
        } else {
            return rs;
        }
    }
}
