package io.renren.modules.mini.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.swagger.models.auth.In;
import lombok.Data;

/**
 * 
 * 
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2023-03-19 23:04:35
 */
@Data
@TableName("tb_notify")
public class NotifyEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private String title;
	/**
	 * 
	 */
	private String content;
	/**
	 * 
	 */
	private Integer cId;
	/**
	 * 
	 */
	private String openid;
	/**
	 * 文件列表
	 */
	private String imgUrls;
	/**
	 * 班委是否可以批改作业 0 不可以 1可以
	 */
	private Integer visibility;

	private Date cutOffTime;//截止时间

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
	private String teacheName;

	@TableField(exist =false)
	private Integer isSubmitCount;//已经提交数量

	@TableField(exist =false)
	private Integer isNotSubmitCount;//未提交数量

}
