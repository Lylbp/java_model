package com.dar.road.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.core.constant.ProjectConstant;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.core.utils.JwtUtil;
import com.dar.road.entity.TbUser;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.service.TokenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author weiwenbin
 * @Date 2020-03-30 18:25
 */
@Service
public class TokenServiceImpl implements TokenService {
    @Resource
    private HttpServletRequest request;

    @Override
    public String createToken(SecurityUserVO securityUserVO) {
        return JwtUtil.createToken(JSONUtil.toJsonStr(securityUserVO));
    }

    @Override
    public Boolean verifyTokenFromHeader() {
        String token = getTokenFromHeader();
        DecodedJWT decodedJWT = JwtUtil.verifyToken(token);
        return !ObjectUtil.isEmpty(decodedJWT);
    }

    @Override
    public SecurityUserVO getUserByToken(String token) {
        return JwtUtil.getTokenClaimsObj(token, SecurityUserVO.class);
    }

    @Override
    public SecurityUserVO getUserFromHeader() {
        String token = getTokenFromHeader();
        SecurityUserVO securityUserVO = getUserByToken(token);
        if (ObjectUtil.isEmpty(securityUserVO)) {
            throw new ResResultException(ResResultEnum.NO_LOGIN);
        }

        return securityUserVO;
    }

    @Override
    public String getUserIdFromHeader() {
        TbUser tbUserFromHeader = getUserFromHeader();
        return tbUserFromHeader.getUserId();
    }

    @Override
    public String getTokenFromHeader() {
        String token = request.getHeader(ProjectConstant.AUTHENTICATION);
        if (ObjectUtil.isEmpty(token)) {
            throw new ResResultException(ResResultEnum.NO_LOGIN);
        }
        return token;
    }
}
