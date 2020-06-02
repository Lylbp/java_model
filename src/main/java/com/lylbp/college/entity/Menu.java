package com.lylbp.college.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

@Table(name = "menu")
@Data
public class Menu {
    @Id
    @Column(name = "menu_id")
    @ApiModelProperty("菜单id")
    private String menuId;

    /**
     * 菜单名称
     */
    @Column(name = "menu_name")
    @ApiModelProperty("菜单名称")
    private String menuName;

    /**
     * 菜单url
     */
    @Column(name = "menu_url")
    @ApiModelProperty("菜单url")
    private String menuUrl;

    /**
     * 上级ID
     */
    @Column(name = "menu_pid")
    @ApiModelProperty("上级ID")
    private String menuPid;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    @ApiModelProperty("是否有效")
    private Boolean isValid;
}