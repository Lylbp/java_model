package com.lylbp.college.service;

import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.VO.RolePermissionVO;
import com.lylbp.college.entity.RolePermission;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.access.ConfigAttribute;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色与权限关系 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface RolePermissionService extends IService<RolePermission> {
    /**
     * 添加或编辑
     *
     * @param rolePermission
     * @return
     */
    Boolean insertOrUpdate(RolePermission rolePermission);

    /**
     * 批量新增
     *
     * @param rolePermissions
     * @return
     */
    Integer batchInsert(List<RolePermission> rolePermissions);

    /**
     * 通过角色与权限id更改是否有效
     *
     * @param rolePermissionId
     * @param isValid
     * @return
     */
    Boolean updateIsValidByRolePermissionId(String rolePermissionId, Boolean isValid);

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

    /**
     * 获取所有的权限(key:String)与角色集合(value:Collection<ConfigAttribute>)
     *
     * @param params
     * @return
     */
    HashMap<String, Collection<ConfigAttribute>> getSecurityByParams(Map<String, Object> params);

    /**
     * 删除redis中的权限数据
     *
     * @return
     */
    Boolean deleteSecurityRedis();
}
