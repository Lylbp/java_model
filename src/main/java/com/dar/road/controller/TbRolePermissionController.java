package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.DTO.*;
import com.dar.road.VO.PermissionVO;
import com.dar.road.VO.RolePermissionVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbRolePermission;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.service.TbPermissionService;
import com.dar.road.service.TbRolePermissionService;
import com.dar.road.service.TbRoleService;
import com.github.pagehelper.PageHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

/**
 * @author weiwenbin
 * @Description: TbRolePermissionController类
 * @date 2020/05/11 09:13
 */
@RestController
@RequestMapping("/tbRolePermission")
@Api(tags = "角色权限相关")
public class TbRolePermissionController {
    @Resource
    private TbRolePermissionService rolePermissionService;

    @Resource
    private TbPermissionService permissionService;

    @Resource
    private TbRoleService tbRoleService;

//    @PostMapping("/edit")
//    @ApiOperation("角色权限-添加或编辑")
//    public ResResult insert(@RequestBody RolePermissionEditDTO rolePermissionEditDTO) {
//        TbRolePermission tbRolePermission = new TbRolePermission();
//        BeanUtil.copyProperties(rolePermissionEditDTO, tbRolePermission);
//
//        //数据验证---权限是否存在
//        String permissionId = tbRolePermission.getPermissionId();
//        if (ObjectUtil.isEmpty(permissionService.isExitByPermissionId(permissionId)))
//            return ResResultUtil.makeRsp(ResResultEnum.NO_PERMISSION_EXIT);
//        //数据验证---角色是否存在
//        String roleId = tbRolePermission.getRoleId();
//        if (ObjectUtil.isEmpty(tbRoleService.isExistByRoleId(roleId)))
//            return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
//
//        rolePermissionService.insertOrUpdate(tbRolePermission);
//
//        return ResResultUtil.success();
//    }

    //    @PostMapping("/getList")
//    @ApiOperation("角色权限-列表")
//    public ResResult<List<RolePermissionVO>> getList(@RequestBody RolePermissionQueryDTO rolePermissionQueryDTO) {
//        Map<String, Object> params = BeanUtil.beanToMap(rolePermissionQueryDTO);
//        List<RolePermissionVO> list = rolePermissionService.getListByParams(params);
//
//        return ResResultUtil.success(list);
//    }
    @PostMapping("/batchInsert")
    @ApiOperation("角色权限-批量添加")
    public ResResult batchInsert(@RequestBody RolePermissionBatchEditDTO rolePermissionEditDTO) {
        String roleId = rolePermissionEditDTO.getRoleId();
        List<String> permissionIdList = rolePermissionEditDTO.getPermissionIdList();
        //验证角色是否存在
        if (ObjectUtil.isEmpty(tbRoleService.isExistByRoleId(roleId)))
            return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
        //原有数据is_valid全部变更为0
        //rolePermissionService.updateIsValidByRoleId(rolePermissionEditDTO.getRoleId(), false);

        //批量新增
        List<TbRolePermission> rolePermissions = new ArrayList<>();
        permissionIdList.forEach(permissionId -> {
            if (ObjectUtil.isEmpty(permissionService.isExitByPermissionId(permissionId))) {
                throw new ResResultException(ResResultEnum.NO_PERMISSION_EXIT.getCode(),
                        "权限id为[" + permissionId + "]的" + ResResultEnum.NO_PERMISSION_EXIT.getMsg());
            }

            TbRolePermission tbRolePermission = new TbRolePermission();
            tbRolePermission.setIsValid(true);
            tbRolePermission.setRolePermissionId(IdUtil.simpleUUID());
            tbRolePermission.setPermissionId(permissionId);
            tbRolePermission.setRoleId(roleId);

            rolePermissions.add(tbRolePermission);
        });
        rolePermissionService.batchInsert(rolePermissions);

        return ResResultUtil.success();
    }


    @PostMapping("/batchDeleteByRoleIdAndPermissionIds")
    @ApiOperation("角色权限-根据角色id以及权限ids删除")
    public ResResult batchDeleteByRoleIdAndPermissionIds(@RequestBody @Validated RolePermissionBatchDeleteDTO rolePermissionBatchDeleteDTO) {
        rolePermissionService.batchDeleteByRoleIdAndPermissionIds(rolePermissionBatchDeleteDTO.getRoleId(),
                rolePermissionBatchDeleteDTO.getPermissionIds(), false);

        return ResResultUtil.success();
    }

    @PostMapping("/getRoleNoAssignPermissionList")
    @ApiOperation("角色权限-根据角色id获取未分配权限")
    public ResResult<List<PermissionVO>> getRoleNoAssignPermissionList(@RequestBody @Validated RoleAssignPermissionQueryDTO query) {
        Map<String, Object> params = BeanUtil.beanToMap(query);
        params.remove("roleId");
        List<PermissionVO> list = rolePermissionService.getRoleNoAssignPermissionList(query.getRoleId(), params);

        return ResResultUtil.success(list);
    }


    @PostMapping("/getRoleHasAssignPermissionList")
    @ApiOperation("角色权限-根据角色id获取已分配权限")
    public ResResult<List<PermissionVO>> getRoleHasAssignPermissionList(@RequestBody @Validated RoleAssignPermissionQueryDTO query) {
        Map<String, Object> params = BeanUtil.beanToMap(query);
        params.remove("roleId");
        List<PermissionVO> list = rolePermissionService.getRoleHasAssignPermissionList(query.getRoleId(), params);

        return ResResultUtil.success(list);
    }
}