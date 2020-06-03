package com.lylbp.college.core.security;

import com.lylbp.college.service.RolePermissionService;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

/**
 * 动态权限数据源，用于获取动态权限规则
 *
 * @Author weiwenbin
 * @Date 2020/5/11 下午2:18
 */
@Component
public class ProjectFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    @Resource
    private RolePermissionService rolePermissionService;

    /**
     * 返回请求的资源需要的角色
     * 如果api未配置可访问的角色代表所有人都可以访问
     * @param o
     * @return
     * @throws IllegalArgumentException
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        HashMap<String, Collection<ConfigAttribute>> map = loadResourceDefine();

        //object 中包含用户请求的request 信息
        HttpServletRequest request = ((FilterInvocation) o).getHttpRequest();
        for (Iterator<String> it = map.keySet().iterator(); it.hasNext(); ) {
            String url = it.next();
            if (new AntPathRequestMatcher(url).matches(request)) {
                return map.get(url);
            }
        }

        //当前路由未做任何配置 直接放回null 不在向下运行
        return null;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }

    /**
     * 初始化 所有资源 对应的角色
     */
    public HashMap<String, Collection<ConfigAttribute>> loadResourceDefine() {
        return rolePermissionService.getSecurityByParams(new HashMap<String, Object>());
    }
}
