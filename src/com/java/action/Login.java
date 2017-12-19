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

@Controller
@RequestMapping("login")
public class Login {
    @Autowired
    LoginService service;

    @RequestMapping(value = "show",method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest req, String username, String password){
        User user=service.login(username,password);
        if (user!= null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            return  new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
        }else{
            return new ModelAndView("page/login");
        }
    }
}
