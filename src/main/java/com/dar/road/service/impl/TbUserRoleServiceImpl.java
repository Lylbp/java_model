package com.dar.road.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.VO.UserRoleVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.mapper.TbUserRoleMapper;
import com.dar.road.entity.TbUserRole;
import com.dar.road.service.TbUserRoleService;
import com.dar.road.core.universal.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbUserRoleService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class TbUserRoleServiceImpl extends AbstractService<TbUserRole> implements TbUserRoleService {

    @Resource
    private TbUserRoleMapper tbUserRoleMapper;

    @Override
    public Integer insertOrUpdate(TbUserRole userRole) {
        String userRoleId = userRole.getUserRoleId();
        TbUserRole dbUserRole = selectById(userRoleId);
        //通过角色id与用户id获取所有的数据
        List<UserRoleVO> list = getListByUserIdAndRoleId(userRole.getUserId(), userRole.getRoleId());

        if (ObjectUtil.isEmpty(dbUserRole)) {
            //数据验证---同一用户下不能有重复的角色
            if (ObjectUtil.isNotEmpty(list)) throw new ResResultException(ResResultEnum.USER_ROLE_EXIT);
            userRole.setUserRoleId(IdUtil.simpleUUID());
            return insert(userRole);
        } else {
            //数据验证---同一用户下不能有重复的角色
            if (list.size() == 1 && userRoleId.equals(list.get(0).getUserRoleId())) {
                return update(userRole);
            }

            throw new ResResultException(ResResultEnum.USER_ROLE_EXIT);
        }
    }

    @Override
    public List<UserRoleVO> getListByParams(Map<String, Object> params) {
        return tbUserRoleMapper.queryByParams(params);
    }

    @Override
    public List<UserRoleVO> getListByUserIdAndRoleId(String userId, String roleId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("roleId", roleId);

        return getListByParams(params);
    }

    @Override
    public Integer batchInsert(List<Object> userRoles) {
        return tbUserRoleMapper.batchInsert(userRoles);
    }

    @Override
    public Integer updateIsValidByUserRoleId(String userRoleId, Boolean isValid) {
        TbUserRole userRole = selectById(userRoleId);
        if (ObjectUtil.isEmpty(userRole)) return 0;

        userRole.setIsValid(isValid);
        return update(userRole);
    }

    @Override
    public Integer updateIsValidByUserId(String userId, Boolean isValid) {
        return tbUserRoleMapper.updateIsValidByUserId(userId, isValid);
    }
}