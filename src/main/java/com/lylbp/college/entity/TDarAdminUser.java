package com.lylbp.college.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;
import javax.persistence.*;

@Table(name = "admin_user")
@Data
public class TDarAdminUser {
    @Id
    @Column(name = "user_id")
    @ApiModelProperty("用户id")
    private String userId;

    @Column(name = "user_name")
    @ApiModelProperty("用户名")
    private String userName;

    @ApiModelProperty("密码")
    private String passwd;

    @ApiModelProperty("账号")
    private String phone;

    @Column(name = "account_status")
    @ApiModelProperty("账号状态 是否启用 0:禁用；1:启用")
    private Boolean accountStatus;

    @ApiModelProperty("是否有效 1:有效 0:无效")
    @Column(name = "is_valid")
    private Boolean isValid;

    @Column(name = "create_time")
    @ApiModelProperty("添加时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    private Date createTime;
}