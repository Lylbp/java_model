package com.lylbp.college.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.MenuAndRolesVO;
import com.lylbp.college.VO.MenuNodeVO;
import com.lylbp.college.VO.MenuVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.entity.Menu;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.MenuMapper;
import com.lylbp.college.service.MenuRoleService;
import com.lylbp.college.service.MenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {
    @Resource
    private MenuRoleService menuRoleService;

    @Override
    public List<MenuVO> getListByParams(Map<String, Object> params) {
        return getBaseMapper().queryByParams(params);
    }

    @Override
    public List<MenuVO> getSonListByMenuId(String menuId) {
        Map<String, Object> params = new HashMap<>();
        params.put("menuPid", menuId);
        return getListByParams(params);
    }

    @Override
    public String insertOrUpdate(Menu menu, List<String> permissionIds) {
        String menuId = menu.getMenuId();

        String pid = menu.getMenuPid();
        //保证pid为null或为空串时数据库存0
        if (pid == null || "".equals(pid)) {
            menu.setMenuPid("0");
        } else {
            //检查pid是否存在
            Menu pMenu = checkIsExitByMenuId(pid);
            if (ObjectUtil.isEmpty(pMenu)) throw new ResResultException(ResResultEnum.PARENT_MENU_NOT_EXIT);
        }

        Menu dbMenu = getById(menuId);
        if (ObjectUtil.isEmpty(dbMenu)) {
            menu.setMenuId(menuId);
            menu.setIsValid(true);
            save(menu);
        } else {
            updateById(menu);
            //解除原有菜单关系
            menuRoleService.updateIsValidByMenuId(menuId, false);
        }

        //重新添加菜单关系
        menuRoleService.batchInsert(menuId, permissionIds);

        return menuId;
    }

    @Override
    public Boolean checkHasSonByMenuId(String menuId) {
        List<MenuVO> sonListByMenuId = getSonListByMenuId(menuId);
        return !ObjectUtil.isEmpty(sonListByMenuId);
    }

    @Override
    public Boolean updateIsValidByMenuId(String menuId, Boolean isValid) {
        Boolean hasSon = checkHasSonByMenuId(menuId);
        if (!hasSon) {
            Menu menu = getById(menuId);
            menu.setIsValid(isValid);

            return updateById(menu);
        }

        throw new ResResultException(ResResultEnum.MENU_HAS_SON_CAN_NOT_DELETE);
    }

    @Override
    public Menu checkIsExitByMenuId(String menuId) {
        Menu menu = getById(menuId);
        if (ObjectUtil.isNotEmpty(menu) && menu.getIsValid()) return menu;

        return null;
    }

    @Override
    public List<MenuAndRolesVO> getMenuAndRolesVOByParams(Map<String, Object> params) {
        return getBaseMapper().queryMenuAndRolesVOByParams(params);
    }

    @Override
    public MenuAndRolesVO getOneMenuAndRolesVOByParams(Map<String, Object> params) {
        MenuAndRolesVO menuAndRolesVO = null;
        List<MenuAndRolesVO> list = getMenuAndRolesVOByParams(params);
        if (ObjectUtil.isNotEmpty(list)) {
            menuAndRolesVO = list.get(0);
        }
        return menuAndRolesVO;
    }

    @Override
    public MenuAndRolesVO getOneMenuAndRolesVOByMenuId(String menuId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("menuId", menuId);
        return getOneMenuAndRolesVOByParams(params);
    }

    @Override
    public List<MenuVO> getSecurityMenuByUserId(String userId) {
        return getBaseMapper().getSecurityMenuByUserId(userId);
    }

    @Override
    public List<MenuNodeVO> recursionHandleMenuVOList(List<MenuVO> menuVOS, String menuPid) {
        List<MenuNodeVO> menuNodeVOS = new ArrayList<>();

        for (MenuVO menuVO : menuVOS) {
            String currentPid = menuVO.getMenuPid();
            String currentId = menuVO.getMenuId();
            if (menuPid.equals(currentPid)) {
                MenuNodeVO menuNodeVO = new MenuNodeVO();
                BeanUtil.copyProperties(menuVO, menuNodeVO);

                List<MenuNodeVO> sonMenuVOS = recursionHandleMenuVOList(menuVOS, currentId);
                menuNodeVO.setSonMenuVOS(sonMenuVOS);

                menuNodeVOS.add(menuNodeVO);
            }
        }

        return menuNodeVOS;
    }
}
