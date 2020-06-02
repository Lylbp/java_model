package com.lylbp.college.service;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.entity.MenuRole;
import com.lylbp.college.core.universal.Service;

import java.util.List;

/**
* @Description: MenuPermissionService接口
* @author weiwenbin
* @date 2020/05/11 09:13
*/
public interface MenuRoleService extends Service<MenuRole> {
    /**
     * 根据菜单id修改is_valid
     *
     * @param menuId
     * @param isValid
     * @return
     */
    Integer updateIsValidByMenuId(String menuId, Boolean isValid);

    /**
     * 根据菜单id以及权限id集合批量添加
     *
     * @param menuId
     * @param permissionIds
     * @return
     */
    Integer batchInsert(String menuId, List<String> permissionIds);

    /**
     * 根据菜单id获取所有角色
     *
     * @param menuId
     * @param menuId
     * @return
     */
    List<RoleVO> getListByMenuId(String menuId);
}