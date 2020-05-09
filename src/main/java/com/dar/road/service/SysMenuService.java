package com.dar.road.service;

import com.dar.road.entity.SysMenu;
import com.dar.road.core.universal.Service;

import java.util.List;

/**
* @Description: SysMenuService接口
* @author weiwenbin
* @date 2020/04/17 16:27
*/
public interface SysMenuService extends Service<SysMenu> {
    List<SysMenu> getList();
}