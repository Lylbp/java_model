package com.lylbp.college.VO;

import com.lylbp.college.entity.Area;
import lombok.Data;
import lombok.EqualsAndHashCode;
import io.swagger.annotations.*;

/**
 * <p>
 * 地址表VO类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="AreaVO对象")
public class AreaVO extends Area {
}