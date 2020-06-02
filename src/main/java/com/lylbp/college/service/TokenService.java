package com.lylbp.college.service;

/**
 * @Author weiwenbin
 * @Date 2020-03-30 18:25
 */
public interface TokenService {
    /**
     * 通过登录信息创建token
     * @param object
     * @return
     */
    String createToken(Object object);

    /**
     * 获取从头信息token
     *
     * @return
     */
    String getTokenFromHeader();

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
     * 从请求头获取信息
     *
     * @return
     */
    <T>T getUserFromHeader(Class<T> clazz);

    /**
     * 从Token获取信息
     *
     * @return
     */
    <T>T getUserByToken(String token, Class<T> clazz);
}
