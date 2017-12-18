package com.java.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

public class Origin {
    @Autowired
    protected SqlSessionTemplate sqlSessionTemplate;

    public String getBasePath(HttpServletRequest req){
        String path = req.getContextPath();
        String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
        return basePath;
    }
}
