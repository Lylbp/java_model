package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/15 下午3:05
 */
@Data
public class RoleEditDTO {
    @ApiModelProperty(value = "角色id 添加时传空串", required = true)
    private String roleId;

    @ApiModelProperty(value = "角色名称", required = true)
    private String roleName;

    @ApiModelProperty(value = "角色描述", required = true)
    private String roleDescription;
}
