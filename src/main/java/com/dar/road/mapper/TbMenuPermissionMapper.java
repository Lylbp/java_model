package com.dar.road.mapper;

import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbMenuPermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbMenuPermissionMapper extends Mapper<TbMenuPermission> {
    Integer updateIsValidByMenuId(@Param("menuId") String menuId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("menuPermissionList") List<TbMenuPermission> menuPermissionList);
}