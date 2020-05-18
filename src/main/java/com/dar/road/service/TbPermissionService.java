package com.dar.road.service;

import com.dar.road.VO.PermissionVO;
import com.dar.road.entity.TbPermission;
import com.dar.road.core.universal.Service;

import java.security.Permission;
import java.util.List;
import java.util.Map;

/**
* @Description: TbPermissionService接口
* @author weiwenbin
* @date 2020/05/11 09:13
*/
public interface TbPermissionService extends Service<TbPermission> {
    /**
     * 获取所有加了注解的函数列表
     * @return
     */
    List<TbPermission> getAllAllPermissionByAnnotation();

    /**
     * 权限数据添加
     * @param permissions
     */
    void installPermissionList(List<TbPermission> permissions);

    /**
     * 获取权限数据列表
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
     * @param permissionId
     * @return
     */
    TbPermission isExitByPermissionId(String permissionId);
}