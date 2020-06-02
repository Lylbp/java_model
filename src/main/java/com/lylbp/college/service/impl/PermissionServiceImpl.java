package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.AnnotationUtil;
import com.lylbp.college.entity.Permission;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.PermissionMapper;
import com.lylbp.college.service.PermissionService;
import com.lylbp.college.core.universal.AbstractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: PermissionService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class PermissionServiceImpl extends AbstractService<Permission> implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

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
            Permission dbPermission = selectBy("permissionUrl", permissionUrl);
            permission.setIsValid(true);
            if (ObjectUtil.isEmpty(dbPermission)){
                permission.setPermissionId(IdUtil.simpleUUID());
                insert(permission);
            }else {
                update(permission);
            }
        }
    }

    @Override
    public List<PermissionVO> getPermissionByParams(Map<String, Object> params) {
        return permissionMapper.queryByParams(params);
    }

    @Override
    public Integer updateIsValidByPermissionId(String permissionId, Boolean isValid) {
        Permission permission = selectById(permissionId);
        if (ObjectUtil.isEmpty(permission)) return 0;
        permission.setIsValid(isValid);

        return update(permission);
    }

    @Override
    public Permission isExitByPermissionId(String permissionId) {
        Permission permission = selectById(permissionId);
        if (ObjectUtil.isNotEmpty(permission) && permission.getIsValid()) return permission;

        return null;
    }
}