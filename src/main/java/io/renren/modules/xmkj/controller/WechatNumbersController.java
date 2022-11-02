package io.renren.modules.xmkj.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.xmkj.entity.WechatNumbersEntity;
import io.renren.modules.xmkj.service.WechatNumbersService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * ${comments}
 *
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 20:00:17
 */
@RestController
@RequestMapping("xmkj/wechatnumbers")
public class WechatNumbersController {
    @Autowired
    private WechatNumbersService wechatNumbersService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("xmkj:wechatnumbers:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = wechatNumbersService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("xmkj:wechatnumbers:info")
    public R info(@PathVariable("id") Integer id){
		WechatNumbersEntity wechatNumbers = wechatNumbersService.getById(id);

        return R.ok().put("wechatNumbers", wechatNumbers);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("xmkj:wechatnumbers:save")
    public R save(@RequestBody WechatNumbersEntity wechatNumbers){
		wechatNumbersService.save(wechatNumbers);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("xmkj:wechatnumbers:update")
    public R update(@RequestBody WechatNumbersEntity wechatNumbers){
		wechatNumbersService.updateById(wechatNumbers);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("xmkj:wechatnumbers:delete")
    public R delete(@RequestBody Integer[] ids){
		wechatNumbersService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
