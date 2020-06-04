package com.lylbp.college.controller.bg;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.DTO.RoleAssignPermissionQueryDTO;
import com.lylbp.college.DTO.RolePermissionBatchDeleteDTO;
import com.lylbp.college.DTO.RolePermissionBatchEditDTO;
import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.VO.RolePermissionVO;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.RolePermission;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.service.PermissionService;
import com.lylbp.college.service.RolePermissionService;
import com.lylbp.college.service.RoleService;
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
 * 角色与权限关系 前端控制器
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@RestController
@RequestMapping("/bg/rolePermission")
@Api(tags = "后台管理-RBAC-角色与权限关系相关")
public class RolePermissionController {
    @Resource
    private RolePermissionService rolePermissionService;

    @Resource
    private PermissionService permissionService;

    @Resource
    private RoleService roleService;

    //    @PostMapping("/edit")
//    @ApiOperation("角色权限-添加或编辑")
//    public ResResult insert(@RequestBody RolePermissionEditDTO rolePermissionEditDTO) {
//        RolePermission rolePermission = new RolePermission();
//        BeanUtil.copyProperties(rolePermissionEditDTO, rolePermission);
//
//        //数据验证---权限是否存在
//        String permissionId = rolePermission.getPermissionId();
//        if (ObjectUtil.isEmpty(permissionService.isExitByPermissionId(permissionId)))
//            return ResResultUtil.makeRsp(ResResultEnum.NO_PERMISSION_EXIT);
//        //数据验证---角色是否存在
//        String roleId = rolePermission.getRoleId();
//        if (ObjectUtil.isEmpty(roleService.isExistByRoleId(roleId)))
//            return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
//
//        rolePermissionService.insertOrUpdate(rolePermission);
//
//        return ResResultUtil.success();
//    }
//
//    @PostMapping("/getList")
//    @ApiOperation("角色权限-列表")
//    public ResResult<List<RolePermissionVO>> getList(@RequestBody RolePermissionQueryDTO rolePermissionQueryDTO) {
//        Map<String, Object> params = BeanUtil.beanToMap(rolePermissionQueryDTO);
//        List<RolePermissionVO> list = rolePermissionService.getListByParams(params);
//
//        return ResResultUtil.success(list);
//    }
    @PostMapping("/batchInsert")
    @ApiOperation("RBAC-角色权限-批量添加")
    @CheckPermission(descrption = "RBAC-角色权限-批量添加")
    public ResResult batchInsert(@RequestBody RolePermissionBatchEditDTO rolePermissionEditDTO) {
        String roleId = rolePermissionEditDTO.getRoleId();
        List<String> permissionIdList = rolePermissionEditDTO.getPermissionIdList();
        //验证角色是否存在
        if (ObjectUtil.isEmpty(roleService.isExistByRoleId(roleId)))
            return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
        //原有数据is_valid全部变更为0
        //rolePermissionService.updateIsValidByRoleId(rolePermissionEditDTO.getRoleId(), false);

        //批量新增
        List<RolePermission> rolePermissions = new ArrayList<>();
        permissionIdList.forEach(permissionId -> {
            if (ObjectUtil.isEmpty(permissionService.isExitByPermissionId(permissionId))) {
                throw new ResResultException(ResResultEnum.NO_PERMISSION_EXIT.getCode(),
                        "权限id为[" + permissionId + "]的" + ResResultEnum.NO_PERMISSION_EXIT.getMsg());
            }

            //通过角色id以及权限id获取列表
            List<RolePermissionVO> list =
                    rolePermissionService.getListByRoleIdAndPermissionId(permissionId, roleId);
            if (ObjectUtil.isNotEmpty(list)){
                throw new ResResultException(ResResultEnum.ROLE_PERMISSION_EXIT);
            }

            RolePermission rolePermission = new RolePermission();
            rolePermission.setIsValid(true);
            rolePermission.setPermissionId(permissionId);
            rolePermission.setRoleId(roleId);

            rolePermissions.add(rolePermission);
        });
        rolePermissionService.batchInsert(rolePermissions);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }


    @PostMapping("/batchDeleteByRoleIdAndPermissionIds")
    @ApiOperation("RBAC-角色权限-根据角色id以及权限ids删除")
    @CheckPermission(descrption = "RBAC-角色权限-根据角色id以及权限ids删除")
    public ResResult batchDeleteByRoleIdAndPermissionIds(@RequestBody @Validated RolePermissionBatchDeleteDTO rolePermissionBatchDeleteDTO) {
        rolePermissionService.batchDeleteByRoleIdAndPermissionIds(rolePermissionBatchDeleteDTO.getRoleId(),
                rolePermissionBatchDeleteDTO.getPermissionIds(), false);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }

    @PostMapping("/getRoleNoAssignPermissionList")
    @ApiOperation("RBAC-角色权限-根据角色id获取未分配权限列表")
    @CheckPermission(descrption = "RBAC-角色权限-根据角色id获取未分配权限列表")
    public ResResult<List<PermissionVO>> getRoleNoAssignPermissionList(@RequestBody @Validated RoleAssignPermissionQueryDTO query) {
        Map<String, Object> params = BeanUtil.beanToMap(query);
        params.remove("roleId");
        List<PermissionVO> list = rolePermissionService.getRoleNoAssignPermissionList(query.getRoleId(), params);

        return ResResultUtil.success(list);
    }


    @PostMapping("/getRoleHasAssignPermissionList")
    @ApiOperation("RBAC-角色权限-根据角色id获取已分配权限列表")
    @CheckPermission(descrption = "RBAC-角色权限-根据角色id获取已分配权限列表")
    public ResResult<List<PermissionVO>> getRoleHasAssignPermissionList(@RequestBody @Validated RoleAssignPermissionQueryDTO query) {
        Map<String, Object> params = BeanUtil.beanToMap(query);
        params.remove("roleId");
        List<PermissionVO> list = rolePermissionService.getRoleHasAssignPermissionList(query.getRoleId(), params);

        return ResResultUtil.success(list);
    }
}

