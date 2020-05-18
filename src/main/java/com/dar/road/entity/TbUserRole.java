package com.dar.road.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "tb_user_role")
@Data
public class TbUserRole {
    @Column(name = "user_role_id")
    @Id
    private String userRoleId;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private String userId;

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