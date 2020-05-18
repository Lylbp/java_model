package com.dar.road.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.VO.RoleVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.mapper.TbRoleMapper;
import com.dar.road.entity.TbRole;
import com.dar.road.service.TbRoleService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbRoleService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class TbRoleServiceImpl extends AbstractService<TbRole> implements TbRoleService {
    @Resource
    private TbRoleMapper tbRoleMapper;

    @Override
    public Integer insertOrUpdate(TbRole role) {
        String roleId = role.getRoleId();
        TbRole dbRole = selectById(roleId);

        //数据验证
        String roleName = role.getRoleName();
        List<RoleVO> roleVOS = getListByRoleName(roleName);

        if (ObjectUtil.isEmpty(dbRole)) {
            //role不能重复
            if (ObjectUtil.isNotEmpty(roleVOS)) throw new ResResultException(ResResultEnum.ROLE_NAME_EXIT);
            role.setRoleId(IdUtil.simpleUUID());
            return insert(role);
        } else {
            //role不能重复
            if (roleVOS.size() == 1 && roleVOS.get(0).getRoleId().equals(roleId)){
                return update(role);
            }
            throw new ResResultException(ResResultEnum.ROLE_NAME_EXIT);
        }
    }

    @Override
    public Integer updateIsValidByRoleId(String roleId, Boolean isValid) {
        TbRole role = selectById(roleId);
        if (ObjectUtil.isEmpty(role)) return 0;
        role.setIsValid(isValid);

        return update(role);
    }

    @Override
    public List<RoleVO> getListByParams(Map<String, Object> params) {
        return tbRoleMapper.queryByParams(params);
    }

    @Override
    public TbRole isExistByRoleId(String roleId) {
        TbRole role = selectById(roleId);
        if (ObjectUtil.isNotEmpty(role) && role.getIsValid()) return role;

        return null;
    }

    @Override
    public List<RoleVO> getListByRoleName(String roleName) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("roleName", roleName);
        List<RoleVO> list = getListByParams(params);

        return list;
    }

}