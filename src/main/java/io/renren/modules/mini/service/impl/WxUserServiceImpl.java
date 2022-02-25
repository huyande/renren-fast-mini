package io.renren.modules.mini.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.mini.dao.WxUserDao;
import io.renren.modules.mini.entity.WxUserEntity;
import io.renren.modules.mini.service.WxUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("wxUserService")
public class WxUserServiceImpl extends ServiceImpl<WxUserDao,WxUserEntity> implements WxUserService {

    @Override
    public WxUserEntity findWxUserByOpenid(String openid) {
        QueryWrapper<WxUserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("openid",openid);
        return baseMapper.selectOne(queryWrapper);
    }
}
