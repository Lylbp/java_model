package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.entity.Role;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.RoleMapper;
import com.lylbp.college.service.RoleService;
import com.lylbp.college.core.universal.AbstractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: RoleService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class RoleServiceImpl extends AbstractService<Role> implements RoleService {
    @Resource
    private RoleMapper roleMapper;

    @Override
    public Integer insertOrUpdate(Role role) {
        String roleId = role.getRoleId();
        Role dbRole = selectById(roleId);

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
            if ((roleVOS.size() == 1 && roleVOS.get(0).getRoleId().equals(roleId)) || roleVOS.size() == 0){
                return update(role);
            }
            throw new ResResultException(ResResultEnum.ROLE_NAME_EXIT);
        }
    }

    @Override
    public Integer updateIsValidByRoleId(String roleId, Boolean isValid) {
        Role role = selectById(roleId);
        if (ObjectUtil.isEmpty(role)) return 0;
        role.setIsValid(isValid);

        return update(role);
    }

    @Override
    public List<RoleVO> getListByParams(Map<String, Object> params) {
        return roleMapper.queryByParams(params);
    }

    @Override
    public RoleVO getInfoByParams(Map<String, Object> params) {
        RoleVO roleVO = null;
        List<RoleVO> list = getListByParams(params);
        if (ObjectUtil.isNotEmpty(list)){
            roleVO = list.get(0);
        }

        return roleVO;
    }

    @Override
    public RoleVO getInfoByRoleId(String roleId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("roleId", roleId);

        return getInfoByParams(params);
    }

    @Override
    public Role isExistByRoleId(String roleId) {
        Role role = selectById(roleId);
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