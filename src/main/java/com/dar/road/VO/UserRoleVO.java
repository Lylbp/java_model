package com.dar.road.VO;

import com.dar.road.entity.TbUserRole;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:46
 */
@Data
public class UserRoleVO extends TbUserRole {
    @ApiModelProperty(value = "对应角色信息")
    private RoleVO roleVO;
}
