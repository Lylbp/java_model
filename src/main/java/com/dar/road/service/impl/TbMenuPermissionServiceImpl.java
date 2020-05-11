package com.dar.road.service.impl;

import com.dar.road.mapper.TbMenuPermissionMapper;
import com.dar.road.entity.TbMenuPermission;
import com.dar.road.service.TbMenuPermissionService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TbMenuPermissionService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbMenuPermissionServiceImpl extends AbstractService<TbMenuPermission> implements TbMenuPermissionService {

    @Resource
    private TbMenuPermissionMapper tbMenuPermissionMapper;

}