package com.lylbp.college.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

@Table(name = "role")
@Data
public class Role {
    /**
     * 角色id
     */
    @Id
    @Column(name = "role_id")
    @ApiModelProperty("角色id")
    private String roleId;

    /**
     * 角色名称
     */
    @Column(name = "role_name")
    @ApiModelProperty("角色名称")
    private String roleName;

    /**
     * 角色描述
     */
    @Column(name = "role_description")
    @ApiModelProperty("角色描述")
    private String roleDescription;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    @ApiModelProperty("是否有效")
    private Boolean isValid;
}