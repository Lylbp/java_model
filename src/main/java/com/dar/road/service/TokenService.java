package com.dar.road.service;

import com.dar.road.VO.Security.UserVO;
import com.dar.road.entity.TbUser;

/**
 * @Author weiwenbin
 * @Date 2020-03-30 18:25
 */
public interface TokenService {
    /**
     * 通过登录信息创建token
     * @param userVO
     * @return
     */
    String createToken(UserVO userVO);

    /**
     * 从请求头验证token
     *
     * @return
     */
    Boolean verifyTokenFromHeader();

    /**
     * 从请求头获取TSysUser
     *
     * @return
     */
    UserVO getTSysUserFromHeader();

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
    TbUser getUserByToken(String token);

    /**
     * 获取从头信息token
     *
     * @return
     */
    String getTokenFromHeader();
}
