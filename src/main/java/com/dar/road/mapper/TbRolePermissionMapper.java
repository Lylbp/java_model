package com.dar.road.mapper;

import com.dar.road.VO.Security.SecurityRolePermissionVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbRolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbRolePermissionMapper extends Mapper<TbRolePermission> {
    List<SecurityRolePermissionVO> queryByParams(@Param("params") Map<String,Object> params);
}