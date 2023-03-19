package io.renren.modules.mini.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.renren.modules.mini.annotation.WxLogin;
import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.form.ClassForm;
import io.renren.modules.mini.service.MemberService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.mini.entity.ClassEntity;
import io.renren.modules.mini.service.ClassService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.http.HttpServletRequest;


/**
 * 
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-02-19 20:26:55
 */
@RestController
@RequestMapping("wx/class")
public class ClassController {
    @Autowired
    private ClassService classService;

    @Autowired
    private MemberService memberService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @WxLogin
    public R list(HttpServletRequest request){
        String openid = request.getHeader("_openid");
        List<ClassEntity> list = classService.queryPage(openid);

        return R.ok().put("list", list);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		ClassEntity cls = classService.getById(id);

        return R.ok().put("class", cls);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @WxLogin
    public R save(@RequestBody ClassForm cls,HttpServletRequest request){
        String openid = request.getHeader("_openid");
        if(cls.getId()==null){
            ClassEntity entity = new ClassEntity();
            entity.setName(cls.getClassName());
            entity.setPresetNumber(cls.getPresetNumber());
            entity.setGrade(cls.getGrade());
            entity.setOpenid(openid);
            while (true){
                String code = RandomUtil.randomNumbers(6);
                ClassEntity classEntity = classService.getOne(new QueryWrapper<ClassEntity>().eq("code", code));
                if(classEntity==null){
                    entity.setCode(code);
                    break;
                }
            }
            classService.save(entity);
            //成员表中加入管理员数据
            MemberEntity memberEntity = new MemberEntity();
            memberEntity.setRole("admin");
            memberEntity.setCId(entity.getId());
            memberEntity.setOpenid(openid);
            memberEntity.setName(cls.getTeacherName());
            memberEntity.setPhone(cls.getPhone());
            memberService.save(memberEntity);
            return R.ok().put("data",entity);
        }else {
            ClassEntity entity = classService.getById(cls.getId());
            entity.setName(cls.getClassName());
            entity.setPresetNumber(cls.getPresetNumber());
            entity.setGrade(cls.getGrade());
            classService.updateById(entity);
            return R.ok().put("data",entity);
        }
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody ClassEntity cls){
		classService.updateById(cls);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete/{id}")
    @WxLogin
    public R delete(@PathVariable("id") Integer id){
        ClassEntity entity = classService.getById(id);
        entity.setStatus(-1);
        classService.updateById(entity);
        return R.ok();
    }

}
