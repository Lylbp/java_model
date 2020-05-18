package com.dar.road.service.impl;

import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.VO.PermissionVO;
import com.dar.road.core.annotation.CheckPermission;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.core.utils.AnnotationUtil;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.mapper.TbPermissionMapper;
import com.dar.road.entity.TbPermission;
import com.dar.road.service.TbPermissionService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author weiwenbin
 * @Description: TbPermissionService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class TbPermissionServiceImpl extends AbstractService<TbPermission> implements TbPermissionService {

    @Resource
    private TbPermissionMapper tbPermissionMapper;

    @Override
    public List<TbPermission> getAllAllPermissionByAnnotation() {
        AnnotationUtil annotationUtil = new AnnotationUtil();
        try {
            Map<String, Map<String, Object>> allAddTagAnnotationUrl = annotationUtil.getAllAddTagAnnotationUrl(
                    "classpath*:com/dar/road/controller/**/*.class", CheckPermission.class
            );

            List<TbPermission> permissions = new ArrayList<>();
            allAddTagAnnotationUrl.forEach((s, stringObjectMap) -> {
                TbPermission permission = new TbPermission();
                permission.setName((String) stringObjectMap.get("descrption"));
                permission.setUrl(s);

                permissions.add(permission);
            });

            return permissions;
        } catch (Exception e) {
            throw new ResResultException(ResResultEnum.SYSTEM_ERR.getCode(), e.getMessage());
        }
    }

    @Override
    public void installPermissionList(List<TbPermission> permissions) {
        for (TbPermission permission : permissions) {
            String url = permission.getUrl();
            TbPermission dbPermission = selectBy("url", url);
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
        return tbPermissionMapper.queryByParams(params);
    }

    @Override
    public Integer updateIsValidByPermissionId(String permissionId, Boolean isValid) {
        TbPermission permission = selectById(permissionId);
        if (ObjectUtil.isEmpty(permission)) return 0;
        permission.setIsValid(isValid);

        return update(permission);
    }

    @Override
    public TbPermission isExitByPermissionId(String permissionId) {
        TbPermission permission = selectById(permissionId);
        if (ObjectUtil.isNotEmpty(permission) && permission.getIsValid()) return permission;

        return null;
    }
}