package com.dar.road.security;

import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.core.constant.ProjectConstant;
import com.dar.road.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

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
    @Autowired
    private TokenService tokenService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        String token = request.getHeader(ProjectConstant.AUTHENTICATION);
        if (null != token && "" != token){
            SecurityUserVO securityUserVO = tokenService.getTSysUserFromHeader();
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                    securityUserVO,
                    null,
                    securityUserVO.getAuthorities());

            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

            //设置用户登录状态
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }

        chain.doFilter(request, response);
    }
}
