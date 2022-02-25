package io.renren.modules.mini.controller;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import io.renren.common.utils.R;
import io.renren.modules.mini.annotation.WxLogin;
import io.renren.modules.mini.config.WxMaConfiguration;
import io.renren.modules.mini.entity.WxUserEntity;
import io.renren.modules.mini.form.RegisterForm;
import io.renren.modules.mini.service.WxUserService;
import io.renren.modules.mini.utils.JsonUtils;
import me.chanjar.weixin.common.error.WxErrorException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 微信小程序用户接口
 *
 * @author <a href="https://github.com/binarywang">Binary Wang</a>
 */
@RestController
@RequestMapping("/wx/user/{appid}")
public class WxMaUserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private WxUserService wxUserService;

    /**
     * 登陆接口
     */
    @GetMapping("/login")
    public R login(@PathVariable String appid, String code) {
        if (StringUtils.isBlank(code)) {
            return R.error("empty jscode");
        }

        final WxMaService wxService = WxMaConfiguration.getMaService(appid);

        try {
            WxMaJscode2SessionResult session = wxService.getUserService().getSessionInfo(code);
            this.logger.info(session.getSessionKey());
            this.logger.info(session.getOpenid());
            //TODO 可以增加自己的逻辑，关联业务相关数据
            //查询数据库是否有此用户信息
            WxUserEntity wxUser = wxUserService.findWxUserByOpenid(session.getOpenid());
            Map<String,Object> map = new HashMap<>();
            map.put("is_has",wxUser==null?false:true);
            map.put("session",session);
            map.put("userInfo",wxUser);

            return R.ok(map);
        } catch (WxErrorException e) {
            this.logger.error(e.getMessage(), e);
            return R.error();
        }
    }

    /**
     * <pre>
     * 获取用户信息接口
     * </pre>
     */
    @GetMapping("/info")
    public String info(@PathVariable String appid, String sessionKey,
                       String signature, String rawData, String encryptedData, String iv) {
        final WxMaService wxService = WxMaConfiguration.getMaService(appid);

        // 用户信息校验
        if (!wxService.getUserService().checkUserInfo(sessionKey, rawData, signature)) {
            return "user check failed";
        }

        // 解密用户信息
        WxMaUserInfo userInfo = wxService.getUserService().getUserInfo(sessionKey, encryptedData, iv);

        return JsonUtils.toJson(userInfo);
    }

    /**
     * <pre>
     * 获取用户绑定手机号信息
     * </pre>
     */
    @GetMapping("/phone")
    public String phone(@PathVariable String appid, String sessionKey, String signature,
                        String rawData, String encryptedData, String iv) {
        final WxMaService wxService = WxMaConfiguration.getMaService(appid);

        // 用户信息校验
        if (!wxService.getUserService().checkUserInfo(sessionKey, rawData, signature)) {
            return "user check failed";
        }

        // 解密
        WxMaPhoneNumberInfo phoneNoInfo = wxService.getUserService().getPhoneNoInfo(sessionKey, encryptedData, iv);

        return JsonUtils.toJson(phoneNoInfo);
    }

    @PostMapping("saveUser")
    public R saveUser(RegisterForm form){
        WxUserEntity wxUser = new WxUserEntity();
        wxUser.setOpenid(form.getOpenid());
        wxUser.setAvatarUrl(form.getAvatarUrl());
        wxUser.setNickName(form.getNickName());
        wxUserService.save(wxUser);
        return R.ok();
    }

    @WxLogin
    @GetMapping("test")
    public R test(){
        return R.ok();
    }

}
