package com.lylbp.college.DTO;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.*;

/**
 * <p>
 * 地址表DTO类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="AreaDTO对象")
public class AreaDTO {
    @ApiModelProperty(value = "示列请对应修改")
    private String example;
}