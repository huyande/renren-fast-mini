package io.renren.modules.mini.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 微信用户表
 */
@Data
@TableName("tb_wxuser")
public class WxUserEntity implements Serializable {
    private static final long serialVersionUID = 4255155763865544756L;
    /**
     * 用户id
     */
    @TableId
    private Long userId;
    /**
     * 微信用户唯一标识
     */
    private String openid;
    /**
     * 微信用户头像
     */
    private String avatarUrl;
    /**
     * 微信用户昵称
     */
    private String nickName;

}
