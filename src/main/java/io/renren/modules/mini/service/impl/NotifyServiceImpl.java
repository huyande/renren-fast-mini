package io.renren.modules.mini.service.impl;

import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.entity.NotifySubmitEntity;
import io.renren.modules.mini.service.ClassService;
import io.renren.modules.mini.service.MemberService;
import io.renren.modules.mini.service.NotifySubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.mini.dao.NotifyDao;
import io.renren.modules.mini.entity.NotifyEntity;
import io.renren.modules.mini.service.NotifyService;


@Service("notifyService")
public class NotifyServiceImpl extends ServiceImpl<NotifyDao, NotifyEntity> implements NotifyService {

    @Autowired
    private MemberService memberService;

    @Autowired
    private NotifySubmitService notifySubmitService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Integer  cid = Integer.parseInt((String) params.get("cid"));
        IPage<NotifyEntity> page = this.page(
                new Query<NotifyEntity>().getPage(params),
                new QueryWrapper<NotifyEntity>()
                .eq("c_id",cid)
                .orderByDesc("create_at")
        );
        int count = memberService.count(new QueryWrapper<MemberEntity>()
                .eq("c_id", cid)
                .notIn("role", "admin", "teacher")
        );//班级加入数量
        //遍历查询教师名称
        for(NotifyEntity notifyEntity : page.getRecords()){
            MemberEntity memberEntity = memberService.getOne(new QueryWrapper<MemberEntity>()
                    .eq("c_id", cid)
                    .eq("openid", notifyEntity.getOpenid())
            );
            notifyEntity.setTeacheName(memberEntity.getName());
            int count_sub = notifySubmitService.count(new QueryWrapper<NotifySubmitEntity>().eq("n_id", notifyEntity.getId()));//已经提交的数量
            notifyEntity.setIsNotSubmitCount(count-count_sub);
            notifyEntity.setIsSubmitCount(count_sub);
        }
        return new PageUtils(page);
    }

}