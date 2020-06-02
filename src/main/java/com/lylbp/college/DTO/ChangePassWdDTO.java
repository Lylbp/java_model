package com.lylbp.college.DTO;

import com.lylbp.college.core.utils.RegexUtil;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
public class ChangePassWdDTO {
    @ApiModelProperty(value = "手机号",required = true)
    @Pattern(regexp = RegexUtil.MOBILE,message = "手机号格式错误")
    private String phone;

    @ApiModelProperty(value = "密码",required = true)
    @Pattern(regexp = RegexUtil.PASSWORD,message = "密码格式错误[数字或英文大小写6-18位]")
    private String passWd;

    @ApiModelProperty(value = "确认密码",required = true)
    @Pattern(regexp = RegexUtil.PASSWORD,message = "密码格式错误[数字或英文大小写6-18位]")
    private String confirmPassWd;

    @ApiModelProperty(value = "验证码",required = true)
    @NotBlank(message = "验证码错误")
    private String vCode;
}
