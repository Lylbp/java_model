package com.lylbp.college.mapper;

import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.core.universal.Mapper;
import com.lylbp.college.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PermissionMapper extends Mapper<Permission> {
    /**
     * 条件查询
     *
     * @param params
     * @return
     */
    List<PermissionVO> queryByParams(@Param("params") Map<String, Object> params);
}