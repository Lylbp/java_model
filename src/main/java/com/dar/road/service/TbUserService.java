package com.dar.road.service;

import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.entity.TbUser;
import com.dar.road.core.universal.Service;

/**
 * @author weiwenbin
 * @Description: TbUserService接口
 * @date 2020/05/11 09:24
 */
public interface TbUserService extends Service<TbUser> {
    SecurityUserVO getUserVOByUserName(String userName);
}