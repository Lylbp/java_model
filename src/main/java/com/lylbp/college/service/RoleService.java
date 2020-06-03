package com.lylbp.college.service;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface RoleService extends IService<Role> {
    /**
     * 添加或编辑
     *
     * @param role
     * @return
     */
    Boolean insertOrUpdate(Role role);


    /**
     * 修改是否有效
     *
     * @param roleId
     * @param isValid
     * @return
     */
    Boolean updateIsValidByRoleId(String roleId, Boolean isValid);

    /**
     * 根据查询参数获取列表
     *
     * @param params
     * @return
     */
    List<RoleVO> getListByParams(Map<String, Object> params);

    /**
     * 根据查询参数获取信息
     *
     * @param params
     * @return
     */
    RoleVO getInfoByParams(Map<String, Object> params);

    /**
     * 根据角色id获取信息
     *
     * @param roleId
     * @return
     */
    RoleVO getInfoByRoleId(String roleId);

    /**
     * 通过角色id判断数据是否存在
     *
     * @param roleId
     * @return
     */
    Role isExistByRoleId(String roleId);

    /**
     * 通过角色名获取数据列表
     *
     * @param roleName
     * @return
     */
    List<RoleVO> getListByRoleName(String roleName);

}
