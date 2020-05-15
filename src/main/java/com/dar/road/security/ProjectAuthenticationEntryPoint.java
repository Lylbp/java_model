package com.dar.road.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.core.utils.ResponseUtil;
import com.dar.road.enums.ResResultEnum;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;


/**
 * 未认证用户访问需要权限的url
 * @Author weiwenbin
 * @Date 2020/5/11 下午11:08
 */
public class ProjectAuthenticationEntryPoint implements AuthenticationEntryPoint{
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
                         AuthenticationException authException) {
        ResponseUtil.outJson(
                response,JSON.toJSONString(ResResultUtil.makeRsp(ResResultEnum.NO_AUTHENTICATION),
                        SerializerFeature.WriteMapNullValue)
        );
    }
}
