package com.dar.road.entity;

import javax.persistence.*;

@Table(name = "tb_menu")
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
     * @return menu_id
     */
    public String getMenuId() {
        return menuId;
    }

    /**
     * @param menuId
     */
    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    /**
     * 获取前端url
     *
     * @return url - 前端url
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置前端url
     *
     * @param url 前端url
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    /**
     * 获取上级ID
     *
     * @return pid - 上级ID
     */
    public String getPid() {
        return pid;
    }

    /**
     * 设置上级ID
     *
     * @param pid 上级ID
     */
    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }
}