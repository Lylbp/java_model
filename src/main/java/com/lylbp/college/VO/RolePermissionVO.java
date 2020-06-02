package com.lylbp.college.VO;

import com.lylbp.college.entity.RolePermission;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:21
 */
@Data
public class RolePermissionVO extends RolePermission {
    @ApiModelProperty(value = "对应角色信息")
    private RoleVO roleVO;

    @ApiModelProperty(value = "对应权限信息")
    private PermissionVO permissionVO;
}
