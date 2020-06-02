package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author weiwenbin
 * @Date 2020/5/22 下午5:01
 */
@Data
public class AdminLoginDTO {
    @ApiModelProperty(value = "账号", required = true)
    @NotBlank
    private String loginName;

    @ApiModelProperty(value = "密码",  required = true)
    @NotBlank
    private String pwd;
}
