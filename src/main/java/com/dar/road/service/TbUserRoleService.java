package com.dar.road.service;

import com.dar.road.VO.UserRoleVO;
import com.dar.road.entity.TbUserRole;
import com.dar.road.core.universal.Service;

import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbUserRoleService接口
 * @date 2020/05/11 09:13
 */
public interface TbUserRoleService extends Service<TbUserRole> {
    /**
     * 添加或编辑
     *
     * @param userRole
     * @return
     */
    Integer insertOrUpdate(TbUserRole userRole);

    /**
     * 通过用户角色id修改是否可用
     *
     * @param userRoleId
     * @param isValid
     * @return
     */
    Integer updateIsValidByUserRoleId(String userRoleId, Boolean isValid);

    /**
     * 通过用户id修改是否可用
     *
     * @param userId
     * @param isValid
     * @return
     */
    Integer updateIsValidByUserId(String userId, Boolean isValid);

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
     * @param userRoles
     * @return
     */
    Integer batchInsert(List<Object> userRoles);
}