package com.lylbp.college.DTO;

import com.lylbp.college.core.utils.RegexUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * @Author weiwenbin
 * @Date 2020/5/29 上午9:34
 */
@Data
public class AdminUserEditDTO {
    @ApiModelProperty("用户id, 添加传空串")
    private String userId;

    @ApiModelProperty("账号")
    @Pattern(regexp = RegexUtil.MOBILE, message = "手机号格式错误")
    private String phone;

    @ApiModelProperty("用户名")
    @NotBlank(message = "用户名不能为空")
    @Length(min = 2, max = 30, message = "用户名长度[2-30]")
    private String userName;

    @ApiModelProperty("性别 1:男 2:女")
    @Pattern(regexp = RegexUtil.INTEGER, message = "性别错误")
    private String gender;

    @ApiModelProperty("账号状态 是否启用 0:禁用；1:启用")
    @Pattern(regexp = RegexUtil.INTEGER, message = "账号状态错误")
    private String accountStatus;
}
