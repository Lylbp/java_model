package com.dar.road.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:37
 */
@Data
public class RolePermissionBatchDeleteDTO {
    @ApiModelProperty(value = "角色id 必传", required = true)
    @NotBlank
    private String roleId;

    @ApiModelProperty(value = "权限id集合", required = true)
    private List<String> permissionIds;
}
