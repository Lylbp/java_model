package com.dar.road.service.impl;

import com.dar.road.mapper.TbUserRoleMapper;
import com.dar.road.entity.TbUserRole;
import com.dar.road.service.TbUserRoleService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TbUserRoleService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbUserRoleServiceImpl extends AbstractService<TbUserRole> implements TbUserRoleService {

    @Resource
    private TbUserRoleMapper tbUserRoleMapper;

}