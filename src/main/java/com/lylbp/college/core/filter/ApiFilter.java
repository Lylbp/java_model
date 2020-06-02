package com.lylbp.college.core.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * @Author weiwenbin
 * @Date 2020-03-13 13:03
 */
public class ApiFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
    }
}
