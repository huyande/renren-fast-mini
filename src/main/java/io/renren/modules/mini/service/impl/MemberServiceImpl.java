package io.renren.modules.mini.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.mini.dao.MemberDao;
import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.service.MemberService;


@Service("memberService")
public class MemberServiceImpl extends ServiceImpl<MemberDao, MemberEntity> implements MemberService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<MemberEntity> page = this.page(
                new Query<MemberEntity>().getPage(params),
                new QueryWrapper<MemberEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<MemberEntity> queryListByCid(Integer cid) {
        return  this.list(new QueryWrapper<MemberEntity>().eq("c_id",cid));
    }

    @Override
    public MemberEntity findMemberByOpenidAndCid(String openid, Integer cid) {
        return this.getOne(new QueryWrapper<MemberEntity>()
                .eq("openid",openid)
                .eq("c_id",cid)
        );
    }

    @Override
    public int getCountByCid(Integer cid) {
        return this.count(new QueryWrapper<MemberEntity>()
                .eq("c_id",cid));
    }

}