package com.java.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Permisssion extends Origin{
    public void updatelook(){
        Map user =new HashMap();
        List<Map> list=super.sqlSessionTemplate.selectList("permissionNameSpace.permissionselect");
        super.sqlSessionTemplate.delete("permissionNameSpace.permissiontruncate",user);
        if(list.size()>0) {
            for(int i=0;i<list.size();i++) {
                Map data = list.get(i);
                user.put("userid",data.get("userid"));
                user.put("username", data.get("username"));
                user.put("rolepermission", data.get("rolepermission"));
                super.sqlSessionTemplate.insert("permissionNameSpace.permissioninsert",user);
            }
        }
    }
}
