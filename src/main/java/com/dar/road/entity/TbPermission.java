package com.dar.road.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "tb_permission")
@Data
public class TbPermission {
    /**
     * 权限id
     */
    @Column(name = "permission_id")
    @Id
    private String permissionId;

    /**
     * 名称
     */
    private String name;

    /**
     * url
     */
    private String url;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    private Boolean isValid;
}