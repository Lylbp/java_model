package com.dar.road.entity;

import javax.persistence.*;

@Table(name = "tb_role_permission")
public class TbRolePermission {
    /**
     * id
     */
    @Column(name = "role_permission_id")
    @Id
    private String rolePermissionId;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    private String roleId;

    /**
     * 权限id
     */
    @Column(name = "permission_id")
    private String permissionId;

    /**
     * 获取id
     *
     * @return role_permission_id - id
     */
    public String getRolePermissionId() {
        return rolePermissionId;
    }

    /**
     * 设置id
     *
     * @param rolePermissionId id
     */
    public void setRolePermissionId(String rolePermissionId) {
        this.rolePermissionId = rolePermissionId == null ? null : rolePermissionId.trim();
    }

    /**
     * 获取角色id
     *
     * @return role_id - 角色id
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * 设置角色id
     *
     * @param roleId 角色id
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
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