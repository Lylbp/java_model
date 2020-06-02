package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:18
 */
@Data
public class RolePermissionQueryDTO {
    @ApiModelProperty(value = "角色id查询 传空串此条件不生效", required = true)
    private String roleId;

    @ApiModelProperty(value = "角色名称模糊查询 传空串此条件不生效", required = true)
    private String roleNameLike;

    @ApiModelProperty(value = "权限名称模糊查询 传空串此条件不生效", required = true)
    private String permissionNameLike;
}
