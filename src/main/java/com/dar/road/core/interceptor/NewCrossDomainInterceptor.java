package com.dar.road.core.interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 跨域请求拦截器,用以解决js请求的跨域问题使用方法如下所示:
 * <p>
 * * @Configuration
 * * public class InterceptorConfig implements WebMvcConfigurer {
 * *   @Bean
 * public CrossDomainInterceptor getCrossDomainInterceptor() {
 * return new CrossDomainInterceptor();
 * }
 * <p>
 * *   @Override
 * public void addInterceptors(InterceptorRegistry registry) {
 * registry.addInterceptor(getCrossDomainInterceptor()).addPathPatterns("/api/**");
 * }
 * <p>
 * }
 * <p>
 * 其中addPathPatterns方法就是添加这个拦截器的作用域,即哪些接口可以实现跨域请求
 *
 * @since 0.0.1
 */
@Slf4j
public class NewCrossDomainInterceptor implements HandlerInterceptor {

    /**
     * Pre handle.
     * 拦截每个请求     在请求处理之前进行调用（Controller方法调用之前
     *
     * @param request  the request
     * @param response the response
     * @param handler  the handler
     * @return the boolean
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        response.setHeader("Access-control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with, Accept, Content-Type, Authorization");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Credentials","true");
        String options = HttpMethod.OPTIONS.toString().toUpperCase();
        String method = request.getMethod().toUpperCase();
        if (options.equals(method)) {
            response.setStatus(HttpStatus.OK.value());
            return false;
        }
        return true;
    }

}