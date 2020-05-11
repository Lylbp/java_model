package com.dar.road.service.impl;

import com.dar.road.mapper.TbRoleMapper;
import com.dar.road.entity.TbRole;
import com.dar.road.service.TbRoleService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TbRoleService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbRoleServiceImpl extends AbstractService<TbRole> implements TbRoleService {

    @Resource
    private TbRoleMapper tbRoleMapper;

}