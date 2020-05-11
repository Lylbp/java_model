package com.dar.road.core.configure.Security;

import com.dar.road.VO.Security.UserVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.entity.TbUser;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.service.TbUserService;
import com.dar.road.service.TokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 下午9:34
 */
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

    private final static Logger logger = LoggerFactory.getLogger(JwtAuthenticationTokenFilter.class);

    @Autowired
    private TokenService tokenService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        UserVO userVO = tokenService.getTSysUserFromHeader();
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                userVO,
                null,
                userVO.getAuthorities());

        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

        //设置用户登录状态
        SecurityContextHolder.getContext().setAuthentication(authentication);

        chain.doFilter(request, response);
    }
}
