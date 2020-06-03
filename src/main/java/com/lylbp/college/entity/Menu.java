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
 * 菜单
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("menu")
@ApiModel(value = "Menu对象", description = "菜单")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜单ID")
    @TableId(value = "menu_id", type = IdType.ASSIGN_UUID)
    private String menuId;

    @ApiModelProperty(value = "路由名称")
    @TableField("menu_name")
    private String menuName;

    @ApiModelProperty(value = "上级ID")
    @TableField("menu_pid")
    private String menuPid;

    @ApiModelProperty(value = "前端url")
    @TableField("menu_url")
    private String menuUrl;

    @ApiModelProperty(value = "是否有效")
    @TableField("is_valid")
    @TableLogic
    private Boolean isValid;


    @Override
    protected Serializable pkVal() {
        return this.menuId;
    }

}
