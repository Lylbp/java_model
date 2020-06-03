package com.lylbp.college.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.AdminVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.MD5Util;
import com.lylbp.college.entity.Admin;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.AdminMapper;
import com.lylbp.college.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 后台管理员 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {
    @Resource
    private AdminMapper adminMapper;

    @Override
    public Boolean insertOrUpdate(Admin admin) {
        String userId = admin.getUserId();
        String phone = admin.getPhone();
        Admin dbAdmin = getById(userId);
        if (ObjectUtil.isEmpty(dbAdmin)){
            //账号不能重复
            if (ObjectUtil.isNotEmpty(getOneByPhone(phone))){
                throw new ResResultException(ResResultEnum.ACTION_ADMIN_PHONE_EXIT);
            }
            admin.setUserId(IdUtil.simpleUUID());
            admin.setCreateTime(DateUtil.date());
            admin.setIsValid(true);
            admin.setAccountStatus(true);
            admin.setPwd(MD5Util.MD5(admin.getPhone()));

            return save(admin);
        }else {
            //账号不能重复
            List<AdminVO> AdminUserVOs = getListByPhone(phone);
            if (AdminUserVOs.size() == 0 || (AdminUserVOs.size() == 1 && AdminUserVOs.get(0).getUserId().equals(userId)) ){
                return updateById(admin);
            }

            throw new ResResultException(ResResultEnum.ACTION_ADMIN_PHONE_EXIT);
        }
    }


    @Override
    public List<AdminVO> getListByParams(Map<String, Object> params) {
        return getBaseMapper().queryByParams(params);
    }

    @Override
    public List<AdminVO> getListByPhone(String phone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("phone", phone);

        return getListByParams(params);
    }

    @Override
    public AdminVO getOneByParams(Map<String, Object> params) {
        AdminVO tDarAdminUserVO = null;
        List<AdminVO> list = getBaseMapper().queryByParams(params);
        if (ObjectUtil.isNotEmpty(list)){
            tDarAdminUserVO = list.get(0);
        }

        return tDarAdminUserVO;
    }

    @Override
    public AdminVO getOneByPhone(String phone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("phone", phone);

        return getOneByParams(params);
    }

    @Override
    public AdminVO getOneByUserId(String userId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("userId", userId);

        return getOneByParams(params);
    }

    @Override
    public Integer updateIsValidByUserIds(List<String> userIds, Boolean isValid) {
        return getBaseMapper().updateIsValidByUserIds(userIds, isValid);
    }

    @Override
    public Boolean updateStatusByUserId(String userId) {
        Admin admin = getOneByUserId(userId);
        admin.setAccountStatus(!admin.getAccountStatus());

        return updateById(admin);
    }

    @Override
    public Admin isExistByUserId(String userId) {
        Admin tDarAdminUser = getById(userId);
        if (ObjectUtil.isNotEmpty(tDarAdminUser)  && tDarAdminUser.getIsValid()) {
            return tDarAdminUser;
        }

        return null;
    }
}
