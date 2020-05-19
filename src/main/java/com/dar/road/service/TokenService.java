package com.dar.road.service;

import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.entity.TbUser;

/**
 * @Author weiwenbin
 * @Date 2020-03-30 18:25
 */
public interface TokenService {
    /**
     * 通过登录信息创建token
     * @param securityUserVO
     * @return
     */
    String createToken(SecurityUserVO securityUserVO);

    /**
     * 从请求头验证token
     *
     * @return
     */
    Boolean verifyTokenFromHeader();

    /**
     * 验证token
     *
     * @return
     */
    Boolean verifyToken(String token);

    /**
     * 从请求头获取TSysUser
     *
     * @return
     */
    SecurityUserVO getUserFromHeader();

    /**
     * 从请求头获取TSysUser的id
     *
     * @return
     */
    String getUserIdFromHeader();

    /**
     * 从Token获取TSysUser
     *
     * @return
     */
    SecurityUserVO getUserByToken(String token);

    /**
     * 获取从头信息token
     *
     * @return
     */
    String getTokenFromHeader();
}
