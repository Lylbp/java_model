package com.lylbp.college.mapper;

import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.VO.RolePermissionVO;
import com.lylbp.college.VO.Security.SecurityRolePermissionVO;
import com.lylbp.college.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色与权限关系 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface RolePermissionMapper extends BaseMapper<RolePermission> {
    List<SecurityRolePermissionVO> securityQueryByParams(@Param("params") Map<String,Object> params);

    List<RolePermissionVO> queryByParams(@Param("params") Map<String,Object> params);

    Integer updateIsValidByRoleId(@Param("roleId") String roleId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("rolePermissions") List<RolePermission> rolePermissions);

    Integer batchDeleteByRoleIdAndPermissionIds(@Param("roleId") String roleId,
                                                @Param("permissionIdList") List<String> permissionIdList,
                                                @Param("isValid") boolean isValid);

    List<PermissionVO> getRoleNoAssignPermissionList(@Param("roleId") String roleId,
                                                     @Param("params") Map<String, Object> params);

    List<PermissionVO> getRoleHasAssignPermissionList(@Param("roleId") String roleId,
                                                      @Param("params") Map<String, Object> params);
}
