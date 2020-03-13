package com.dar.road.core.universal;

import tk.mybatis.mapper.common.ConditionMapper;
import tk.mybatis.mapper.common.ExampleMapper;
import tk.mybatis.mapper.common.IdsMapper;
import tk.mybatis.mapper.common.special.InsertListMapper;

/**
 * @Description: 定制版MyBatis Mapper插件接口，如需其他接口参考官方文档自行添加。
 * @author weiwenbin
 * @date 2020/3/12
 */
public interface Mapper<T> extends tk.mybatis.mapper.common.BaseMapper<T>,ExampleMapper<T>, ConditionMapper<T>, IdsMapper<T>, InsertListMapper<T> {
}

