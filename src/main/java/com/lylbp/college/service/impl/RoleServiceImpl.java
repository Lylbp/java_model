package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.entity.Role;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.RoleMapper;
import com.lylbp.college.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    @Override
    public Boolean insertOrUpdate(Role role) {
        String roleId = role.getRoleId();
        Role dbRole = getById(roleId);

        //数据验证
        String roleName = role.getRoleName();
        List<RoleVO> roleVOS = getListByRoleName(roleName);

        if (ObjectUtil.isEmpty(dbRole)) {
            //role不能重复
            if (ObjectUtil.isNotEmpty(roleVOS)) throw new ResResultException(ResResultEnum.ROLE_NAME_EXIT);
            return save(role);
        } else {
            //role不能重复
            if ((roleVOS.size() == 1 && roleVOS.get(0).getRoleId().equals(roleId)) || roleVOS.size() == 0){
                return updateById(role);
            }
            throw new ResResultException(ResResultEnum.ROLE_NAME_EXIT);
        }
    }

    @Override
    public Boolean updateIsValidByRoleId(String roleId, Boolean isValid) {
        Role role = getById(roleId);
        if (ObjectUtil.isEmpty(role)) return false;
        role.setIsValid(isValid);

        return updateById(role);
    }

    @Override
    public List<RoleVO> getListByParams(Map<String, Object> params) {
        return getBaseMapper().queryByParams(params);
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
        Role role = getById(roleId);
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
