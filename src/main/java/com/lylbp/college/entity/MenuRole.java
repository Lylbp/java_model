package com.lylbp.college.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "menu_role")
@Data
public class MenuRole {
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
     * 角色id
     */
    @Column(name = "role_id")
    private String roleId;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    private Boolean isValid;
}