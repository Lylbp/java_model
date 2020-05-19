package com.dar.road.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Table(name = "tb_user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TbUser {
    /**
     * 用户id
     */
    @Column(name = "user_id")
    @Id
    private String userId;

    /**
     * 用户名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 密码
     */
    private String pwd;
}