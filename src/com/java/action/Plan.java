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
@RequestMapping("back/Plan")
public class Plan extends FileUpload{
    @Autowired
    PlanService service;

    @RequestMapping(value = "updatePlan",method = RequestMethod.POST)
    public String updatePlan(HttpServletRequest req,String Planid,String name,String docnum,String date, String local1,String local2,String local3,String address,@RequestParam("file") MultipartFile file,String state){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        Map map=fileUpload(req,file);
        String filepath= (String) map.get("filePath");
        String filename= (String) map.get("fileName");
        int rs=service.updatePlan(Planid,userid,name,docnum,date,local1,local2,local3,address,filepath,filename,state);
        if (rs==1){
            System.out.println("数据修改成功");
            return "redirect:/back/Plan/show";
        }
        return "redirect:/page/updatePlan";
    }

    @RequestMapping(value = "addPlan",method = RequestMethod.POST)
    public String addPlan(HttpServletRequest req,String name,String docnum,String date,
                                String local1,String local2,String local3,String address,@RequestParam("file") MultipartFile file,String state){
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        Map map=fileUpload(req,file);
        String filepath= (String) map.get("filePath");
        String filename= (String) map.get("fileName");
        int rs=service.addPlan(userid,name,docnum,date,local1,local2,local3,address,filepath,filename,state);
        if (rs==1){
            System.out.println("数据录入成功");
            return "redirect:/page/home.jsp";
        }
        return null;
    }

    @RequestMapping("/show")
    public String show(HttpServletRequest req,String pageTo,String local1,String local2,String page){
        ServletContext sc=req.getSession().getServletContext();
        sc.removeAttribute("Plan");
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
        service.show(req,currentPage,local1,local2);
        return "page/Plan";
    }

    @RequestMapping("/detail")
    public ModelAndView detail(String Planid){
        Map data=service.detail(Planid);
        Map map=new HashMap();
        map.put("data",data);
        int state= (int) data.get("stateid");
        if(state==5) {
            return new ModelAndView("/page/updatePlan", map);
        }
        if(state==1) {
            return new ModelAndView("/page/planDetail", map);
        }
        if(state==2) {
            return new ModelAndView("/page/planDetail01", map);
        }
        if (state==3){
            return new ModelAndView("/page/planDetail02", map);
        }
        if (state==4){
            return new ModelAndView("/page/planDetail03", map);
        }
        return  null;
    }

    @RequestMapping(value = "Plandetail",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView detail(HttpServletRequest req,String Planid,String state){
        int rs=service.detailPlan(Planid,state);
        if (rs==1) {
            System.out.println("数据修改成功");
            int currentPage = 1;
            String local1 = null;
            String local2 = null;
            req.setAttribute("pageNum", currentPage);
            service.show(req, currentPage, local1, local2);
            return new ModelAndView("page/Plan");
        }if(rs==2){
            Map data=service.detail(Planid);
            Map map=new HashMap();
            map.put("data",data);
            return new ModelAndView("page/updatePlan",map);
        }
        return  new ModelAndView("page/Plan");
    }

}
