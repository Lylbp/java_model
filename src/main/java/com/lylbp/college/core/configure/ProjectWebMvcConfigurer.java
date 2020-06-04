package com.lylbp.college.core.configure;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter4;
import com.lylbp.college.core.filter.ApiFilter;
import com.lylbp.college.core.interceptor.ApiInterceptor;
import com.lylbp.college.core.interceptor.NewCrossDomainInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.http.MediaType;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.filter.RequestContextFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020-03-12 16:49
 */
@Slf4j
@Configuration
public class ProjectWebMvcConfigurer extends WebMvcConfigurationSupport {
    @Bean
    public RequestContextListener list() {
        return new RequestContextListener();
    }

    @Bean
    public RequestContextFilter requestContextFilter() {
        return new RequestContextFilter();
    }

    @Bean
    public ApiInterceptor getApiInterceptor() {
        return new ApiInterceptor();
    }

    @Bean
    public NewCrossDomainInterceptor getNewCrossDomainInterceptor() {
        return new NewCrossDomainInterceptor();
    }

    @Bean
    public ApiFilter getApiFilter() {
        return new ApiFilter();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(getApiInterceptor())
                .addPathPatterns("/user/**")
                .excludePathPatterns("/bg/**", "/public/**", "/user/login", "/user/register");
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

    /**
     * 自定义消息转换器
     * @param converters
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        super.configureMessageConverters(converters);
        // 此处如果不添加，会导致 如果http请求中body是非json时，会报错
        // 可能因为只添加了fastjson converter，所以用fastjson对body的数据进行转换，导致报错
        StringHttpMessageConverter stringHttpMessageConverter = new StringHttpMessageConverter();
        stringHttpMessageConverter.setWriteAcceptCharset(false);
        //增加两个优先处理的转换类型.
        converters.add(new ByteArrayHttpMessageConverter());
        converters.add(stringHttpMessageConverter);

        converters.add(new JacksonHttpMessageConverter());
    }

}
