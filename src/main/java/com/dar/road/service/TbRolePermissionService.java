package com.dar.road.service;

import com.dar.road.DTO.RolePermissionBatchDeleteDTO;
import com.dar.road.VO.PermissionVO;
import com.dar.road.VO.RolePermissionVO;
import com.dar.road.entity.TbRolePermission;
import com.dar.road.core.universal.Service;

import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbRolePermissionService接口
 * @date 2020/05/11 09:13
 */
public interface TbRolePermissionService extends Service<TbRolePermission> {
    /**
     * 添加或编辑
     *
     * @param rolePermission
     * @return
     */
    Integer insertOrUpdate(TbRolePermission rolePermission);

    /**
     * 批量新增
     *
     * @param rolePermissions
     * @return
     */
    Integer batchInsert(List<TbRolePermission> rolePermissions);

    /**
     * 通过角色与权限id更改是否有效
     *
     * @param rolePermissionId
     * @param isValid
     * @return
     */
    Integer updateIsValidByRolePermissionId(String rolePermissionId, Boolean isValid);

    /**
     * 通过角色id更改是否有效
     *
     * @param roleId
     * @param isValid
     * @return
     */
    Integer updateIsValidByRoleId(String roleId, Boolean isValid);

    /**
     * 获取列表
     *
     * @param params
     * @return
     */
    List<RolePermissionVO> getListByParams(Map<String, Object> params);

    /**
     * 通过权限id以及角色id获取列表
     *
     * @param permissionId
     * @param roleId
     * @return
     */
    List<RolePermissionVO> getListByRoleIdAndPermissionId(String permissionId, String roleId);

    /**
     * 根据角色id以及权限idList批量修改is_valid
     *
     * @param roleId
     * @param permissionIdList
     * @param isValid
     * @return
     */
    Integer batchDeleteByRoleIdAndPermissionIds(String roleId, List<String> permissionIdList, boolean isValid);

    /**
     * 根据角色id获取未分配权限
     *
     * @param roleId
     * @param params
     * @return
     */
    List<PermissionVO> getRoleNoAssignPermissionList(String roleId, Map<String, Object> params);

    /**
     * 根据角色id获取已分配权限
     *
     * @param roleId
     * @param params
     * @return
     */
    List<PermissionVO> getRoleHasAssignPermissionList(String roleId, Map<String, Object> params);
}