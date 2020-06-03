package com.lylbp.college.service;

import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.entity.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 权限 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface PermissionService extends IService<Permission> {
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
    Boolean updateIsValidByPermissionId(String permissionId, Boolean isValid);

    /**
     * 根据权限id判断数据是否存在
     *
     * @param permissionId
     * @return
     */
    Permission isExitByPermissionId(String permissionId);
}
