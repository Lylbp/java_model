package com.lylbp.college.QO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 下午5:04
 */
@Data
public class RoleAssignPermissionQO {
    @ApiModelProperty(value = "角色id 此参数必须传", required = true)
    @NotBlank
    private String roleId;

    @ApiModelProperty(value = "权限名称模糊查询 传空串此条件不生效", required = true)
    private String permissionNameLike;
}
