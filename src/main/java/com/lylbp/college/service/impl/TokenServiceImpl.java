package com.lylbp.college.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.lylbp.college.core.constant.ProjectConstant;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.JwtUtil;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.service.TokenService;
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
    public String createToken(Object object) {
        return JwtUtil.createToken(JSONUtil.toJsonStr(object));
    }

    @Override
    public String getTokenFromHeader() {
        String token = request.getHeader(ProjectConstant.AUTHENTICATION);
        if (ObjectUtil.isEmpty(token)) {
            throw new ResResultException(ResResultEnum.NO_LOGIN);
        }
        return token;
    }

    @Override
    public Boolean verifyTokenFromHeader() {
        return verifyToken(getTokenFromHeader());
    }

    @Override
    public Boolean verifyToken(String token) {
        return !ObjectUtil.isEmpty(JwtUtil.verifyToken(token));
    }

    @Override
    public <T>T getUserByToken(String token, Class<T> clazz) {
        return JwtUtil.getTokenClaimsObj(token, clazz);
    }

    @Override
    public <T>T getUserFromHeader(Class<T> clazz) {
        String token = getTokenFromHeader();
        T t = getUserByToken(token, clazz);
        if (ObjectUtil.isEmpty(t)) {
            throw new ResResultException(ResResultEnum.NO_LOGIN);
        }

        return t;
    }
}
