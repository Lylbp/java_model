package com.lylbp.college.DTO;

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
    private String menuName;

    @ApiModelProperty(value = "前端菜单路由", required = true)
    @NotBlank
    private String menuUrl;

    @ApiModelProperty(value = "父路由id", required = true)
    @NotBlank
    private String menuPid;

    @ApiModelProperty(value = "角色集合(配置后只有用户拥有该角色时菜单才会显示)", required = true)
    @NotEmpty
    private List<String> roleIds;
}
