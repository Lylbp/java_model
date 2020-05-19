package com.dar.road.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "tb_menu_permission")
@Data
public class TbMenuPermission {
    /**
     * 菜单与权限id
     */
    @Column(name = "menu_permission_id")
    @Id
    private String menuPermissionId;

    /**
     * 菜单id
     */
    @Column(name = "menu_id")
    private String menuId;

    /**
     * 权限id
     */
    @Column(name = "permission_id")
    private String permissionId;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    private Boolean isValid;
}