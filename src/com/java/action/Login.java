package com.java.action;

import com.java.beans.User;
import com.java.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("login")
public class Login {
    @Autowired
    LoginService service;
    @RequestMapping(value = "show",method = RequestMethod.POST)
    public String login(HttpServletRequest req, String username, String password){
        User user=service.login(username,password);
        if (user!= null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            return  "redirect:/login/back";
        }else{
            return "/page/login";
        }
    }

    @RequestMapping("/back")
    public ModelAndView back(){
        Map map= service.count();
        return new ModelAndView("/page/home",map);
    }

}
