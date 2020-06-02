package com.lylbp.college.VO.Security;

import com.lylbp.college.entity.Role;
import org.springframework.security.core.GrantedAuthority;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 上午11:03
 */
public class SecurityRoleVO extends Role implements GrantedAuthority {
    @Override
    public String getAuthority() {
        return getRoleName();
    }
}
