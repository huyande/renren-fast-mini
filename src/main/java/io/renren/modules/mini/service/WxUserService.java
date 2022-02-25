package io.renren.modules.mini.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.mini.entity.WxUserEntity;

public interface WxUserService extends IService<WxUserEntity> {
    WxUserEntity findWxUserByOpenid(String openid);
}
