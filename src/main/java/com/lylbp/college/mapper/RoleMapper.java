package com.lylbp.college.mapper;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.core.universal.Mapper;
import com.lylbp.college.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleMapper extends Mapper<Role> {
    List<RoleVO> queryByParams(@Param("params") Map<String, Object> params);
}