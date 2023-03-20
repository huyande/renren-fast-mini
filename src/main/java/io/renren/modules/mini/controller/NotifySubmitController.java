package io.renren.modules.mini.controller;

import java.util.Arrays;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.mini.annotation.WxLogin;
import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.entity.NotifyEntity;
import io.renren.modules.mini.service.MemberService;
import io.renren.modules.mini.service.NotifyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.mini.entity.NotifySubmitEntity;
import io.renren.modules.mini.service.NotifySubmitService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.http.HttpServletRequest;


/**
 * 
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-03-19 23:04:35
 */
@RestController
@RequestMapping("wx/notifysubmit")
public class NotifySubmitController {
    @Autowired
    private NotifySubmitService notifySubmitService;

    @Autowired
    private NotifyService notifyService;

    @Autowired
    private MemberService memberService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = notifySubmitService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @WxLogin
    public R info(HttpServletRequest request, @PathVariable("id") Integer id){
        String openid = request.getHeader("_openid");
        NotifyEntity notifyEntity = notifyService.getById(id);
        MemberEntity memberEntity = memberService.getOne(new QueryWrapper<MemberEntity>().eq("c_id", notifyEntity.getCId()).eq("openid", openid));
        NotifySubmitEntity notifySubmit = notifySubmitService.getOne(new QueryWrapper<NotifySubmitEntity>().eq("n_id",id).eq("m_id",memberEntity.getId()));
        return R.ok().put("notifySubmit", notifySubmit).put("notify",notifyEntity);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @WxLogin
    public R save(HttpServletRequest request, @RequestBody NotifySubmitEntity notifySubmit){
        String openid = request.getHeader("_openid");
        MemberEntity memberEntity = memberService.getOne(new QueryWrapper<MemberEntity>().eq("c_id", notifySubmit.getCId()).eq("openid", openid));
        notifySubmit.setMId(memberEntity.getId());
        notifySubmit.setOpenid(openid);
		notifySubmitService.save(notifySubmit);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody NotifySubmitEntity notifySubmit){
        NotifySubmitEntity entity = new NotifySubmitEntity();
        entity.setComment(notifySubmit.getComment());
        entity.setId(notifySubmit.getId());
        entity.setGrading(notifySubmit.getGrading());
		notifySubmitService.updateById(entity);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/updatecomment/{id}")
    public R updateComment(@PathVariable("id") Integer id,@RequestParam String comment){
        NotifySubmitEntity entity = notifySubmitService.getById(id);
        entity.setComment(comment);
        notifySubmitService.updateById(entity);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/updategrading/{id}")
    public R updateComment(@PathVariable("id") Integer id,@RequestParam Integer grading){
        NotifySubmitEntity entity = notifySubmitService.getById(id);
        entity.setGrading(grading);
        notifySubmitService.updateById(entity);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		notifySubmitService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
