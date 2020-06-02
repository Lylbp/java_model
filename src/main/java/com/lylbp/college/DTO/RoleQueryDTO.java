package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/15 下午3:05
 */
@Data
public class RoleQueryDTO {
    @ApiModelProperty(value = "角色模糊查询 传空串此条件不生效", required = true)
    private String roleNameLike;
    
    @ApiModelProperty(value = "角色简介查询 传空串此条件不生效", required = true)
    private String roleDescriptionLike;

}
