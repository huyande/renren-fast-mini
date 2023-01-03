package io.renren.modules.mini.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

public interface FileService {
    String uploadFile(MultipartFile file);

    void readImg(String name, HttpServletResponse response);
}
