package com.dar.road.entity;

import lombok.Data;

import javax.persistence.*;

@Table(name = "tb_menu")
@Data
public class TbMenu {
    @Column(name = "menu_id")
    @Id
    private String menuId;

    /**
     * 前端url
     */
    private String url;

    /**
     * 上级ID
     */
    private String pid;

    /**
     * 是否有效
     */
    @Column(name = "is_valid")
    private Boolean isValid;
}