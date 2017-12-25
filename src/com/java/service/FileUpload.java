package com.java.service;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class FileUpload {
    private String filePath;
    public String fileUpload(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                filePath = req.getSession().getServletContext().getRealPath("/") + "uploadfiles/temp"
                        + file.getOriginalFilename();
                // 转存文件
                file.transferTo(new File(filePath));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return filePath;
    }
}
