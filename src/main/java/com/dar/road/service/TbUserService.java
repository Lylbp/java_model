package com.dar.road.service;

import com.dar.road.entity.TbUser;
import com.dar.road.core.universal.Service;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * @author weiwenbin
 * @Description: TbUserService接口
 * @date 2020/05/11 09:24
 */
public interface TbUserService extends Service<TbUser> {
    /**
     * 通过用户名获取到用户信息
     *
     * @param userName
     * @return
     * @throws UsernameNotFoundException
     */
    UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException;
}