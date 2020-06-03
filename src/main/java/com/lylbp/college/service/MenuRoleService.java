package com.lylbp.college.service;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.entity.MenuRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 菜单与角色关系 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface MenuRoleService extends IService<MenuRole> {
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
