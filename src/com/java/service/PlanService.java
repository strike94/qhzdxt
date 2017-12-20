package com.java.service;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class PlanService extends Origin{
    public int addPlan(int userid, String name, String docnum, String date, String local, String address){
        Map map=new HashMap();
        String localadd = local+address;
        map.put("Plan_userid",userid);
        map.put("Plan_name",name);
        map.put("Plan_docnum",docnum);
        map.put("address",localadd);
        map.put("Plan_time",date);
        int rs=super.sqlSessionTemplate.insert("planNameSpace.addplan",map);
        return rs;
    }
}