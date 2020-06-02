package com.lylbp.college.VO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/19 下午2:16
 */
@Data
public class MenuNodeVO extends MenuVO{
    @ApiModelProperty(value = "子菜单信息")
    private List<MenuNodeVO> sonMenuVOS;
}
