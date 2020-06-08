package com.lylbp.college.QO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:40
 */
@Data
public class UserRoleQO {
    @ApiModelProperty(value = "用户id查询 传空串此条件不生效", required = true)
    private String userId;

    @ApiModelProperty(value = "角色名称模糊查询 传空串此条件不生效", required = true)
    private String roleNameLike;
}
