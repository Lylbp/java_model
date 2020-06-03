package com.lylbp.college.service;

import com.lylbp.college.VO.AdminVO;
import com.lylbp.college.entity.Admin;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 后台管理员 服务类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface AdminService extends IService<Admin> {
    /**
     * 新增或编辑
     *
     * @param adminUser
     * @return
     */
    Boolean insertOrUpdate(Admin adminUser);


    /**
     * 通过查询参数获取列表
     *
     * @param params
     * @return
     */
    List<AdminVO> getListByParams(Map<String, Object> params);

    /**
     * 通过phone获取列表
     *
     * @param phone
     * @return
     */
    List<AdminVO> getListByPhone(String phone);

    /**
     * 通过查询参数获取信息
     *
     * @param params
     * @return
     */
    AdminVO getOneByParams(Map<String, Object> params);

    /**
     * 通过手机号获取信息
     *
     * @param phone
     * @return
     */
    AdminVO getOneByPhone(String phone);

    /**
     * 通过用户id获取信息
     *
     * @param userId
     * @return
     */
    AdminVO getOneByUserId(String userId);

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
    Boolean updateStatusByUserId(String userId);

    /**
     * 通过userId获取信息
     *
     * @param userId
     * @return
     */
    Admin isExistByUserId(String userId);
}
