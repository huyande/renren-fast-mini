package io.renren.modules.xmkj.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class ExecScriptDto {
    private String userId;
    private String script;
    private Integer scriptId;
}
