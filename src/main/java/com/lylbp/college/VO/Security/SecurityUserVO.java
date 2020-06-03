package com.lylbp.college.VO.Security;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 上午10:43
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SecurityUserVO implements UserDetails, Serializable {
    /**
     * 用户id
     */
    @ApiModelProperty("用户id")
    private String userId;

    /**
     * 账号
     */
    @ApiModelProperty("账号")
    private String account;

    /**
     * 密码
     */
    @ApiModelProperty("密码")
    private String pwd;

    /**
     * 是否启用
     */
    @ApiModelProperty("是否启用")
    private Boolean isEnabled;

    private List<SecurityRoleVO> authorities;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return this.getPwd();
    }

    @Override
    public String getUsername() {
        return this.getAccount();
    }

    /**
     * 账号是否过期
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * 用户账号是否被锁定
     */
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    /**
     * 用户密码是否过期
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /**
     * 用户是否可用
     */
    @Override
    public boolean isEnabled() {
        return this.isEnabled;
    }
}
