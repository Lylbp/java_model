package com.lylbp.college.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.entity.MenuRole;
import com.lylbp.college.entity.Role;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.mapper.MenuRoleMapper;
import com.lylbp.college.service.MenuRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lylbp.college.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单与角色关系 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Service
public class MenuRoleServiceImpl extends ServiceImpl<MenuRoleMapper, MenuRole> implements MenuRoleService {
    @Resource
    private RoleService roleService;

    @Override
    public Integer updateIsValidByMenuId(String menuId, Boolean isValid) {
        return getBaseMapper().updateIsValidByMenuId(menuId, isValid);
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
            menuRole.setMenuId(menuId);
            menuRole.setRoleId(roleId);
            menuRole.setIsValid(true);
            list.add(menuRole);
        });

        return getBaseMapper().batchInsert(list);
    }

    @Override
    public List<RoleVO> getListByMenuId(String menuId) {
        return getBaseMapper().queryRoleListByMenuId(menuId);
    }
}
