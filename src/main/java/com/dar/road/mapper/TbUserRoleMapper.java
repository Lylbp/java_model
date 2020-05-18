package com.dar.road.mapper;

import com.dar.road.VO.Security.SecurityRoleVO;
import com.dar.road.VO.UserRoleVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbUserRoleMapper extends Mapper<TbUserRole> {
    List<SecurityRoleVO> queryListByUserId(@Param("userId") String userId);

    List<UserRoleVO> queryByParams(@Param("params") Map<String, Object> params);

    Integer updateIsValidByUserId(@Param("userId") String userId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("userRoles") List<Object> userRoles);
}