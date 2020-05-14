package com.dar.road.core.configure.Security;

import com.dar.road.service.impl.TbUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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

/**
 * @Author weiwenbin
 * @Date 2020/5/11 下午3:01
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter;

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * 忽略拦截url或静态资源文件夹 - web.ignoring(): 会直接过滤该url - 将不会经过Spring Security过滤器链
     * http.permitAll(): 不会绕开springsecurity验证，相当于是允许该路径通过
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
                .antMatchers(HttpMethod.OPTIONS, "/**")
                .antMatchers("/**/*.{js,css,html,txt,jpg}")
                // 登录
                .antMatchers("/doc.html")
                .antMatchers("/webjars/**")
                .antMatchers("/swagger-resources/**")
                .antMatchers("/*/api-docs")
                .antMatchers("classpath:/META-INF/resources/")
                .antMatchers("classpath:/META-INF/resources/webjars/");
    }

    /**
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //默认配置一个Bean Name为corsConfigurationSource
                .cors().and()
                // 由于使用的是JWT，我们这里不需要csrf
                .csrf().disable()
                /**
                 *   基于token，所以不需要session
                 *   ALWAYS 总是会新建一个Session。
                 *   NEVER 不会新建HttpSession，但是如果有Session存在，就会使用它。
                 *   IF_REQUIRED 如果有要求的话，会新建一个Session。
                 *   STATELESS 这个是我们用的，不会新建，也不会使用一个HttpSession。
                 *   所有的Rest服务一定要设置为无状态，以提升操作性能
                 */
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                .authorizeRequests()
                //所有用户可以访问
                .antMatchers("/tbUser/testAuth").permitAll()
                //前面没有匹配上的请求，全部需要认证
                .anyRequest().authenticated().and();
        // 禁用缓存
        http.headers().cacheControl();

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
