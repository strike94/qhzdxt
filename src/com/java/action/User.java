package com.java.action;


import com.java.service.Userservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class User {
    @Autowired
    Userservice service;

    @RequestMapping(value = "new",method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest req,String username,String lock, String nickname,String email,String phonenum,String address,int roleid,int groupid,String remark){
        int rs=service.addUser(username,lock,nickname,email,phonenum,address,roleid,groupid,remark);
        if (rs==1){
            System.out.println("用户录入成功");
            return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
        }if(rs==2){
                System.out.println("用户已存在");
                return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/newAccount.jsp"));
        }
        return null;
    }
}
