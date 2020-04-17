package com.dar.road.service.impl;

import com.dar.road.mapper.SysMenuMapper;
import com.dar.road.entity.SysMenu;
import com.dar.road.service.SysMenuService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: SysMenuService接口实现类
* @author weiwenbin
* @date 2020/04/17 16:27
*/
@Service
public class SysMenuServiceImpl extends AbstractService<SysMenu> implements SysMenuService {

    @Resource
    private SysMenuMapper sysMenuMapper;

}