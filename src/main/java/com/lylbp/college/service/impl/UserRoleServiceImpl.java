package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.VO.UserRoleVO;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.mapper.UserRoleMapper;
import com.lylbp.college.entity.UserRole;
import com.lylbp.college.service.UserRoleService;
import com.lylbp.college.core.universal.AbstractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: UserRoleService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class UserRoleServiceImpl extends AbstractService<UserRole> implements UserRoleService {

    @Resource
    private UserRoleMapper userRoleMapper;

    @Override
    public Integer insertOrUpdate(UserRole userRole) {
        String userRoleId = userRole.getUserRoleId();
        UserRole dbUserRole = selectById(userRoleId);
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
        return userRoleMapper.queryByParams(params);
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
        return userRoleMapper.batchInsert(userRoles);
    }

    @Override
    public List<RoleVO> getUserHasAssignRoleList(String userId, Map<String, Object> params) {
        return userRoleMapper.getUserHasAssignRoleList(userId, params);
    }

    @Override
    public List<RoleVO> getUserNoAssignRoleList(String userId, Map<String, Object> params) {
        return userRoleMapper.getUserNoAssignRoleList(userId, params);
    }

    @Override
    public Integer updateIsValidByUserIdAndRoleIdList(String userId, List<String> roleIdList, Boolean isValid) {
        return userRoleMapper.updateIsValidByUserIdAndRoleIdList(userId, roleIdList,  isValid);
    }

    @Override
    public Integer updateIsValidByUserId(String userId, Boolean isValid) {
        return userRoleMapper.updateIsValidByUserId(userId, isValid);
    }

    @Override
    public Integer updateIsValidByRoleId(String roleId, Boolean isValid) {
        return userRoleMapper.updateIsValidByRoleId(roleId, isValid);
    }
}