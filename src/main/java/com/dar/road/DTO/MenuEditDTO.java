package com.dar.road.DTO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/19 上午8:58
 */
@Data
@ApiModel
public class MenuEditDTO {
    @ApiModelProperty(value = "菜单id 添加传空串", required = true)
    private String menuId;

    @ApiModelProperty(value = "菜单名称", required = true)
    @NotBlank
    private String name;

    @ApiModelProperty(value = "前端菜单路由", required = true)
    @NotBlank
    private String url;

    @ApiModelProperty(value = "父路由id", required = true)
    @NotBlank
    private String pid;

    @ApiModelProperty(value = "接口权限集合(配置后只有用户拥有该接口权限菜单才会显示)", required = true)
    @NotEmpty
    private List<String> permissionIds;
}
