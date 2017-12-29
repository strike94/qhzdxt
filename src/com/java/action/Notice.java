package com.java.action;

import com.java.beans.User;
import com.java.service.FileUpload;
import com.java.service.NoticeService;
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

@SuppressWarnings("all")
@Controller
@RequestMapping("notice")
public class Notice extends FileUpload {
    @Autowired
    NoticeService service;
    @RequestMapping(value = "add",method = RequestMethod.POST)
    public ModelAndView addNotice(HttpServletRequest req,String type,String name,String docnum,String date,String local1
            ,String local2,String local3,String address,@RequestParam("file") MultipartFile file){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        String local=local1+local2+local3;
        String filepath=fileUpload(req,file);
        int rs=service.addNotice(userid,type,name,docnum,date,local,address,filepath);
        if (rs==1){
            System.out.println("数据录入成功");
            return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
        }
        return null;
    }

    @RequestMapping("/show")
    public ModelAndView show(HttpServletRequest req,String PageNum){
        ServletContext sc=req.getSession().getServletContext();
        sc.removeAttribute("notice");
        int currentPage=1;
        if (PageNum!=null && !"".equals(PageNum)){
            currentPage=Integer.parseInt(PageNum);
        }
        req.setAttribute("pageNum",currentPage);
        service.show(req,currentPage);
        return new ModelAndView("/page/notice");
    }

}
