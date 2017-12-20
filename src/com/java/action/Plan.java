package com.java.action;

import com.java.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("plan")
public class Plan {
    @Autowired
    PlanService service;

    @RequestMapping(value = "addplan",method = RequestMethod.POST)
    public ModelAndView
}
