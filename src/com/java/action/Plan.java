package com.java.action;

import com.java.beans.User;
import com.java.service.FileUpload;
import com.java.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("plan")
public class Plan extends FileUpload{
    @Autowired
    PlanService service;

    @RequestMapping(value = "addplan",method = RequestMethod.POST)
    public ModelAndView addPlan(HttpServletRequest req,String name,String docnum,String date,String local1,String local2,String local3,String address,@RequestParam("file") MultipartFile file){
        String local=local1+local2+local3;
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        Map map=fileUpload(req,file);
        String filepath= (String) map.get("filePath");
        String filename= (String) map.get("fileName");
        int rs=service.addPlan(userid,name,docnum,date,local,address,filepath,filename);
        if (rs==1){
            System.out.println("数据录入成功");
            return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
        }
        return null;
    }
    @RequestMapping("/show")
    public ModelAndView show(HttpServletRequest req,String PageNum){
        ServletContext sc=req.getSession().getServletContext();
        sc.removeAttribute("plan");
        int currentPage=1;
        if (PageNum!=null && !"".equals(PageNum)){
            currentPage=Integer.parseInt(PageNum);
        }
        req.setAttribute("pageNum",currentPage);
        service.show(req,currentPage);
        return new ModelAndView("/page/plan");
    }
    @RequestMapping("detail")
    public ModelAndView detail(String planid){
        Map data=service.detail(planid);
        Map map=new HashMap();
        map.put("data",data);
        return new ModelAndView("/page/planDetail",map);
    }
}
