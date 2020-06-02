package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:37
 */
@Data
public class UserRoleEditDTO {
    @ApiModelProperty(value = "用户与角色id 添加可传空串", required = true)
    private String userRoleId;

    @ApiModelProperty(value = "用户id", required = true)
    private String userId;

    @ApiModelProperty(value = "角色id", required = true)
    private String roleId;
}
