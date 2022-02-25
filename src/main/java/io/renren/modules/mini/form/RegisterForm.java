package io.renren.modules.mini.form;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 注册表单
 *
 * @author Mark sunlightcs@gmail.com
 */
@Data
@ApiModel(value = "微信注册表单")
public class RegisterForm {
    @ApiModelProperty(value = "openid")
    @NotBlank(message="openid不能为空")
    private String openid;

    @ApiModelProperty(value = "头像")
    @NotBlank(message="头像不能为空")
    private String avatarUrl;

    @ApiModelProperty(value = "昵称")
    @NotBlank(message="昵称不能为空")
    private String nickName;
}
