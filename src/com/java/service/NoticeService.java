package com.java.service;

import java.util.HashMap;
import java.util.Map;

public class NoticeService extends Origin{
    public int addNotice(int userid, String type, String name, String docnum, String date, String local
            , String address){
        Map map=new HashMap<>();
        map.put("type",type);
        map.put("name",name);
        map.put("docnum",docnum);
        map.put("address",local+address);
        map.put("date",date);
        map.put("g_userid",userid);
        int rs=super.sqlSessionTemplate.insert("",map);
        return rs;
    }
}
