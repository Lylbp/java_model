package com.lylbp.college.VO;

import com.lylbp.college.entity.Menu;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/19 上午8:57
 */
@Data
public class MenuAndRolesVO extends Menu {
    @ApiModelProperty("菜单对应角色集合")
    private List<RoleVO> roleVOS;
}
