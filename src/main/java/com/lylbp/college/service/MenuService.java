package com.lylbp.college.service;

import com.lylbp.college.VO.MenuAndRolesVO;
import com.lylbp.college.VO.MenuNodeVO;
import com.lylbp.college.VO.MenuVO;
import com.lylbp.college.entity.Menu;
import com.lylbp.college.core.universal.Service;

import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: MenuService接口
 * @date 2020/05/11 09:13
 */
public interface MenuService extends Service<Menu> {
    /**
     * 通过参数获取列表
     *
     * @param params
     * @return
     */
    List<MenuVO> getListByParams(Map<String, Object> params);

    /**
     * 菜单id
     *
     * @param menuId
     * @return
     */
    List<MenuVO> getSonListByMenuId(String menuId);

    /**
     * 添加或编辑
     *
     * @param menu          菜单信息
     * @param permissionIds 菜单对应权限id集合
     * @return
     */
    String insertOrUpdate(Menu menu, List<String> permissionIds);

    /**
     * 通过菜单id检测该菜单下有无子级
     *
     * @param menuId
     * @return
     */
    Boolean checkHasSonByMenuId(String menuId);

    /**
     * 根据菜单id更改is_valid
     *
     * @param menuId
     * @param isValid
     * @return
     */
    Integer updateIsValidByMenuId(String menuId, Boolean isValid);

    /**
     * 根据菜单id检测数据是否存
     *
     * @param menuId
     * @return
     */
    Menu checkIsExitByMenuId(String menuId);

    /**
     * 获取菜单列表（带角色列表）
     * @param params
     * @return
     */
    List<MenuAndRolesVO> getMenuAndRolesVOByParams(Map<String, Object> params);

    /**
     * 获取菜单详情（带角色列表）
     * @param params
     * @return
     */
    MenuAndRolesVO getOneMenuAndRolesVOByParams(Map<String, Object> params);

    /**
     * 通过菜单id获取详情（带角色列表）
     * @param menuId
     * @return
     */
    MenuAndRolesVO getOneMenuAndRolesVOByMenuId(String menuId);

    /**
     * 通过用户id获取拥有权限的菜单
     *
     * @param userId
     * @return
     */
    List<MenuVO> getSecurityMenuByUserId(String userId);

    /**
     * 递归处理菜单
     *
     * @param menuVOS
     * @return
     */
    List<MenuNodeVO> recursionHandleMenuVOList(List<MenuVO> menuVOS, String menuPid);
}