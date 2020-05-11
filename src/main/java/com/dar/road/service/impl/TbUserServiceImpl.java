package com.dar.road.service.impl;

import com.dar.road.VO.Security.RoleVO;
import com.dar.road.VO.Security.UserVO;
import com.dar.road.mapper.TbUserMapper;
import com.dar.road.entity.TbUser;
import com.dar.road.mapper.TbUserRoleMapper;
import com.dar.road.service.TbUserService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
* @Description: TbUserService接口实现类
* @author weiwenbin
* @date 2020/05/11 09:24
*/
@Service
public class TbUserServiceImpl extends AbstractService<TbUser> implements TbUserService, UserDetailsService {

    @Resource
    private TbUserMapper tbUserMapper;

    @Resource
    private TbUserRoleMapper tbUserRoleMapper;
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        UserVO userVO = tbUserMapper.queryByUserName(userName);
        if (userVO == null) {
            throw new UsernameNotFoundException(String.format("没有该用户 '%s'.", userName));
        }

        List<RoleVO> roleVOS = tbUserRoleMapper.queryListByUserId(userVO.getUserId());
        userVO.setAuthorities(roleVOS);

        return userVO;
    }
}