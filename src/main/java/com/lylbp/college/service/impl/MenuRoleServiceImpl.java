package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.entity.MenuRole;
import com.lylbp.college.entity.Role;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.MenuRoleMapper;
import com.lylbp.college.service.MenuRoleService;
import com.lylbp.college.core.universal.AbstractService;
import com.lylbp.college.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
* @Description: MenuPermissionService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class MenuRoleServiceImpl extends AbstractService<MenuRole> implements MenuRoleService {

    @Resource
    private MenuRoleMapper menuRoleMapper;

    @Resource
    private RoleService roleService;

    @Override
    public Integer updateIsValidByMenuId(String menuId, Boolean isValid) {
        return menuRoleMapper.updateIsValidByMenuId(menuId, isValid);
    }

    @Override
    public Integer batchInsert(String menuId, List<String> roleIds) {
        List<MenuRole> list = new ArrayList<>();
        roleIds.forEach(roleId -> {
            Role role = roleService.isExistByRoleId(roleId);
            if (ObjectUtil.isEmpty(role)){
                throw new ResResultException(ResResultEnum.NO_ROLE_EXIT);
            }

            MenuRole menuRole = new MenuRole();
            menuRole.setMenuPermissionId(IdUtil.simpleUUID());
            menuRole.setMenuId(menuId);
            menuRole.setRoleId(roleId);
            menuRole.setIsValid(true);
            list.add(menuRole);
        });

        return menuRoleMapper.batchInsert(list);
    }

    @Override
    public List<RoleVO> getListByMenuId(String menuId) {
        return menuRoleMapper.queryRoleListByMenuId(menuId);
    }
}