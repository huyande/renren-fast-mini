package io.renren.modules.xmkj.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.xmkj.entity.ScriptEntity;

import java.util.Map;

/**
 * 自动化脚本
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 14:40:27
 */
public interface ScriptService extends IService<ScriptEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

