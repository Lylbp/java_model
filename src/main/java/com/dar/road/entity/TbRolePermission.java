package com.dar.road.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "tb_role_permission")
@Data
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
     * 是否有效
     */
    @Column(name = "is_valid")
    private Boolean isValid;
}