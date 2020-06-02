package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author wangyu
 * @Date 2020/5/27 14:37
 */
@Data
public class UserRegisterDTO {

    @ApiModelProperty(value = "用户注册id")
    private String registerId;

    @ApiModelProperty(value = "用户姓名",required = true)
    @NotBlank
    private String userName;

    @ApiModelProperty(value = "用户手机号",required = true)
    @NotBlank
    private String phone;

    @ApiModelProperty(value = "用户密码",required = true)
    @NotBlank
    private String passWd;

    @ApiModelProperty(value = "性别",required = true)
    @NotBlank
    private String gender;

    @ApiModelProperty(value = "身份证号",required = true)
    @NotBlank
    private String cardId;

    @ApiModelProperty(value = "手机验证码",required = true)
    @NotBlank
    private String vCode;

}
