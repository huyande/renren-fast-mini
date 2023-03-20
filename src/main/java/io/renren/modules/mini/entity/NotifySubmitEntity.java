package io.renren.modules.mini.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * 
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-03-19 23:04:35
 */
@Data
@TableName("tb_notify_submit")
public class NotifySubmitEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 发布任务的主键
	 */
	private Integer nId;
	/**
	 * 成员表的主键
	 */
	private Integer mId;
	/**
	 * 班级表的主键
	 */
	private Integer cId;
	/**
	 * 当提交类型是文本时 此字段有值
	 */
	private String openid;
	/**
	 * 当提交类型是图片时，此字段有值，此字段存储一个字符串数组
	 */
	private String imgUrls;
	/**
	 * 
	 */
	private String content;
	/**
	 * 设置批阅 100、90、80、70、60、59（小于60分）
	 */
	private Integer grading;
	/**
	 * 
	 */
	private String comment;
	/**
	 * 
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createAt;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date updateAt;

	@TableField(exist =false)
	private String memberNmae;//成员名称
}
