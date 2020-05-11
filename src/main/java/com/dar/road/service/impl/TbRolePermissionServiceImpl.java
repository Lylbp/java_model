package com.dar.road.service.impl;

import com.dar.road.mapper.TbRolePermissionMapper;
import com.dar.road.entity.TbRolePermission;
import com.dar.road.service.TbRolePermissionService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TbRolePermissionService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbRolePermissionServiceImpl extends AbstractService<TbRolePermission> implements TbRolePermissionService {

    @Resource
    private TbRolePermissionMapper tbRolePermissionMapper;

}