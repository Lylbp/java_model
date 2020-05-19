package com.dar.road.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.entity.TbPermission;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.mapper.TbMenuPermissionMapper;
import com.dar.road.entity.TbMenuPermission;
import com.dar.road.service.TbMenuPermissionService;
import com.dar.road.core.universal.AbstractService;
import com.dar.road.service.TbPermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
* @Description: TbMenuPermissionService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbMenuPermissionServiceImpl extends AbstractService<TbMenuPermission> implements TbMenuPermissionService {

    @Resource
    private TbMenuPermissionMapper tbMenuPermissionMapper;

    @Resource
    private TbPermissionService permissionService;

    @Override
    public Integer updateIsValidByMenuId(String menuId, Boolean isValid) {
        return tbMenuPermissionMapper.updateIsValidByMenuId(menuId, isValid);
    }

    @Override
    public Integer batchInsert(String menuId, List<String> permissionIds) {
        List<TbMenuPermission> list = new ArrayList<>();
        permissionIds.forEach(permissionId -> {
            TbPermission permission = permissionService.isExitByPermissionId(permissionId);
            if (ObjectUtil.isEmpty(permission)){
                throw new ResResultException(ResResultEnum.NO_PERMISSION_EXIT);
            }

            TbMenuPermission tbMenuPermission = new TbMenuPermission();
            tbMenuPermission.setMenuPermissionId(IdUtil.simpleUUID());
            tbMenuPermission.setMenuId(menuId);
            tbMenuPermission.setPermissionId(permissionId);
            tbMenuPermission.setIsValid(true);
            list.add(tbMenuPermission);
        });

        return tbMenuPermissionMapper.batchInsert(list);
    }
}