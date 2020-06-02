package com.lylbp.college.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

@Table(name = "permission")
@Data
public class Permission {
    /**
     * 权限id
     */
    @Id
    @Column(name = "permission_id")
    @ApiModelProperty("权限id")
    private String permissionId;

    /**
     * 权限名称
     */
    @Column(name = "permission_name")
    @ApiModelProperty("权限名称")
    private String permissionName;

    /**
     * 权限url
     */
    @Column(name = "permission_url")
    @ApiModelProperty("权限url")
    private String permissionUrl;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    @ApiModelProperty("是否有效")
    private Boolean isValid;
}