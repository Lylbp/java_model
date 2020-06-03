package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.AnnotationUtil;
import com.lylbp.college.entity.Permission;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.PermissionMapper;
import com.lylbp.college.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 权限 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {
    @Override
    public List<Permission> getAllAllPermissionByAnnotation() {
        AnnotationUtil annotationUtil = new AnnotationUtil();
        try {
            Map<String, Map<String, Object>> allAddTagAnnotationUrl = annotationUtil.getAllAddTagAnnotationUrl(
                    "classpath*:com/lylbp/college/controller/bg/**/*.class", CheckPermission.class
            );

            List<Permission> permissions = new ArrayList<>();
            allAddTagAnnotationUrl.forEach((s, stringObjectMap) -> {
                Permission permission = new Permission();
                permission.setPermissionName((String) stringObjectMap.get("descrption"));
                permission.setPermissionUrl(s);

                permissions.add(permission);
            });

            return permissions;
        } catch (Exception e) {
            throw new ResResultException(ResResultEnum.SYSTEM_ERR.getCode(), e.getMessage());
        }
    }

    @Override
    public void installPermissionList(List<Permission> permissions) {
        for (Permission permission : permissions) {
            String permissionUrl = permission.getPermissionUrl();
            Permission dbPermission = getOne(new LambdaQueryWrapper<Permission>().eq(Permission::getPermissionUrl, permissionUrl));
            permission.setIsValid(true);
            if (ObjectUtil.isEmpty(dbPermission)) {
                permission.setPermissionId(IdUtil.simpleUUID());
                save(permission);
            } else {
                updateById(permission);
            }
        }
    }

    @Override
    public List<PermissionVO> getPermissionByParams(Map<String, Object> params) {
        return getBaseMapper().queryByParams(params);
    }

    @Override
    public Boolean updateIsValidByPermissionId(String permissionId, Boolean isValid) {
        Permission permission = getById(permissionId);
        if (ObjectUtil.isEmpty(permission)) return false;
        permission.setIsValid(isValid);

        return updateById(permission);
    }

    @Override
    public Permission isExitByPermissionId(String permissionId) {
        Permission permission = getById(permissionId);
        if (ObjectUtil.isNotEmpty(permission) && permission.getIsValid()) return permission;

        return null;
    }
}
