package io.renren.modules.xmkj.controller;

import com.alibaba.fastjson.JSON;
import io.renren.common.utils.R;
import io.renren.modules.app.form.RegisterForm;
import io.renren.modules.sys.service.SysConfigService;
import io.renren.modules.xmkj.dto.ExecScriptDto;
import io.renren.modules.xmkj.dto.ResultDto;
import io.renren.modules.xmkj.entity.ScriptEntity;
import io.renren.modules.xmkj.handler.WebSocketHandler;
import io.renren.modules.xmkj.service.ScriptService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/xmkj/ws")
@Slf4j
public class SocketController {

    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private ScriptService scriptService;

    @GetMapping("/send")
    public R send(@RequestParam String msg,@RequestParam String userId) throws IOException {
        boolean sendInfo = WebSocketHandler.sendInfo(msg, userId);
        return R.ok().put("data",sendInfo);
    }

    @PostMapping("/exec")
    public R exec(@RequestBody ExecScriptDto execScriptDto) throws IOException{
        ResultDto res = new ResultDto();
        res.setEvent("exec");
//        res.setData(execScriptDto.getScript());
        res.setFromUser("server");//来自服务器
        res.setToUser(execScriptDto.getUserId());
        String autojs_template = sysConfigService.getValue("autojs_template");
        ScriptEntity scriptEntity = scriptService.getById(execScriptDto.getScriptId());
        String script = autojs_template.replace("{{main_js}}", scriptEntity.getContent());
        res.setData(script);
        boolean sendInfo = WebSocketHandler.sendInfo(JSON.toJSONString(res),execScriptDto.getUserId());
        return R.ok().put("data",sendInfo);
    }
}