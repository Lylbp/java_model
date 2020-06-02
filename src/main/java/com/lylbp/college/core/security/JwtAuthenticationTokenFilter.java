package com.lylbp.college.core.security;

import cn.hutool.core.util.ArrayUtil;
import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.core.constant.ProjectConstant;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.service.TokenService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * JWT权限验证
 * @Author weiwenbin
 * @Date 2020/5/11 下午9:34
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {
    @Resource
    private TokenService tokenService;

    @Value("${security-open}")
    private Boolean securityOpen;

    @Value("${security-allow-static}")
    private String[] allowStatic;

    @Value("${security-allow-api}")
    private String[] allowApi;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException, AuthenticationException {
        //security未开启直接放行
        if (!securityOpen){
            chain.doFilter(request, response);
            return;
        }

        //白名单请求直接放行
        String[] white = ArrayUtil.addAll(allowApi, allowStatic);
        PathMatcher pathMatcher = new AntPathMatcher();
        String requestURI = request.getRequestURI();
        for (String path : white) {
            if(pathMatcher.match(path,requestURI)){
                chain.doFilter(request, response);
                return;
            }
        }

        String token = request.getHeader(ProjectConstant.AUTHENTICATION);
//        if (null != token && !"".equals(token)){
            Boolean verifyTokenFromHeader = tokenService.verifyTokenFromHeader();
            if (!verifyTokenFromHeader) {
                throw new AccessDeniedException(ResResultEnum.NO_LOGIN.getMsg());
            }
            SecurityUserVO securityUserVO = tokenService.getUserByToken(token, SecurityUserVO.class);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                    securityUserVO,
                    null,
                    securityUserVO.getAuthorities());

            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

            //设置用户登录状态
            SecurityContextHolder.getContext().setAuthentication(authentication);
//        }

        chain.doFilter(request, response);
    }
}
