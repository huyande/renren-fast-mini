package io.renren.modules.xmkj.controller;

import io.renren.common.utils.QiWeiBaoUtils;
import io.renren.common.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 企微宝
 */
@RestController
@RequestMapping("xmkj/qwb")
public class QwbController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @RequestMapping(value="/cb", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public R qwbCallback(@RequestBody String body){
        String aesKey = "x6J0XGmnM4Pd3KCShjufQYqNRUzDErZ1";
        String iv = aesKey.substring(0,16);
        try {
            String decrypt = QiWeiBaoUtils.decrypt(body, aesKey, iv);
            logger.debug("解码数据："+decrypt);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return R.ok();
    }
}
