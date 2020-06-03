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
 * 菜单与角色关系
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("menu_role")
@ApiModel(value = "MenuRole对象", description = "菜单与角色关系")
public class MenuRole extends Model<MenuRole> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜单与权限id")
    @TableId(value = "menu_permission_id", type = IdType.ASSIGN_UUID)
    private String menuPermissionId;

    @ApiModelProperty(value = "菜单id")
    @TableField("menu_id")
    private String menuId;

    @ApiModelProperty(value = "权限id")
    @TableField("role_id")
    private String roleId;

    @ApiModelProperty(value = "是否有效")
    @TableField("is_valid")
    @TableLogic
    private Boolean isValid;


    @Override
    protected Serializable pkVal() {
        return this.menuPermissionId;
    }

}
