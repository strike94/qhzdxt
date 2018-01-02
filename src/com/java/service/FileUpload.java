package com.java.service;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class FileUpload {
    private String filePath;
    private String fileName;
    public Map fileUpload(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
        // 判断文件是否为空
        Map map=new HashMap();
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                filePath = req.getSession().getServletContext().getRealPath("/") + "uploadfiles\\temp\\"
                        + file.getOriginalFilename();
                // 转存文件
                file.transferTo(new File(filePath));
                fileName=file.getOriginalFilename();
            } catch (Exception e) {
                e.printStackTrace();
            }

            map.put("filePath",filePath);
            map.put("fileName",fileName);
        }
        return map;
    }
}
