package com.lylbp.college.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.VO.RolePermissionVO;
import com.lylbp.college.VO.Security.SecurityRolePermissionVO;
import com.lylbp.college.core.constant.ProjectConstant;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.entity.Permission;
import com.lylbp.college.entity.Role;
import com.lylbp.college.entity.RolePermission;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.manger.redis.BasePrefix;
import com.lylbp.college.manger.redis.service.RedisService;
import com.lylbp.college.mapper.RolePermissionMapper;
import com.lylbp.college.service.RolePermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * <p>
 * 角色与权限关系 服务实现类
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@Service
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements RolePermissionService {
    @Resource
    private RedisService redisService;

    @Override
    public Boolean insertOrUpdate(RolePermission rolePermission) {
        String rolePermissionId = rolePermission.getRolePermissionId();
        RolePermission dbRolePermission = getById(rolePermissionId);

        //通过角色id以及权限id获取列表
        List<RolePermissionVO> list =
                getListByRoleIdAndPermissionId(rolePermission.getPermissionId(), rolePermission.getRoleId());

        if (ObjectUtil.isEmpty(dbRolePermission)) {
            //数据验证---同一角色下不能有重复的权限
            if (ObjectUtil.isNotEmpty(list)) throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
            return save(rolePermission);
        } else {
            //数据验证---同一角色下不能有重复的权限
            if (list.size() == 1 && rolePermissionId.equals(list.get(0).getRolePermissionId())) {
                return updateById(rolePermission);
            }

            throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
        }

    }

    @Override
    public Integer batchInsert(List<RolePermission> rolePermissions) {
        return getBaseMapper().batchInsert(rolePermissions);
    }

    @Override
    public Boolean updateIsValidByRolePermissionId(String rolePermissionId, Boolean isValid) {
        RolePermission rolePermission = getById(rolePermissionId);
        if (ObjectUtil.isEmpty(rolePermission)) return false;
        rolePermission.setIsValid(isValid);

        return updateById(rolePermission);
    }

    @Override
    public Integer updateIsValidByRoleId(String roleId, Boolean isValid) {
        return getBaseMapper().updateIsValidByRoleId(roleId, isValid);
    }

    @Override
    public List<RolePermissionVO> getListByParams(Map<String, Object> params) {
        return getBaseMapper().queryByParams(params);
    }

    @Override
    public List<RolePermissionVO> getListByRoleIdAndPermissionId(String permissionId, String roleId) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("permissionId", permissionId);
        params.put("roleId", roleId);

        return getListByParams(params);
    }

    @Override
    public Integer batchDeleteByRoleIdAndPermissionIds(String roleId, List<String> permissionIdList, boolean isValid) {
        return getBaseMapper().batchDeleteByRoleIdAndPermissionIds(roleId, permissionIdList, isValid);
    }

    @Override
    public List<PermissionVO> getRoleNoAssignPermissionList(String roleId, Map<String, Object> params) {
        return getBaseMapper().getRoleNoAssignPermissionList(roleId, params);
    }

    @Override
    public List<PermissionVO> getRoleHasAssignPermissionList(String roleId, Map<String, Object> params) {
        return getBaseMapper().getRoleHasAssignPermissionList(roleId, params);
    }

    @Override
    public HashMap<String, Collection<ConfigAttribute>> getSecurityByParams(Map<String, Object> params) {
        BasePrefix basePrefix = new BasePrefix(ProjectConstant.REDIS_EXPIRE_SECOND, ProjectConstant.REDIS_PREFIX);
        String redisStr = redisService.get(basePrefix, ProjectConstant.REDIS_ALL_ROLE_PERMISSION, String.class);
        if (ObjectUtil.isEmpty(redisStr) || JSONUtil.parseObj(redisStr).size() == 0 || redisStr.equals("{}")) {
            HashMap<String, Collection<ConfigAttribute>> map = new HashMap<>(16);
            //权限资源 和 角色对应的表  也就是 角色权限 中间表
            List<SecurityRolePermissionVO> securityRolePermissionVOS = getBaseMapper().securityQueryByParams(new HashMap<String, Object>());
            securityRolePermissionVOS.forEach(securityRolePermissionVO -> {
                Role tbRole = securityRolePermissionVO.getRole();
                Permission permission = securityRolePermissionVO.getPermission();

                String roleName = tbRole.getRoleName();
                String permissionUrl = permission.getPermissionUrl();

                ConfigAttribute role = new SecurityConfig(roleName);
                if (map.containsKey(permissionUrl)) {
                    map.get(permissionUrl).add(role);
                } else {
                    List<ConfigAttribute> list = new ArrayList<>();
                    list.add(role);
                    map.put(permissionUrl, list);
                }
            });
            redisService.set(basePrefix, ProjectConstant.REDIS_ALL_ROLE_PERMISSION, JSON.toJSONString(map));

            return map;
        } else {
            HashMap<String, Collection<ConfigAttribute>> map = new HashMap<>(16);
            Map mapType = JSON.parseObject(redisStr, Map.class);
            for (Object obj : mapType.keySet()) {
                String key = (String) obj;
                Object value = mapType.get(obj);
                Collection<ConfigAttribute> configAttributes = (Collection<ConfigAttribute>) value;
                map.put(key, configAttributes);
            }

            return map;
        }
    }

    @Override
    public Boolean deleteSecurityRedis() {
        /**
         * 删除redis中存储的所有的权限(key:String)与角色集合(value:Collection<ConfigAttribute>)
         * 该值将在com/dar/college/core/security/ProjectFilterInvocationSecurityMetadataSource的loadResourceDefine函数
         * 中重新被获取
         */
        return redisService.del(ProjectConstant.REDIS_PREFIX, ProjectConstant.REDIS_ALL_ROLE_PERMISSION);
    }
}
