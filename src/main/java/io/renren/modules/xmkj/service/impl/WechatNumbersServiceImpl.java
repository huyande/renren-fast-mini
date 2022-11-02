package io.renren.modules.xmkj.service.impl;

import io.renren.datasource.annotation.DataSource;
import io.renren.modules.xmkj.dao.WechatNumbersDao;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.xmkj.entity.WechatNumbersEntity;
import io.renren.modules.xmkj.service.WechatNumbersService;

@DataSource("slave1")
@Service("wechatNumbersService")
public class WechatNumbersServiceImpl extends ServiceImpl<WechatNumbersDao, WechatNumbersEntity> implements WechatNumbersService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String phone = (String)params.get("phone");
        IPage<WechatNumbersEntity> page = this.page(
                new Query<WechatNumbersEntity>().getPage(params),
                new QueryWrapper<WechatNumbersEntity>().like(StringUtils.isNotBlank(phone),"phone", phone)
        );

        return new PageUtils(page);
    }

}