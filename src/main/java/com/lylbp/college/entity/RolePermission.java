package com.lylbp.college.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

@Table(name = "role_permission")
@Data
public class RolePermission {
    /**
     * 角色与权限关系id
     */
    @Id
    @Column(name = "role_permission_id")
    @ApiModelProperty("角色与权限关系id")
    private String rolePermissionId;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    @ApiModelProperty("角色id")
    private String roleId;

    /**
     * 权限id
     */
    @Column(name = "permission_id")
    @ApiModelProperty("权限id")
    private String permissionId;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    @ApiModelProperty("是否有效")
    private Boolean isValid;
}