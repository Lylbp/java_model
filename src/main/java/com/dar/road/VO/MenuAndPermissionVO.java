package com.dar.road.VO;

import com.dar.road.entity.TbMenu;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/19 上午8:57
 */
@Data
public class MenuAndPermissionVO extends TbMenu {
    @ApiModelProperty(value = "菜单对应权限")
    List<PermissionVO> permissionVOS;
}
