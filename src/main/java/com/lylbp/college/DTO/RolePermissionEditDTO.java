package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/15 下午5:01
 */
@Data
public class RolePermissionEditDTO {
    @ApiModelProperty(value = "角色权限id 添加可传空串", required = true)
    private String rolePermissionId;

    @ApiModelProperty(value = "角色id", required = true)
    private String roleId;

    @ApiModelProperty(value = "权限id", required = true)
    private String permissionId;
}
