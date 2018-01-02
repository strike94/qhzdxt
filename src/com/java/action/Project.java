package com.java.action;

import com.java.beans.User;
import com.java.service.FileUpload;
import com.java.service.ProjectService;
import org.apache.taglibs.standard.lang.jstl.test.beans.Factory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("project")
public class Project extends FileUpload{
    @Autowired
    ProjectService service;

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public ModelAndView addProject(HttpServletRequest req,String name,String date,String accessdate,String local1,String local2,String local3,String address,String type,String docnum,@RequestParam("file") MultipartFile file){
        String local=local1+local2+local3;
        HttpSession session=req.getSession();
        User user= (User) session.getAttribute("user");
        int userid=user.getUserid();
        Map map=fileUpload(req,file);
        String filepath= (String) map.get("filePath");
        String filename= (String) map.get("fileName");
        int rs=service.addProject(userid,name,date,accessdate,local,address,type,docnum,filepath,filename);
        if (rs==1){
            System.out.println("数据录入成功");
            return new ModelAndView(new RedirectView("http://localhost/qhzdxt/page/home.jsp"));
        }
        return null;
    }
}
