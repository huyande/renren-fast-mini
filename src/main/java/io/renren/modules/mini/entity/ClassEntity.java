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
 * @date 2023-02-19 20:26:55
 */
@Data
@TableName("tb_class")
public class ClassEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 
	 */
	private String openid;
	/**
	 * 班级名称
	 */
	private String name;
	/**
	 * 班级预设人数
	 */
	private Integer presetNumber;
	/**
	 * 年级
	 */
	private String grade;
	/**
	 * 班级码
	 */
	private String code;
	/**
	 * 状态 0 正常 1 删除
	 */
	private Integer status;
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

	@TableField(exist = false)
	private String currentRole;

}
