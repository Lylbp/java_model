package com.dar.road.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.VO.RolePermissionVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.mapper.TbRolePermissionMapper;
import com.dar.road.entity.TbRolePermission;
import com.dar.road.service.TbRolePermissionService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbRolePermissionService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class TbRolePermissionServiceImpl extends AbstractService<TbRolePermission> implements TbRolePermissionService {

    @Resource
    private TbRolePermissionMapper tbRolePermissionMapper;

    @Override
    public Integer insertOrUpdate(TbRolePermission rolePermission) {
        String rolePermissionId = rolePermission.getRolePermissionId();
        TbRolePermission dbRolePermission = selectById(rolePermissionId);

        //通过角色id以及权限id获取列表
        List<RolePermissionVO> list =
                getListByRoleIdAndPermissionId(rolePermission.getPermissionId(), rolePermission.getRoleId());

        if (ObjectUtil.isEmpty(dbRolePermission)) {
            //数据验证---同一角色下不能有重复的权限
            if (ObjectUtil.isNotEmpty(list)) throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
            rolePermission.setRolePermissionId(IdUtil.simpleUUID());
            return insert(rolePermission);
        } else {
            //数据验证---同一角色下不能有重复的权限
            if (list.size() == 1 && rolePermissionId.equals(list.get(0).getRolePermissionId())) {
                return update(rolePermission);
            }

            throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
        }

    }

    @Override
    public Integer updateIsValidByRolePermissionId(String rolePermissionId, Boolean isValid) {
        TbRolePermission rolePermission = selectById(rolePermissionId);
        if (ObjectUtil.isEmpty(rolePermission)) return 0;
        rolePermission.setIsValid(isValid);

        return update(rolePermission);
    }

    @Override
    public List<RolePermissionVO> getListByParams(Map<String, Object> params) {
        return tbRolePermissionMapper.queryByParams(params);
    }

    @Override
    public List<RolePermissionVO> getListByRoleIdAndPermissionId(String permissionId, String roleId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("permissionId", permissionId);
        params.put("roleId", roleId);

        return getListByParams(params);
    }
}