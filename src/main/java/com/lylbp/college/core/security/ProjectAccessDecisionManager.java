package com.lylbp.college.core.security;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lylbp.college.core.enums.ResResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Iterator;

/**
 * 动态权限决策管理器，用于判断用户是否有访问权限
 * @Author weiwenbin
 * @Date 2020/5/11 下午2:47
 */
@Component
public class ProjectAccessDecisionManager implements AccessDecisionManager {
    private final static Logger logger = LoggerFactory.getLogger(ProjectAccessDecisionManager.class);

    /**
     * 通过传递的参数来决定用户是否有访问对应受保护对象的权限
     *
     * @param authentication 包含了当前的用户信息，包括拥有的权限。这里的权限来源就是前面登录时UserDetailsService中设置的authorities
     * @param object 就是FilterInvocation对象，可以得到request等web资源
     * @param configAttributes configAttributes是本次访问需要的权限
     * @throws AccessDeniedException
     * @throws InsufficientAuthenticationException
     */
    @Override
    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes)
            throws AccessDeniedException, InsufficientAuthenticationException {
        if (ObjectUtil.isEmpty(configAttributes)) {
            return;
        } else {
            String needRole;
            for(Iterator<ConfigAttribute> iter = configAttributes.iterator(); iter.hasNext(); ) {
                Object next = iter.next();
                if (next instanceof JSONObject){
                    ConfigAttribute configAttribute = JSON.toJavaObject((JSONObject)next, ConfigAttribute.class);
                    needRole = configAttribute.getAttribute();
                }else {
                    ConfigAttribute configAttribute= (ConfigAttribute)next;
                    needRole = configAttribute.getAttribute();
                }

                for(GrantedAuthority ga : authentication.getAuthorities()) {
                    if(needRole.trim().equals(ga.getAuthority().trim())) {
                        return;
                    }
                }
            }
        }

        throw new AccessDeniedException(ResResultEnum.NO_AUTHENTICATION.getMsg());
    }

    /**
     * 表示此AccessDecisionManager是否能够处理传递的ConfigAttribute呈现的授权请求
     * @param configAttribute
     * @return
     */
    @Override
    public boolean supports(ConfigAttribute configAttribute) {
        return true;
    }

    /**
     * 表示当前AccessDecisionManager实现是否能够为指定的安全对象（方法调用或Web请求）提供访问控制决策
     * @param aClass
     * @return
     */
    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
