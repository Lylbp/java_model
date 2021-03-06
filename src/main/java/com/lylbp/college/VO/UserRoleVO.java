package com.lylbp.college.VO;

import com.lylbp.college.entity.UserRole;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:46
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserRoleVO extends UserRole {
    @ApiModelProperty(value = "对应角色信息")
    private RoleVO roleVO;
}
