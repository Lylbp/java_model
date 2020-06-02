package com.lylbp.college.service;

import com.lylbp.college.VO.TDarAdminUserVO;
import com.lylbp.college.entity.TDarAdminUser;
import com.lylbp.college.core.universal.Service;

import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TDarAdminUserService接口
 * @date 2020/05/22 15:57
 */
public interface TDarAdminUserService extends Service<TDarAdminUser> {
    /**
     * 新增或编辑
     *
     * @param adminUser
     * @return
     */
    Integer insertOrUpdate(TDarAdminUser adminUser);


    /**
     * 通过查询参数获取列表
     *
     * @param params
     * @return
     */
    List<TDarAdminUserVO> getListByParams(Map<String, Object> params);

    /**
     * 通过phone获取列表
     *
     * @param phone
     * @return
     */
    List<TDarAdminUserVO> getListByPhone(String phone);

    /**
     * 通过查询参数获取信息
     *
     * @param params
     * @return
     */
    TDarAdminUserVO getOneByParams(Map<String, Object> params);

    /**
     * 通过手机号获取信息
     *
     * @param phone
     * @return
     */
    TDarAdminUserVO getOneByPhone(String phone);

    /**
     * 通过用户id获取信息
     *
     * @param userId
     * @return
     */
    TDarAdminUserVO getOneByUserId(String userId);

    /**
     * 通过用户id批量修改是否有效
     *
     * @param userIds
     */
    Integer updateIsValidByUserIds(List<String> userIds, Boolean isValid);

    /**
     * 修改账号状态
     * @param userId
     * @return
     */
    Integer updateStatusByUserId(String userId);

    /**
     * 通过userId获取信息
     *
     * @param userId
     * @return
     */
    TDarAdminUser isExistByUserId(String userId);
}