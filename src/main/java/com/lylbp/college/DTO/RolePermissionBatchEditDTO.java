package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/15 下午5:01
 */
@Data
public class RolePermissionBatchEditDTO {
    @ApiModelProperty(value = "角色id", required = true)
    private String roleId;

    @ApiModelProperty(value = "权限id集合", required = true)
    List<String> permissionIdList;
}
