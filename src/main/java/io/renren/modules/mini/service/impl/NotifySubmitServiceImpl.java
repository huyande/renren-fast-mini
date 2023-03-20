package io.renren.modules.mini.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.mini.dao.NotifySubmitDao;
import io.renren.modules.mini.entity.NotifySubmitEntity;
import io.renren.modules.mini.service.NotifySubmitService;


@Service("notifySubmitService")
public class NotifySubmitServiceImpl extends ServiceImpl<NotifySubmitDao, NotifySubmitEntity> implements NotifySubmitService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<NotifySubmitEntity> page = this.page(
                new Query<NotifySubmitEntity>().getPage(params),
                new QueryWrapper<NotifySubmitEntity>()
        );

        return new PageUtils(page);
    }

}