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
 * 角色与权限关系
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("role_permission")
@ApiModel(value = "RolePermission对象", description = "角色与权限关系")
public class RolePermission extends Model<RolePermission> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色权限id")
    @TableId(value = "role_permission_id", type = IdType.ASSIGN_UUID)
    private String rolePermissionId;

    @ApiModelProperty(value = "角色id")
    @TableField("role_id")
    private String roleId;

    @ApiModelProperty(value = "权限id")
    @TableField("permission_id")
    private String permissionId;

    @ApiModelProperty(value = "是否有效")
    @TableField("is_valid")
    @TableLogic
    private Boolean isValid;


    @Override
    protected Serializable pkVal() {
        return this.rolePermissionId;
    }

}
