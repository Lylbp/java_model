package com.lylbp.college.service.impl;

import cn.hutool.core.util.IdUtil;
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
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.manger.redis.BasePrefix;
import com.lylbp.college.manger.redis.service.RedisService;
import com.lylbp.college.mapper.RolePermissionMapper;
import com.lylbp.college.entity.RolePermission;
import com.lylbp.college.service.RolePermissionService;
import com.lylbp.college.core.universal.AbstractService;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author weiwenbin
 * @Description: RolePermissionService接口实现类
 * @date 2020/05/11 09:13
 */
@Service
public class RolePermissionServiceImpl extends AbstractService<RolePermission> implements RolePermissionService {

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @Resource
    private RedisService redisService;

    @Override
    public Integer insertOrUpdate(RolePermission rolePermission) {
        String rolePermissionId = rolePermission.getRolePermissionId();
        RolePermission dbRolePermission = selectById(rolePermissionId);

        //通过角色id以及权限id获取列表
        List<RolePermissionVO> list =
                getListByRoleIdAndPermissionId(rolePermission.getPermissionId(), rolePermission.getRoleId());

        if (ObjectUtil.isEmpty(dbRolePermission)) {
            //数据验证---同一角色下不能有重复的权限
            if (ObjectUtil.isNotEmpty(list)) throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
            rolePermission.setRolePermissionId(IdUtil.simpleUUID());
            return insert(rolePermission);
        } else {
            //数据验证---同一角色下不能有重复的权限
            if (list.size() == 1 && rolePermissionId.equals(list.get(0).getRolePermissionId())) {
                return update(rolePermission);
            }

            throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
        }

    }

    @Override
    public Integer batchInsert(List<RolePermission> rolePermissions) {
        return rolePermissionMapper.batchInsert(rolePermissions);
    }

    @Override
    public Integer updateIsValidByRolePermissionId(String rolePermissionId, Boolean isValid) {
        RolePermission rolePermission = selectById(rolePermissionId);
        if (ObjectUtil.isEmpty(rolePermission)) return 0;
        rolePermission.setIsValid(isValid);

        return update(rolePermission);
    }

    @Override
    public Integer updateIsValidByRoleId(String roleId, Boolean isValid) {
        return rolePermissionMapper.updateIsValidByRoleId(roleId, isValid);
    }

    @Override
    public List<RolePermissionVO> getListByParams(Map<String, Object> params) {
        return rolePermissionMapper.queryByParams(params);
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
        return rolePermissionMapper.batchDeleteByRoleIdAndPermissionIds(roleId, permissionIdList, isValid);
    }

    @Override
    public List<PermissionVO> getRoleNoAssignPermissionList(String roleId, Map<String, Object> params) {
        return rolePermissionMapper.getRoleNoAssignPermissionList(roleId, params);
    }

    @Override
    public List<PermissionVO> getRoleHasAssignPermissionList(String roleId, Map<String, Object> params) {
        return rolePermissionMapper.getRoleHasAssignPermissionList(roleId, params);
    }

    @Override
    public HashMap<String, Collection<ConfigAttribute>> getSecurityByParams(Map<String, Object> params) {
        BasePrefix basePrefix = new BasePrefix(ProjectConstant.REDIS_EXPIRE_SECOND, ProjectConstant.REDIS_PREFIX);
        String redisStr = redisService.get(basePrefix, ProjectConstant.REDIS_ALL_ROLE_PERMISSION, String.class);
        if (ObjectUtil.isEmpty(redisStr) ||  JSONUtil.parseObj(redisStr).size() == 0 || redisStr.equals("{}")) {
            HashMap<String, Collection<ConfigAttribute>> map = new HashMap<>(16);
            //权限资源 和 角色对应的表  也就是 角色权限 中间表
            List<SecurityRolePermissionVO> securityRolePermissionVOS = rolePermissionMapper.securityQueryByParams(new HashMap<String, Object>());
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
            Map mapType = JSON.parseObject(redisStr,Map.class);
            for (Object obj : mapType.keySet()){
                String key = (String)obj;
                Object value = mapType.get(obj);
                Collection<ConfigAttribute> configAttributes = (Collection<ConfigAttribute>)value;
                map.put(key,configAttributes);
            }

            return map;
        }
    }

    @Override
    public Boolean deleteSecurityRedis() {
        /**
         * 删除redis中存储的所有的权限(key:String)与角色集合(value:Collection<ConfigAttribute>)
         * 该值将在com/lylbp/college/core/security/ProjectFilterInvocationSecurityMetadataSource的loadResourceDefine函数
         * 中重新被获取
         */
        return redisService.del(ProjectConstant.REDIS_PREFIX, ProjectConstant.REDIS_ALL_ROLE_PERMISSION);
    }
}