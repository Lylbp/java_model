package com.lylbp.college.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.*;

@Table(name = "user_role")
@Data
public class UserRole {
    @Id
    @Column(name = "user_role_id")
    @ApiModelProperty("用户与角色关系id")
    private String userRoleId;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    @ApiModelProperty("用户id")
    private String userId;

    /**
     * 角色id
     */
    @Column(name = "role_id")
    @ApiModelProperty("角色id")
    private String roleId;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    @ApiModelProperty("是否有效")
    private Boolean isValid;
}