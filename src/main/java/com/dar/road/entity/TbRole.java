package com.dar.road.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "tb_role")
@Data
public class TbRole {
    /**
     * 角色id
     */
    @Column(name = "role_id")
    @Id
    private String roleId;

    /**
     * 角色名称
     */
    @Column(name = "role_name")
    private String roleName;


    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    private Boolean isValid;
}