package io.renren.modules.mini.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.mini.entity.NotifyEntity;

import java.util.Map;

/**
 * 
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-03-19 23:04:35
 */
public interface NotifyService extends IService<NotifyEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

