package com.dar.road.core.configure.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.servlet.*;
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

    public void invoke(FilterInvocation fi) throws IOException, ServletException {

        InterceptorStatusToken token = super.beforeInvocation(fi);
        try {
            //执行下一个拦截器
            fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
        } finally {
            super.afterInvocation(token, null);
        }
    }


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        FilterInvocation fi = new FilterInvocation(servletRequest, servletResponse, filterChain);
        invoke(fi);
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
