package com.lylbp.college.core.security;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.core.enums.ResResultEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import javax.annotation.Resource;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 下午2:54
 */
@Component
public class ProjectSecurityInterceptor extends AbstractSecurityInterceptor implements Filter {
    @Value("${super-admin-id}")
    private String superAdminUserId;

    @Value("${security-open}")
    private Boolean securityOpen;

    @Value("${security-allow-static}")
    private String[] allowStatic;

    @Value("${security-allow-api}")
    private String[] allowApi;

    @Resource
    private ProjectFilterInvocationSecurityMetadataSource projectFilterInvocationSecurityMetadataSource;

    @Autowired
    public void setProjectFilterInvocationSecurityMetadataSource(ProjectAccessDecisionManager projectAccessDecisionManager) {
        super.setAccessDecisionManager(projectAccessDecisionManager);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

//    public void invoke(FilterInvocation fi) throws IOException, ServletException {
//
//        InterceptorStatusToken token = super.beforeInvocation(fi);
//        try {
//            //执行下一个拦截器
//            fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
//        } finally {
//            super.afterInvocation(token, null);
//        }
//    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        FilterInvocation fi = new FilterInvocation(servletRequest, servletResponse, filterChain);

        //OPTIONS请求直接放行
        if (request.getMethod().equals(HttpMethod.OPTIONS.toString())) {
            fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
            return;
        }

        //security未开启直接放行
        if (!securityOpen){
            fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
            return;
        }

        //白名单请求直接放行
        String[] white = ArrayUtil.addAll(allowApi, allowStatic);
        PathMatcher pathMatcher = new AntPathMatcher();
        for (String path : white) {
            if(pathMatcher.match(path,request.getRequestURI())){
                fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
                return;
            }
        }

        //超级管理员直接放行
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (null != authentication){
            if (authentication.getPrincipal() instanceof SecurityUserVO){
                SecurityUserVO securityUserVO = (SecurityUserVO)authentication.getPrincipal();
                if (superAdminUserId.equals(securityUserVO.getUserId())){
                    fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
                    return;
                }
            }
        }

        if (ObjectUtil.isNotEmpty(fi)){
            /**
             * beforeInvocation内部会调用FilterInvocationSecurityMetadataSource中getAttributes获取访问当前路由需要的权限
             * 然后调用AccessDecisionManager中的decide方法进行鉴权操作
             */
            InterceptorStatusToken token = super.beforeInvocation(fi);
            if (token == null){
                throw new AccessDeniedException(ResResultEnum.NO_AUTHENTICATION.getMsg());
            }
            try {
                fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
            } finally {
                super.afterInvocation(token, null);
            }
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public Class<?> getSecureObjectClass() {
        return FilterInvocation.class;
    }

    @Override
    public SecurityMetadataSource obtainSecurityMetadataSource() {
        return projectFilterInvocationSecurityMetadataSource;
    }
}
