package com.lylbp.project.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.lylbp.common.constant.ProjectConstant;
import com.lylbp.common.utils.TokenUtil;
import com.lylbp.manager.redis.service.RedisService;
import com.lylbp.manager.security.interfaces.MyUserDetailsService;
import com.lylbp.manager.security.entity.PermissionAuthority;
import com.lylbp.project.entity.SecurityUser;
import com.lylbp.project.service.AuthService;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * UserDetailsService
 *
 * @author weiwenbin
 * @date 2020/6/30 下午5:25
 */
@Service
public class UserDetailServiceImpl implements MyUserDetailsService {
    @Resource
    private AuthService authService;

    @Resource
    private RedisService redisService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<PermissionAuthority> permissionAuthorities = new ArrayList<>();
        return new SecurityUser(false, permissionAuthorities);
    }

    @Override
    public SecurityUser token2SecurityUser(HttpServletRequest request) {
        String auth = request.getHeader(ProjectConstant.AUTHENTICATION);
        //验证token
        String token = authService.getRedisToken(auth);
        if (StrUtil.isEmpty(token)) {
            return null;
        }

        if (!TokenUtil.verifyToken(token)) {
            return null;
        }
        SecurityUser securityUser = TokenUtil.getClazzByToken(token, SecurityUser.class);

        //token续命
        long expireTime = TokenUtil.getTokenExp(token).getTime();
        long currentTime = DateUtil.date().getTime();
        if (expireTime - currentTime < ProjectConstant.JWT_EXPIRE_TIME / 2) {
            token = TokenUtil.createToken(securityUser, ProjectConstant.JWT_EXPIRE_TIME);
            redisService.strSet(authService.getRedisTokenKey(auth), token, ProjectConstant.JWT_EXPIRE_TIME);
        }

        return securityUser;
    }

    @Override
    public Collection<ConfigAttribute> getConfigAttributes(HttpServletRequest request) {
        List<ConfigAttribute> configAttributes = new ArrayList<>();
        configAttributes.add(new SecurityConfig("/bg/auth/test"));
        return configAttributes;
    }
}
