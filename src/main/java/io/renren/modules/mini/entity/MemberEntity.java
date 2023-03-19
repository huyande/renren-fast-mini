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
 * @date 2023-02-25 22:01:17
 */
@Data
@TableName("tb_member")
public class MemberEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 班级id
	 */
	private Integer cId;
	/**
	 * openid
	 */
	private String openid;
	/**
	 * 
	 */
	private String name;
	/**
	 * 角色 admin、teacher、student、committee（班委）
	 */
	private String role;
	private String phone;
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

}
