package io.renren.modules.mini.service.impl;

import cn.hutool.core.io.FileUtil;
import io.renren.modules.mini.service.FileService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

/**
 * 对文件的操作
 */
@Service("fileService")
public class FileServiceImpl implements FileService {
    @Value("${file.downpath}")
    private String downPath;

    @Override
    public String uploadFile(MultipartFile file) {
        boolean exist = FileUtil.exist(downPath);
        if(!exist){
            FileUtil.mkdir(downPath);
        }
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String uuid = UUID.randomUUID().toString();
        String filename = uuid+suffix;
        File newFile =  new File(downPath+filename);
        try {
            file.transferTo(newFile);
            return filename;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void readImg(String name, HttpServletResponse response) {
        String realPath = downPath+name;
        FileInputStream inputStream = null;
        try {
            inputStream = new FileInputStream(realPath);
            int i = inputStream.available();
            //byte数组用于存放图片字节数据
            byte[] buff = new byte[i];
            inputStream.read(buff);
            //记得关闭输入流
            inputStream.close();
            //设置发送到客户端的响应内容类型
            response.setContentType("image/*");
            OutputStream out = response.getOutputStream();
            out.write(buff);
            //关闭响应输出流
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
