package io.renren.modules.mini.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.mini.entity.ClassEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-02-19 20:26:55
 */
public interface ClassService extends IService<ClassEntity> {

    List<ClassEntity> queryPage(String openid);

    ClassEntity getClassByCode(String classCode);
}

