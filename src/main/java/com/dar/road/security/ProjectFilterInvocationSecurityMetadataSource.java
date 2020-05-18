package com.dar.road.security;

import com.dar.road.VO.Security.SecurityRolePermissionVO;
import com.dar.road.entity.TbPermission;
import com.dar.road.entity.TbRole;
import com.dar.road.mapper.TbRolePermissionMapper;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 动态权限数据源，用于获取动态权限规则
 *
 * @Author weiwenbin
 * @Date 2020/5/11 下午2:18
 */
@Component
public class ProjectFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
    @Resource
    private TbRolePermissionMapper tbRolePermissionMapper;

    /**
     * 每一个资源所需要的角色 Collection<ConfigAttribute>决策器会用到
     */
    private static HashMap<String, Collection<ConfigAttribute>> map = null;


    /**
     * 返回请求的资源需要的角色
     * 如果api未配置可访问的角色代表所有人都可以访问
     * @param o
     * @return
     * @throws IllegalArgumentException
     */
    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        //TODO 缓存中拿
        loadResourceDefine();
        //object 中包含用户请求的request 信息
        HttpServletRequest request = ((FilterInvocation) o).getHttpRequest();
        for (Iterator<String> it = map.keySet().iterator(); it.hasNext(); ) {
            String url = it.next();
            if (new AntPathRequestMatcher(url).matches(request)) {
                return map.get(url);
            }
        }

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
    public void loadResourceDefine() {
        map = new HashMap<>(16);
        //权限资源 和 角色对应的表  也就是 角色权限 中间表
        List<SecurityRolePermissionVO> securityRolePermissionVOS = tbRolePermissionMapper.securityQueryByParams(new HashMap<String, Object>());

        securityRolePermissionVOS.forEach(securityRolePermissionVO -> {
            TbRole tbRole = securityRolePermissionVO.getTbRole();
            TbPermission tbPermission = securityRolePermissionVO.getTbPermission();

            String roleName = tbRole.getRoleName();
            String url = tbPermission.getUrl();

            ConfigAttribute role = new SecurityConfig(roleName);
            if (map.containsKey(url)) {
                map.get(url).add(role);
            } else {
                List<ConfigAttribute> list = new ArrayList<>();
                list.add(role);
                map.put(url, list);
            }
        });
    }
}
