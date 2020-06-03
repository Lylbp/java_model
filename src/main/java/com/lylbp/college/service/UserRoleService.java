package com.lylbp.college.service;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.VO.UserRoleVO;
import com.lylbp.college.entity.UserRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户与角色关系 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface UserRoleService extends IService<UserRole> {
    /**
     * 添加或编辑
     *
     * @param userRole
     * @return
     */
    Boolean insertOrUpdate(UserRole userRole);

    /**
     * 通过用户id以及角色id批量修改is_valid字段
     *
     * @param userId
     * @param roleIdList
     * @param isValid
     * @return
     */
    Integer updateIsValidByUserIdAndRoleIdList(String userId, List<String> roleIdList, Boolean isValid);

    /**
     * 通过用户id修改是否可用
     *
     * @param userId
     * @param isValid
     * @return
     */
    Integer updateIsValidByUserId(String userId, Boolean isValid);

    /**
     * 通过用户id修改是否可用
     *
     * @param roleId
     * @param isValid
     * @return
     */
    Integer updateIsValidByRoleId(String roleId, Boolean isValid);

    /**
     * 通过参数查询列表
     *
     * @param params
     * @return
     */
    List<UserRoleVO> getListByParams(Map<String, Object> params);

    /**
     * 通过用户id以及角色id查询列表
     *
     * @param userId
     * @param roleId
     * @return
     */
    List<UserRoleVO> getListByUserIdAndRoleId(String userId, String roleId);

    /**
     * 批量插入
     *
     * @param userRoles
     * @return
     */
    Integer batchInsert(List<Object> userRoles);

    /**
     * 根据用户id获取已分配角色
     *
     * @param userId
     * @param params
     * @return
     */
    List<RoleVO> getUserHasAssignRoleList(String userId, Map<String, Object> params);

    /**
     * 根据用户id获取未分配角色
     *
     * @param userId
     * @param params
     * @return
     */
    List<RoleVO> getUserNoAssignRoleList(String userId, Map<String, Object> params);
}
