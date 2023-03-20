package io.renren.modules.mini.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.mini.annotation.WxLogin;
import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.entity.NotifySubmitEntity;
import io.renren.modules.mini.service.MemberService;
import io.renren.modules.mini.service.NotifySubmitService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.mini.entity.NotifyEntity;
import io.renren.modules.mini.service.NotifyService;
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
@RequestMapping("wx/notify")
public class NotifyController {
    @Autowired
    private NotifyService notifyService;
    @Autowired
    private NotifySubmitService notifySubmitService;
    @Autowired
    private MemberService memberService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @WxLogin
    public R list(HttpServletRequest request,@RequestParam Map<String, Object> params){
        PageUtils page = notifyService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		NotifyEntity notify = notifyService.getById(id);
        List<NotifySubmitEntity> notifySubmitEntities = notifySubmitService.list(new QueryWrapper<NotifySubmitEntity>().eq("n_id", notify.getId()));
        List<Integer> memberList = notifySubmitEntities.stream().map(it -> it.getMId()).collect(Collectors.toList());
        List<MemberEntity> notSubmitList = memberService.list(new QueryWrapper<MemberEntity>()
                .eq("c_id", notify.getCId())
                .notIn("role", "admin", "teacher")
                .notIn(memberList.size()>0?true:false,"id",memberList)
        );
        for(NotifySubmitEntity entity : notifySubmitEntities){
            MemberEntity memberEntity = memberService.getById(entity.getMId());
            entity.setMemberNmae(memberEntity.getName());
        }
        return R.ok().put("notify", notify).put("submit",notifySubmitEntities).put("not_submit",notSubmitList);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @WxLogin
    public R save(HttpServletRequest request, @RequestBody NotifyEntity notify){
        String openid = request.getHeader("_openid");
        notify.setOpenid(openid);
		notifyService.save(notify);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody NotifyEntity notify){
		notifyService.updateById(notify);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		notifyService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
