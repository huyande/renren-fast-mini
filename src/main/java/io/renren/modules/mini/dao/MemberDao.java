package io.renren.modules.mini.dao;

import io.renren.modules.mini.entity.MemberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-02-25 22:01:17
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {
	
}
