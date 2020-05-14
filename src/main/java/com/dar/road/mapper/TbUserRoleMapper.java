package com.dar.road.mapper;

import com.dar.road.VO.Security.SecurityRoleVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbUserRoleMapper extends Mapper<TbUserRole> {
    List<SecurityRoleVO> queryListByUserId(@Param("userId") String userId);
}