package com.lylbp.college.service.impl;

import com.lylbp.college.VO.Security.SecurityRoleVO;
import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.mapper.UserRoleMapper;
import com.lylbp.college.service.AuthService;
import com.lylbp.college.mapper.AdminMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/25 上午8:17
 */
@Service
public class AuthServiceImpl implements AuthService, UserDetailsService {
    @Resource
    private AdminMapper adminMapper;
    @Resource
    private UserRoleMapper userRoleMapper;

    @Override
    public UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException {
        SecurityUserVO securityUserVO = adminMapper.queryByLoginName(loginName);
        if (securityUserVO == null) {
            throw new ResResultException(ResResultEnum.ACCOUNT_LOGIN_ERR);
        }
        Boolean isEnabled = securityUserVO.getIsEnabled();
        if (!isEnabled) {
            throw new ResResultException(ResResultEnum.ACCOUNT_DISABLE);
        }

        List<SecurityRoleVO> securityRoleVOS = userRoleMapper.queryListByUserId(securityUserVO.getUserId());
        securityUserVO.setAuthorities(securityRoleVOS);

        return securityUserVO;
    }
}
