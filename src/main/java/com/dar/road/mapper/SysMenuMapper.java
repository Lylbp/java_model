package com.dar.road.mapper;

import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.SysMenu;

import java.util.List;

public interface SysMenuMapper extends Mapper<SysMenu> {
    List<SysMenu> getList();
}