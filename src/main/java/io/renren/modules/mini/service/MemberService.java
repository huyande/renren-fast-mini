package io.renren.modules.mini.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.mini.entity.MemberEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-02-25 22:01:17
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<MemberEntity> queryListByCid(Integer cid);

    MemberEntity findMemberByOpenidAndCid(String openid, Integer id);

    int getCountByCid(Integer id);
}

