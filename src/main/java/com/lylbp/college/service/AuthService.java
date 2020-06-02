package com.lylbp.college.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * @Author weiwenbin
 * @Date 2020/5/25 上午8:15
 */
public interface AuthService {
    /**
     * 后台账号密码登录
     * @param loginName
     * @return
     * @throws UsernameNotFoundException
     */
    UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException;
}
