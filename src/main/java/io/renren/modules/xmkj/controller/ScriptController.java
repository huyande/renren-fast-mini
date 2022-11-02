package io.renren.modules.xmkj.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import io.renren.common.utils.QiWeiBaoUtils;
import io.renren.modules.sys.service.SysConfigService;
import io.renren.modules.xmkj.entity.ScriptEntity;
import io.renren.modules.xmkj.service.ScriptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;


/**
 * 自动化脚本
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 14:40:27
 */
@RestController
@RequestMapping("xmkj/script")
public class ScriptController {
    @Autowired
    private ScriptService scriptService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("xmkj:script:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = scriptService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("xmkj:script:info")
    public R info(@PathVariable("id") Integer id){
		ScriptEntity script = scriptService.getById(id);

        return R.ok().put("script", script);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("xmkj:script:save")
    public R save(@RequestBody ScriptEntity script){
        scriptService.save(script);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("xmkj:script:update")
    public R update(@RequestBody ScriptEntity script){
		scriptService.updateById(script);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("xmkj:script:delete")
    public R delete(@RequestBody Integer[] ids){
		scriptService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }



}
