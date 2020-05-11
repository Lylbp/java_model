package com.dar.road.entity;

import javax.persistence.*;

@Table(name = "tb_menu_permission")
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
     * 获取菜单与权限id
     *
     * @return menu_permission_id - 菜单与权限id
     */
    public String getMenuPermissionId() {
        return menuPermissionId;
    }

    /**
     * 设置菜单与权限id
     *
     * @param menuPermissionId 菜单与权限id
     */
    public void setMenuPermissionId(String menuPermissionId) {
        this.menuPermissionId = menuPermissionId == null ? null : menuPermissionId.trim();
    }

    /**
     * 获取菜单id
     *
     * @return menu_id - 菜单id
     */
    public String getMenuId() {
        return menuId;
    }

    /**
     * 设置菜单id
     *
     * @param menuId 菜单id
     */
    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    /**
     * 获取权限id
     *
     * @return permission_id - 权限id
     */
    public String getPermissionId() {
        return permissionId;
    }

    /**
     * 设置权限id
     *
     * @param permissionId 权限id
     */
    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId == null ? null : permissionId.trim();
    }
}