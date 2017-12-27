package com.java.action;

import com.java.beans.User;
import com.java.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("art")
public class Article {
    @Autowired
    ArticleService service;
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public ModelAndView add(HttpServletRequest req,String name,String content,String type){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date=df.format(System.currentTimeMillis());
        int rs=service.addArticle(userid,date,name,content,type);
        if (rs!=0){
            System.out.println("数据录入成功");
            return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
        }
        return null;
    }
}
