package com.lylbp.college.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.TDarAdminUserVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.MD5Util;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.TDarAdminUserMapper;
import com.lylbp.college.entity.TDarAdminUser;
import com.lylbp.college.service.TDarAdminUserService;
import com.lylbp.college.core.universal.AbstractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @Description: TDarAdminUserService接口实现类
* @author weiwenbin
* @date 2020/05/22 15:57
*/
@Service
public class TDarAdminUserServiceImpl extends AbstractService<TDarAdminUser> implements TDarAdminUserService {

    @Resource
    private TDarAdminUserMapper tDarAdminUserMapper;

    @Override
    public Integer insertOrUpdate(TDarAdminUser adminUser) {
        String userId = adminUser.getUserId();
        String phone = adminUser.getPhone();

        TDarAdminUser dbAdminUser = selectById(userId);
        if (ObjectUtil.isEmpty(dbAdminUser)){
            //账号不能重复
            if (ObjectUtil.isNotEmpty(getOneByPhone(phone))){
                throw new ResResultException(ResResultEnum.ACTION_ADMIN_PHONE_EXIT);
            }
            adminUser.setUserId(IdUtil.simpleUUID());
            adminUser.setCreateTime(DateUtil.date());
            adminUser.setIsValid(true);
            adminUser.setAccountStatus(true);
            adminUser.setPasswd(MD5Util.MD5(adminUser.getPhone()));

            return insert(adminUser);
        }else {
            //账号不能重复
            List<TDarAdminUserVO> AdminUserVOs = getListByPhone(phone);
            if (AdminUserVOs.size() == 0 || (AdminUserVOs.size() == 1 && AdminUserVOs.get(0).getUserId().equals(userId)) ){
                return update(adminUser);
            }

            throw new ResResultException(ResResultEnum.ACTION_ADMIN_PHONE_EXIT);
        }
    }


    @Override
    public List<TDarAdminUserVO> getListByParams(Map<String, Object> params) {
        return tDarAdminUserMapper.queryByParams(params);
    }

    @Override
    public List<TDarAdminUserVO> getListByPhone(String phone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("phone", phone);

        return getListByParams(params);
    }

    @Override
    public TDarAdminUserVO getOneByParams(Map<String, Object> params) {
        TDarAdminUserVO tDarAdminUserVO = null;
        List<TDarAdminUserVO> list = tDarAdminUserMapper.queryByParams(params);
        if (ObjectUtil.isNotEmpty(list)){
            tDarAdminUserVO = list.get(0);
        }

        return tDarAdminUserVO;
    }

    @Override
    public TDarAdminUserVO getOneByPhone(String phone) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("phone", phone);

        return getOneByParams(params);
    }

    @Override
    public TDarAdminUserVO getOneByUserId(String userId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("userId", userId);

        return getOneByParams(params);
    }

    @Override
    public Integer updateIsValidByUserIds(List<String> userIds, Boolean isValid) {
        return tDarAdminUserMapper.updateIsValidByUserIds(userIds, isValid);
    }

    @Override
    public Integer updateStatusByUserId(String userId) {
        TDarAdminUser adminUser = selectById(userId);
        adminUser.setAccountStatus(!adminUser.getAccountStatus());

        return update(adminUser);
    }

    @Override
    public TDarAdminUser isExistByUserId(String userId) {
        TDarAdminUser tDarAdminUser = selectById(userId);
        if (ObjectUtil.isNotEmpty(tDarAdminUser)  && tDarAdminUser.getIsValid()) {
            return tDarAdminUser;
        }

        return null;
    }
}