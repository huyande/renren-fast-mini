package io.renren.modules.xmkj.service.impl;

import io.renren.modules.xmkj.dao.ScriptDao;
import io.renren.modules.xmkj.entity.ScriptEntity;
import io.renren.modules.xmkj.service.ScriptService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;



@Service("scriptService")
public class ScriptServiceImpl extends ServiceImpl<ScriptDao, ScriptEntity> implements ScriptService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String title = (String)params.get("title");
        IPage<ScriptEntity> page = this.page(
                new Query<ScriptEntity>().getPage(params),
                new QueryWrapper<ScriptEntity>().like(StringUtils.isNotBlank(title),"title", title)
        );

        return new PageUtils(page);
    }

}