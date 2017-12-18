package com.java.action;

import com.java.beans.User;
import com.java.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@SuppressWarnings("all")
@Controller
@RequestMapping("notice")
public class Notice  {
    @Autowired
    NoticeService service;
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public ModelAndView addNotice(HttpServletRequest req,String type,String name,String docnum,String date,String local1
            ,String local2,String local3,String address){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        String local=local1+local2+local3;
        int rs=service.addNotice(userid,type,name,docnum,date,local,address);
        if (rs==1){
            System.out.println("数据录入成功");
        }
        return new ModelAndView(new RedirectView());
    }
}
