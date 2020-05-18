package com.dar.road.mapper;

import com.dar.road.VO.RoleVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbRoleMapper extends Mapper<TbRole> {
    List<RoleVO> queryByParams(@Param("params") Map<String, Object> params);
}