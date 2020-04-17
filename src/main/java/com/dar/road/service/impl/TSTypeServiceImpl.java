package com.dar.road.service.impl;

import com.dar.road.mapper.TSTypeMapper;
import com.dar.road.entity.TSType;
import com.dar.road.service.TSTypeService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TSTypeService接口实现类
* @author weiwenbin
* @date 2020/04/17 16:34
*/
@Service
public class TSTypeServiceImpl extends AbstractService<TSType> implements TSTypeService {

    @Resource
    private TSTypeMapper tSTypeMapper;

}