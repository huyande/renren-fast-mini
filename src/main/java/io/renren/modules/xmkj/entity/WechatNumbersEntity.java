package io.renren.modules.xmkj.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import lombok.Data;

/**
 * ${comments}
 * 
 * @author huyande
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 20:00:17
 */
@Data
@TableName("wechat_numbers")
public class WechatNumbersEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * $column.comments
	 */
	@TableId
	private Integer id;
	/**
	 * $column.comments
	 */
	private String phone;
	/**
	 * $column.comments
	 */
	private String gwNumber;
	/**
	 * $column.comments
	 */
	private String gwNickname;
	/**
	 * $column.comments
	 */
	private String gwQrCode;
	/**
	 * $column.comments
	 */
	private String qwNumber;
	/**
	 * $column.comments
	 */
	private String qwNickname;
	/**
	 * $column.comments
	 */
	private String qwQrCode;
	/**
	 * $column.comments
	 */
	@TableField("'createdAt'")
	private Date createdAt;
	/**
	 * $column.comments
	 */
	@TableField("'updatedAt'")
	private Date updatedAt;

}
