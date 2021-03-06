package com.lylbp.college.core.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 下午3:01
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Resource
    private JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter;

    @Value("${security-open}")
    private Boolean securityOpen;

    @Value("${security-allow-static}")
    private String[] allowStatic;

    @Value("${security-allow-api}")
    private String[] allowApi;

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * 忽略拦截url或静态资源文件夹 - web.ignoring(): 会直接过滤该url - 将不会经过Spring Security过滤器链
     * http.permitAll(): 不会绕开springsecurity验证，相当于是允许该路径通过
     *
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
        if (!securityOpen) {
            web.ignoring().antMatchers("/**");
        } else {
            List<String> allowStaticList = Arrays.asList(allowStatic);
            allowStaticList.forEach(allowStatic -> web.ignoring().antMatchers(allowStatic));
        }
    }

    /**
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        if (!securityOpen) {
            http
                    .authorizeRequests()
                    .anyRequest().authenticated()
                    .and()
                    .httpBasic();
        } else {
            //默认配置一个Bean Name为corsConfigurationSource
            http.cors().and();
            // 由于使用的是JWT，我们这里不需要csrf
            http.csrf().disable();
            /**
             *   基于token，所以不需要session
             *   ALWAYS 总是会新建一个Session。
             *   NEVER 不会新建HttpSession，但是如果有Session存在，就会使用它。
             *   IF_REQUIRED 如果有要求的话，会新建一个Session。
             *   STATELESS 这个是我们用的，不会新建，也不会使用一个HttpSession。
             *   所有的Rest服务一定要设置为无状态，以提升操作性能
             */
            http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and();

            List<String> allApiList = Arrays.asList(allowApi);
            allApiList.forEach(allowApi -> {
                try {
                    http.authorizeRequests().antMatchers(allowApi).permitAll();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });

            //前面没有匹配上的请求，全部需要认证
            http.authorizeRequests().anyRequest().authenticated().and();
            // 禁用缓存
            http.headers().cacheControl();
            //token过滤器
            http.addFilterBefore(jwtAuthenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);
            /**
             * 添加自定义异常入口，处理accessdeine异常
             * AuthenticationEntryPoint 用来解决匿名用户访问无权限资源时的异常
             * AccessDeniedHandler 用来解决认证过的用户访问无权限资源时的异常
             */
            http.exceptionHandling().authenticationEntryPoint(new ProjectAuthenticationEntryPoint())
                    .accessDeniedHandler(new ProjectAccessDeniedHandler());
        }
    }
}
