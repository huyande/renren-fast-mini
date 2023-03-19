package io.renren.modules.mini.service.impl;

import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.mini.dao.ClassDao;
import io.renren.modules.mini.entity.ClassEntity;
import io.renren.modules.mini.service.ClassService;


@Service("classService")
public class ClassServiceImpl extends ServiceImpl<ClassDao, ClassEntity> implements ClassService {

    @Autowired
    private MemberService memberService;

    @Autowired
    private ClassService classService;

    @Override
    public List<ClassEntity> queryPage(String openid) {
        List<MemberEntity> memberEntities = memberService.list(new QueryWrapper<MemberEntity>().select("c_id","role").eq("openid", openid));
        List<Integer> cids = memberEntities.stream().map(it -> it.getCId()).collect(Collectors.toList());
        if(cids.size()>0){
            List<ClassEntity> list = this.list(new QueryWrapper<ClassEntity>()
//                .eq("openid", openid)
                            .in("id",cids)
                            .eq("status", 0)
            );
            for(ClassEntity entity : list){
                String role = memberEntities.stream().filter(memberEntity -> memberEntity.getCId() == entity.getId()).findFirst().get().getRole();
                entity.setCurrentRole(role);
            }
            return list;
        }else {
            return null;
        }
    }

    @Override
    public ClassEntity getClassByCode(String classCode) {
        ClassEntity entity = classService.getOne(new QueryWrapper<ClassEntity>()
                .eq("code", classCode)
                .eq("status",0)
        );
        return entity;
    }
}