package com.dar.road.mapper;

import com.dar.road.VO.PermissionVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbPermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbPermissionMapper extends Mapper<TbPermission> {
    /**
     * 条件查询
     *
     * @param params
     * @return
     */
    List<PermissionVO> queryByParams(@Param("params") Map<String, Object> params);
}