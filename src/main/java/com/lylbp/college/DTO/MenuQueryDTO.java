package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/19 上午8:58
 */
@Data
public class MenuQueryDTO {
    @ApiModelProperty(value = "菜单名称模糊查询 传空串此条件不生效", required = true)
    private String menuNameLike;

    @ApiModelProperty(value = "菜单url模糊查询 传空串此条件不生效", required = true)
    private String menuUrlLike;

    @ApiModelProperty(value = "菜单父级 传空串此条件不生效", required = true)
    private String menuPid;
}
