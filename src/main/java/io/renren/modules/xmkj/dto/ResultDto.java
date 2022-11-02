package io.renren.modules.xmkj.dto;

import lombok.Data;

/**
 * 向客户端返回结果
 */
@Data
public class ResultDto {
    private String event;//事件类型
    private String msg;//消息
    private String Data;//发送数据
    private String fromUser;//来自哪里
    private String toUser;//发给谁
}
