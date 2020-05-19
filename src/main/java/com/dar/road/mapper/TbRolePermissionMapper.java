package com.dar.road.mapper;

import com.dar.road.VO.PermissionVO;
import com.dar.road.VO.RolePermissionVO;
import com.dar.road.VO.Security.SecurityRolePermissionVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbRolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TbRolePermissionMapper extends Mapper<TbRolePermission> {
    List<SecurityRolePermissionVO> securityQueryByParams(@Param("params") Map<String,Object> params);

    List<RolePermissionVO> queryByParams(@Param("params") Map<String,Object> params);

    Integer updateIsValidByRoleId(@Param("roleId") String roleId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("rolePermissions") List<TbRolePermission> rolePermissions);

    Integer batchDeleteByRoleIdAndPermissionIds(@Param("roleId") String roleId,
                                                @Param("permissionIdList") List<String> permissionIdList,
                                                @Param("isValid") boolean isValid);

    List<PermissionVO> getRoleNoAssignPermissionList(@Param("roleId") String roleId,
                                                     @Param("params") Map<String, Object> params);

    List<PermissionVO> getRoleHasAssignPermissionList(@Param("roleId") String roleId,
                                                      @Param("params") Map<String, Object> params);
}