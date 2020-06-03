package com.lylbp.college.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 权限
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("permission")
@ApiModel(value = "Permission对象", description = "权限")
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "权限id")
    @TableId(value = "permission_id", type = IdType.ASSIGN_UUID)
    private String permissionId;

    @ApiModelProperty(value = "名称")
    @TableField("permission_name")
    private String permissionName;

    @ApiModelProperty(value = "url")
    @TableField("permission_url")
    private String permissionUrl;

    @ApiModelProperty(value = "是否有效")
    @TableField("is_valid")
    @TableLogic
    private Boolean isValid;


    @Override
    protected Serializable pkVal() {
        return this.permissionId;
    }

}
