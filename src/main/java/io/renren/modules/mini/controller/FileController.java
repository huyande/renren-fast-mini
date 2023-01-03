package io.renren.modules.mini.controller;

import io.renren.common.exception.RRException;
import io.renren.common.utils.R;
import io.renren.modules.mini.annotation.WxLogin;
import io.renren.modules.mini.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/wx/file/")
public class FileController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private FileService fileService;

    @PostMapping("upload")
//    @WxLogin
    public R uploadFile(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            throw new RRException("上传文件不能为空");
        }
        String filename = fileService.uploadFile(file);
        if(filename!=null){
            return R.ok().put("name",filename);
        }else {
            return R.error("上传失败");
        }
    }
    @GetMapping("readImg/{name}")
    public  void readImg(@PathVariable("name") String name, HttpServletResponse response){
        fileService.readImg(name,response);
    }
}
