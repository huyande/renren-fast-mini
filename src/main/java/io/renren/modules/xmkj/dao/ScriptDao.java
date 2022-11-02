package io.renren.modules.xmkj.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.xmkj.entity.ScriptEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 自动化脚本
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 14:40:27
 */
@Mapper
public interface ScriptDao extends BaseMapper<ScriptEntity> {
	
}
