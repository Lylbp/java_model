package com.lylbp.college.service;

import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.entity.Permission;
import com.lylbp.college.core.universal.Service;

import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: PermissionService接口
 * @date 2020/05/11 09:13
 */
public interface PermissionService extends Service<Permission> {
    /**
     * 获取所有加了注解的函数列表
     *
     * @return
     */
    List<Permission> getAllAllPermissionByAnnotation();

    /**
     * 权限数据添加
     *
     * @param permissions
     */
    void installPermissionList(List<Permission> permissions);

    /**
     * 获取权限数据列表
     *
     * @param params
     * @return
     */
    List<PermissionVO> getPermissionByParams(Map<String, Object> params);

    /**
     * 通过权限id变更是否有效字段(假删)
     *
     * @param permissionId
     * @return
     */
    Integer updateIsValidByPermissionId(String permissionId, Boolean isValid);

    /**
     * 根据权限id判断数据是否存在
     *
     * @param permissionId
     * @return
     */
    Permission isExitByPermissionId(String permissionId);
}