package com.dar.road.core.configure;

import com.dar.road.core.Filter.ApiFilter;
import com.dar.road.core.interceptor.ApiInterceptor;
import com.dar.road.core.interceptor.NewCrossDomainInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Author weiwenbin
 * @Date 2020-03-12 16:49
 */
@Slf4j
@Configuration
public class ProjectWebMvcConfigurer implements WebMvcConfigurer {
    @Bean
    public ApiInterceptor getApiInterceptor(){
        return  new ApiInterceptor();
    }

    @Bean
    public NewCrossDomainInterceptor getNewCrossDomainInterceptor() {
        return new NewCrossDomainInterceptor();
    }

    @Bean
    public ApiFilter getApiFilter(){
        return  new ApiFilter();
    }
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(getNewCrossDomainInterceptor())
                .addPathPatterns("/**");

        registry.addInterceptor(getApiInterceptor())
                .addPathPatterns("/api/**")
                .excludePathPatterns("/api/token/createTokenByTSysUser","/api/public/getLabelList",
                        "/api/public/getResource","/api/tHTasks/statisticsExportTask","/api/tHHiddenDanger/statisticsExportDanger",
                        "/api/tRIntelligentRecommendation/exportRecommendation");
    }

    @Bean
    public FilterRegistrationBean<ApiFilter> apiFilter() {
        FilterRegistrationBean<ApiFilter> filterRegistrationBean = new FilterRegistrationBean<>();
        filterRegistrationBean.setFilter(getApiFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.setOrder(1);   //order的数值越小，在所有的filter中优先级越高
        return filterRegistrationBean;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("doc.html")
                .addResourceLocations("classpath:/META-INF/resources/");
                registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/");
    }
}
