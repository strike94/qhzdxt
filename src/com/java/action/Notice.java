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
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("all")
@Controller
@RequestMapping("back/notice")
public class Notice extends FileUpload {
    @Autowired
    NoticeService service;

    @RequestMapping(value = "updatenotice",method = RequestMethod.POST)
    public String updatenotice(HttpServletRequest req,String noticeid,String name,String docnum,String date, String local1,String local2,String local3,String address,@RequestParam("file") MultipartFile file,String state){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        Map map=fileUpload(req,file);
        String filepath= (String) map.get("filePath");
        String filename= (String) map.get("fileName");
        int rs=service.updatenotice(noticeid,userid,name,docnum,date,local1,local2,local3,address,filepath,filename,state);
        if (rs==1){
            System.out.println("数据修改成功");
            return "redirect:/back/notice/show";
        }
        return "redirect:/page/updatenotice";
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String addNotice(HttpServletRequest req,String type,String name,String docnum,String date,String local1
            ,String local2,String local3,String address,@RequestParam("file") MultipartFile file){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        Map map=fileUpload(req,file);
        String filepath= (String) map.get("filePath");
        String filename= (String) map.get("fileName");
        int rs=service.addNotice(userid,type,name,docnum,date,local1,local2,local3,address,filepath,filename);
        if (rs==1){
            System.out.println("数据录入成功");
            return "redirect:/page/home";
        }
        return null;
    }

    @RequestMapping("/show")
    public String show(HttpServletRequest req,String pageTo,String type,String local1,String local2,String page){
        ServletContext sc=req.getSession().getServletContext();
        sc.removeAttribute("notice");
        int currentPage=1;
        if (req.getAttribute("pageNum")!=null){
            currentPage= (int) req.getAttribute("pageNum");

        }
        if ("next".equals(page)){
            currentPage++;
        }
        if ("prev".equals(page)){
            currentPage--;
        }
        if (pageTo!=null && !"".equals(pageTo)){
            currentPage=Integer.parseInt(pageTo);
        }
        if (currentPage<1){
            currentPage=1;
        }
        req.setAttribute("pageNum",currentPage);
        req.setAttribute("type",type);
        req.setAttribute("local1",local1);
        req.setAttribute("local2",local2);
        service.show(req,currentPage,type,local1,local2);
        return "/page/notice";
    }

    @RequestMapping("/detail")
    public ModelAndView detail(String noticeid){
        Map data=service.detail(noticeid);
        Map map=new HashMap();
        map.put("data",data);
        int state= (int) data.get("stateid");
        if(state==5) {
            return new ModelAndView("/page/updatenotice", map);
        }
        if(state==1) {
            return new ModelAndView("/page/noticeDetail", map);
        }
        if(state==2) {
            return new ModelAndView("/page/noticeDetail01", map);
        }
        if (state==3){
            return new ModelAndView("/page/noticeDetail02", map);
        }
        if (state==4){
            return new ModelAndView("/page/noticeDetail03", map);
        }
        return  null;
    }

    @RequestMapping(value = "noticedetail",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView detail(HttpServletRequest req,String noticeid,String state){
        int rs=service.detailnotice(noticeid,state);
        if (rs==1) {
            System.out.println("数据修改成功");
            int currentPage = 1;
            String local1 = null;
            String local2 = null;
            String type = null;
            req.setAttribute("pageNum", currentPage);
            service.show(req, currentPage,type, local1, local2);
            return new ModelAndView("page/notice");
        }if(rs==2){
            Map data=service.detail(noticeid);
            Map map=new HashMap();
            map.put("data",data);
            return new ModelAndView("page/updatenotice",map);
        }
        return  new ModelAndView("page/notice");
    }

}
