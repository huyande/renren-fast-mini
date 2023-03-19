package io.renren.modules.mini.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.mini.annotation.WxLogin;
import io.renren.modules.mini.entity.ClassEntity;
import io.renren.modules.mini.form.MemberForm;
import io.renren.modules.mini.service.ClassService;
import io.renren.modules.mini.service.WxUserService;
import io.swagger.models.auth.In;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.mini.entity.MemberEntity;
import io.renren.modules.mini.service.MemberService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.http.HttpServletRequest;


/**
 * 
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-02-25 22:01:17
 */
@RestController
@RequestMapping("wx/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @Autowired
    private ClassService classService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @WxLogin
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = memberService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 根据班级id查询成员列表
     * @param cid
     * @return
     */
    @RequestMapping("/listByCid")
    @WxLogin
    public R listByCid(@RequestParam Integer cid){
        if(cid==null){
            return  R.error("参数异常");
        }
        List<MemberEntity> list =  memberService.queryListByCid(cid);
        return R.ok().put("data", list);
    }


    /**
     * 信息
     */
    @RequestMapping("/info")
    @WxLogin
    public R info(HttpServletRequest request,@RequestParam Integer cid){
        String openid = request.getHeader("_openid");
		MemberEntity member = memberService.getOne(new QueryWrapper<MemberEntity>().eq("openid",openid).eq("c_id",cid));
        ClassEntity classEntity = classService.getById(cid);
        return R.ok().put("member", member).put("cls",classEntity);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @WxLogin
    public R save(HttpServletRequest request,@RequestBody MemberForm memberForm){
        String openid = request.getHeader("_openid");
        ClassEntity classEntity = classService.getClassByCode(memberForm.getClassCode());
        if(classEntity!=null){
            MemberEntity member =memberService.findMemberByOpenidAndCid(openid,classEntity.getId());
            int memberCount = memberService.getCountByCid(classEntity.getId());
            if(classEntity.getPresetNumber()>memberCount-1){
                if(member==null){
                    MemberEntity memberEntity = new MemberEntity();
                    memberEntity.setName(memberForm.getName());
                    memberEntity.setOpenid(openid);
                    memberEntity.setRole(memberForm.getRole());
                    memberEntity.setCId(classEntity.getId());
                    memberEntity.setPhone(memberForm.getPhone());
                    memberService.save(memberEntity);
                    return R.ok();
                }else {
                    return R.error(-2,"您已经加入此班级");
                }
            }else {
                return R.error(-3,"加入班级人数已达最大人数");
            }

        }else {
            return R.error(-1,"无此班级，请检查班级码是否正确");
        }
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody MemberEntity member){
		memberService.updateById(member);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		memberService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
