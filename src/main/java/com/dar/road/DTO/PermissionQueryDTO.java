package com.dar.road.DTO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/15 下午2:35
 */
@Data
@ApiModel
public class PermissionQueryDTO {
    @ApiModelProperty(value = "名称模糊查询 传空串此条件不生效", required = true)
    private String nameLike;

    @ApiModelProperty(value = "url模糊查询 传空串此条件不生效", required = true)
    private String urlLike;
}
