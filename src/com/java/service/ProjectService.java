package com.java.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProjectService extends Origin{
    public int addProject(int userid, String name, String date, String accessdate, String local, String address, String type, String docnum, String filepath){
        String localadd=local+address;
        Map map =new HashMap();
        map.put("z_userid",userid);
        map.put("z_name",name);
        map.put("z_docnum",docnum);
        map.put("z_time",date);
        map.put("z_passtime",accessdate);
        map.put("address",localadd);
        map.put("type",type);
        map.put("url",filepath);
        int rs=super.sqlSessionTemplate.insert("projectNameSpace.addproject",map);
        return rs;
    }
}
