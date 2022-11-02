package io.renren.modules.xmkj.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.xmkj.entity.WechatNumbersEntity;

import java.util.Map;

/**
 * ${comments}
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 20:00:17
 */
public interface WechatNumbersService extends IService<WechatNumbersEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

