package com.dar.road.mapper;

import com.dar.road.VO.MenuVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbMenuMapper extends Mapper<TbMenu> {
    List<MenuVO> queryByParams(@Param("params") Map<String, Object> params);
}