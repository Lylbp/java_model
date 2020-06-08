package com.lylbp.college.controller.bg;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.QO.UserAssignRoleQO;
import com.lylbp.college.DTO.UserRoleBatchDeleteDTO;
import com.lylbp.college.DTO.UserRoleBatchEditDTO;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.VO.UserRoleVO;
import com.lylbp.college.controller.BaseController;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.UserRole;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.service.AdminService;
import com.lylbp.college.service.RolePermissionService;
import com.lylbp.college.service.RoleService;
import com.lylbp.college.service.UserRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户与角色关系 前端控制器
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@RestController
@RequestMapping("/bg/userRole")
@Api(tags = "后台管理-RBAC-用户与角色关系相关")
public class UserRoleController extends BaseController {
    @Resource
    private UserRoleService userRoleService;

    @Resource
    private RoleService roleService;

    @Resource
    private AdminService adminService;

    @Resource
    private RolePermissionService rolePermissionService;

//    @ApiOperation("用户角色-添加或编辑")
//    @PostMapping("/edit")
//    public ResResult edit(@RequestBody UserRoleEditDTO userRoleEditDTO){
//        UserRole userRole = new UserRole();
//        BeanUtil.copyProperties(userRoleEditDTO, userRole);
//
//        //数据验证---判断角色是否存在
//        Role role = roleService.isExistByRoleId(userRole.getRoleId());
//        if (ObjectUtil.isEmpty(role)) return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
//
//        userRoleService.insertOrUpdate(userRole);
//        return ResResultUtil.success();
//    }
//
//    @ApiOperation("用户角色-列表")
//    @PostMapping("/getList")
//    public ResResult<List<UserRoleVO>> getList(@RequestBody UserRoleQueryDTO userRoleQueryDTO){
//        Map<String, Object> params = BeanUtil.beanToMap(userRoleQueryDTO);
//        List<UserRoleVO> list = userRoleService.getListByParams(params);
//
//        return ResResultUtil.success(list);
//    }

    @ApiOperation("RBAC-用户角色-批量添加")
    @PostMapping("/batchInsert")
    @CheckPermission(descrption = "RBAC-用户角色-批量添加")
    public ResResult batchInsert(@RequestBody UserRoleBatchEditDTO userRoleBatchEditDTO) {
        List<String> roleIds = userRoleBatchEditDTO.getRoleIds();
        String userId = userRoleBatchEditDTO.getUserId();
        if (ObjectUtil.isEmpty(adminService.isExistByUserId(userId))) {
            throw new ResResultException(ResResultEnum.ADMIN_USER_NO_EXIST);
        }

        //原有数据is_valid全部变更为0
        //userRoleService.updateIsValidByUserId(userId, false);

        //批量新增
        List<Object> userRoles = new ArrayList<>();
        roleIds.forEach(roleId -> {
            if (ObjectUtil.isEmpty(roleService.isExistByRoleId(roleId))) {
                throw new ResResultException(ResResultEnum.NO_ROLE_EXIT);
            }

            //通过角色id与用户id获取所有的数据
            List<UserRoleVO> list = userRoleService.getListByUserIdAndRoleId(userId, roleId);
            if (ObjectUtil.isNotEmpty(list)) {
                throw new ResResultException(ResResultEnum.USER_ROLE_EXIT);
            }
            ;
            UserRole userRole = new UserRole();
            userRole.setIsValid(true);
            userRole.setRoleId(roleId);
            userRole.setUserId(userId);

            userRoles.add(userRole);
        });

        userRoleService.batchInsert(userRoles);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }

    @PostMapping("/getRoleAssignData")
    @ApiOperation("RBAC-用户角色-根据用户id获得已分配角色列表")
    @CheckPermission(descrption = "RBAC-用户角色-根据用户id获得已分配角色列表")
    public ResResult<List<RoleVO>> getUserHasAssignRoleList(@RequestBody @Validated UserAssignRoleQO userAssignRoleQO) {
        Map<String, Object> params = BeanUtil.beanToMap(userAssignRoleQO);
        params.remove("userId");
        List<RoleVO> list = userRoleService.getUserHasAssignRoleList(userAssignRoleQO.getUserId(), params);

        return ResResultUtil.success(list);
    }

    @ApiOperation("RBAC-用户角色-根据用户id获得未分配角色列表")
    @PostMapping("/getUserNoAssignRoleList")
    @CheckPermission(descrption = "RBAC-用户角色-根据用户id获得未分配角色列表")
    public ResResult<List<RoleVO>> getUserNoAssignRoleList(@RequestBody @Validated UserAssignRoleQO userAssignRoleQO) {
        Map<String, Object> params = BeanUtil.beanToMap(userAssignRoleQO);
        params.remove("userId");
        List<RoleVO> list = userRoleService.getUserNoAssignRoleList(userAssignRoleQO.getUserId(), params);

        return ResResultUtil.success(list);
    }


    @ApiOperation("RBAC-用户角色-根据用户id以及角色ids批量删除")
    @PostMapping("/batchDeleteByUserIdAndRoleIds")
    @CheckPermission(descrption = "RBAC-用户角色-根据用户id以及角色ids批量删除")
    public ResResult batchDeleteByUserIdAndRoleIds(@RequestBody @Validated UserRoleBatchDeleteDTO userRoleBatchDeleteDTO) {
        List<String> roleIds = userRoleBatchDeleteDTO.getRoleIds();
        String userId = userRoleBatchDeleteDTO.getUserId();
        userRoleService.updateIsValidByUserIdAndRoleIdList(userId, roleIds, false);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }
}

