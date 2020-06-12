package com.lylbp.college.QO;

import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.*;

/**
 * <p>
 * 地址表QO类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="AreaQO对象")
public class AreaQO {
    @ApiModelProperty(value = "示列请对应修改")
    private String example;
}