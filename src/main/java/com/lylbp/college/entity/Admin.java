package com.lylbp.college.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;

import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.util.Date;

import com.lylbp.college.enums.GenderEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 后台管理员
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("admin")
@ApiModel(value = "Admin对象", description = "后台管理员")
public class Admin extends Model<Admin> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "管理员id")
    @TableId(value = "user_id", type = IdType.ASSIGN_UUID)
    private String userId;

    @ApiModelProperty(value = "手机号码")
    @TableField("phone")
    private String phone;

    @ApiModelProperty(value = "用户名")
    @TableField("user_name")
    private String userName;

    @ApiModelProperty(value = "密码")
    @TableField("pwd")
    private String pwd;

    @ApiModelProperty(value = "性别")
    @TableField("gender")
    private GenderEnum gender;

    @ApiModelProperty(value = "账号状态 是否启用。0 ：禁用；1：启用")
    @TableField("account_status")
    private Boolean accountStatus;

    @ApiModelProperty(value = "是否有效")
    @TableField("is_valid")
    @TableLogic
    private Boolean isValid;

    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private Date createTime;

    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

}
