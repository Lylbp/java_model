package com.lylbp.college.core.entity;

import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020-03-28 13:19
 */
@Data
public class ActionLog {
    private String userId;

    private String userName;

    private String descrption;

    private String remoteAddr;

    private String createDate;

    private String requestURI;
}
