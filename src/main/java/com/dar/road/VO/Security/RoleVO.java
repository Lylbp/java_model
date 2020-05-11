package com.dar.road.VO.Security;

import com.dar.road.entity.TbRole;
import org.springframework.security.core.GrantedAuthority;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 上午11:03
 */
public class RoleVO extends TbRole implements GrantedAuthority {
    @Override
    public String getAuthority() {
        return getRoleName();
    }
}
