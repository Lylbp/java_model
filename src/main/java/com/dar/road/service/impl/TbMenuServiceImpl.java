package com.dar.road.service.impl;

import com.dar.road.mapper.TbMenuMapper;
import com.dar.road.entity.TbMenu;
import com.dar.road.service.TbMenuService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* @Description: TbMenuService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@Service
public class TbMenuServiceImpl extends AbstractService<TbMenu> implements TbMenuService {

    @Resource
    private TbMenuMapper tbMenuMapper;

}