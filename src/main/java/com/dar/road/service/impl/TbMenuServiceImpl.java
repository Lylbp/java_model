package com.dar.road.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.VO.MenuNodeVO;
import com.dar.road.VO.MenuVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.mapper.TbMenuMapper;
import com.dar.road.entity.TbMenu;
import com.dar.road.service.TbMenuPermissionService;
import com.dar.road.service.TbMenuService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbMenuService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class TbMenuServiceImpl extends AbstractService<TbMenu> implements TbMenuService {

    @Resource
    private TbMenuMapper tbMenuMapper;

    @Resource
    private TbMenuPermissionService tbMenuPermissionService;

    @Override
    public List<MenuVO> getListByParams(Map<String, Object> params) {
        return tbMenuMapper.queryByParams(params);
    }

    @Override
    public List<MenuVO> getSonListByMenuId(String menuId) {
        Map<String, Object> params = new HashMap<>();
        params.put("pid", menuId);
        return getListByParams(params);
    }

    @Override
    public String insertOrUpdate(TbMenu menu, List<String> permissionIds) {
        String menuId = menu.getMenuId();

        String pid = menu.getPid();
        //保证pid为null或为空串时数据库存0
        if (pid == null || "".equals(pid)) {
            menu.setPid("0");
        } else {
            //检查pid是否存在
            TbMenu pMenu = checkIsExitByMenuId(pid);
            if (ObjectUtil.isEmpty(pMenu)) throw new ResResultException(ResResultEnum.PARENT_MENU_NOT_EXIT);
        }

        TbMenu dbMenu = selectById(menuId);
        if (ObjectUtil.isEmpty(dbMenu)) {
            menuId = IdUtil.simpleUUID();
            menu.setMenuId(menuId);
            menu.setIsValid(true);
            insert(menu);
        } else {
            update(menu);
            //解除原有菜单关系
            tbMenuPermissionService.updateIsValidByMenuId(menuId, false);
        }

        //重新添加菜单关系
        tbMenuPermissionService.batchInsert(menuId, permissionIds);

        return menuId;
    }

    @Override
    public Boolean checkHasSonByMenuId(String menuId) {
        List<MenuVO> sonListByMenuId = getSonListByMenuId(menuId);
        if (ObjectUtil.isEmpty(sonListByMenuId)) {
            return false;
        }

        return true;
    }

    @Override
    public Integer updateIsValidByMenuId(String menuId, Boolean isValid) {
        Boolean hasSon = checkHasSonByMenuId(menuId);
        if (!hasSon) {
            TbMenu menu = selectById(menuId);
            menu.setIsValid(isValid);

            return update(menu);
        }

        throw new ResResultException(ResResultEnum.MENU_HAS_SON_CAN_NOT_DELETE);
    }

    @Override
    public TbMenu checkIsExitByMenuId(String menuId) {
        TbMenu menu = selectById(menuId);
        if (ObjectUtil.isNotEmpty(menu) && menu.getIsValid()) return menu;

        return null;
    }

    @Override
    public List<MenuVO> getSecurityMenuByUserId(String userId) {
        return tbMenuMapper.getSecurityMenuByUserId(userId);
    }

    @Override
    public List<MenuNodeVO> recursionHandleMenuVOList(List<MenuVO> menuVOS, String pid) {
        List<MenuNodeVO> menuNodeVOS = new ArrayList<>();

        for (MenuVO menuVO : menuVOS) {
            String currentPid = menuVO.getPid();
            String currentId = menuVO.getMenuId();
            if (pid.equals(currentPid)) {
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