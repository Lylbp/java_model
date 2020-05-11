package com.dar.road.service.impl;

import com.dar.road.mapper.TbPermissionMapper;
import com.dar.road.entity.TbPermission;
import com.dar.road.service.TbPermissionService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TbPermissionService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbPermissionServiceImpl extends AbstractService<TbPermission> implements TbPermissionService {

    @Resource
    private TbPermissionMapper tbPermissionMapper;

}