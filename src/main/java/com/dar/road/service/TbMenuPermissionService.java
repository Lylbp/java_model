package com.dar.road.service;

import com.dar.road.entity.TbMenuPermission;
import com.dar.road.core.universal.Service;

import java.util.List;

/**
* @Description: TbMenuPermissionService接口
* @author weiwenbin
* @date 2020/05/11 09:13
*/
public interface TbMenuPermissionService extends Service<TbMenuPermission> {
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
}