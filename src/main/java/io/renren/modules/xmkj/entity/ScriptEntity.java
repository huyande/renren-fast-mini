package io.renren.modules.xmkj.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 自动化脚本
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-10-27 14:40:27
 */
@Data
@TableName("tb_script")
public class ScriptEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 脚本名称
	 */
	private String title;
	/**
	 * 脚本内容
	 */
	private String content;

	/**
	 * 脚本参数
	 */
	private String params;

	/**
	 * 
	 */
	private Date createDate;

}
