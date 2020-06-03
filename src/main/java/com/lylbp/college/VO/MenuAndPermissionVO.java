package com.lylbp.college.VO;

import com.lylbp.college.entity.Menu;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/19 上午8:57
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MenuAndPermissionVO extends Menu {
    @ApiModelProperty(value = "菜单对应权限")
    List<PermissionVO> permissionVOS;
}
