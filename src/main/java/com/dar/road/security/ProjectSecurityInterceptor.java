package com.dar.road.security;

import cn.hutool.core.util.ObjectUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;

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

        //白名单请求直接放行
//        PathMatcher pathMatcher = new AntPathMatcher();
//        for (String path : ignoreUrlsConfig.getUrls()) {
//            if(pathMatcher.match(path,request.getRequestURI())){
//                fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
//                return;
//            }
//        }

        //此处会调用AccessDecisionManager中的decide方法进行鉴权操作
        if (ObjectUtil.isNotEmpty(fi)){
            InterceptorStatusToken token = super.beforeInvocation(fi);
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
        return this.projectFilterInvocationSecurityMetadataSource;
    }
}
