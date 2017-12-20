package com.java.action;

import com.java.beans.User;
import com.java.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("plan")
public class Plan {
    @Autowired
    PlanService service;

    @RequestMapping(value = "addplan",method = RequestMethod.POST)
    public ModelAndView addPlan(HttpServletRequest req,String name,String docnum,String date,String local1,String local2,String local3,String address){
        String local=local1+local2+local3;
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        int rs=service.addPlan(userid,name,docnum,date,local,address);
        if (rs==1){
            System.out.println("数据录入成功");
        }
        return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
    }
}
