package com.lylbp.college.VO.Security;

import com.lylbp.college.entity.Permission;
import com.lylbp.college.entity.Role;
import com.lylbp.college.entity.RolePermission;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 下午2:22
 */
@Data
public class SecurityRolePermissionVO extends RolePermission {
    @ApiModelProperty("角色信息")
    private Role role;

    @ApiModelProperty("权限信息")
    private Permission permission;
}
