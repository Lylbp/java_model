package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.DTO.*;
import com.dar.road.VO.RoleVO;
import com.dar.road.core.exception.ResResultException;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbUserRole;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.service.TbRoleService;
import com.dar.road.service.TbUserRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbUserRoleController类
 * @date 2020/05/11 09:13
 */
@RestController
@RequestMapping("/tbUserRole")
@Api(tags = "用户角色相关")
public class TbUserRoleController {
    @Resource
    private TbUserRoleService tbUserRoleService;

    @Resource
    private TbRoleService roleService;

//    @ApiOperation("用户角色-添加或编辑")
//    @PostMapping("/edit")
//    public ResResult edit(@RequestBody UserRoleEditDTO userRoleEditDTO){
//        TbUserRole userRole = new TbUserRole();
//        BeanUtil.copyProperties(userRoleEditDTO, userRole);
//
//        //数据验证---判断角色是否存在
//        TbRole role = roleService.isExistByRoleId(userRole.getRoleId());
//        if (ObjectUtil.isEmpty(role)) return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
//
//        tbUserRoleService.insertOrUpdate(userRole);
//        return ResResultUtil.success();
//    }

//    @ApiOperation("用户角色-列表")
//    @PostMapping("/getList")
//    public ResResult<List<UserRoleVO>> getList(@RequestBody UserRoleQueryDTO userRoleQueryDTO){
//        Map<String, Object> params = BeanUtil.beanToMap(userRoleQueryDTO);
//        List<UserRoleVO> list = tbUserRoleService.getListByParams(params);
//
//        return ResResultUtil.success(list);
//    }

    @ApiOperation("用户角色-批量添加")
    @PostMapping("/batchInsert")
    public ResResult batchInsert(@RequestBody UserRoleBatchEditDTO userRoleBatchEditDTO) {
        List<String> roleIds = userRoleBatchEditDTO.getRoleIds();
        String userId = userRoleBatchEditDTO.getUserId();

        //原有数据is_valid全部变更为0
        //tbUserRoleService.updateIsValidByUserId(userId, false);

        //批量新增
        List<Object> userRoles = new ArrayList<>();
        roleIds.forEach(roleId -> {
            if (ObjectUtil.isEmpty(roleService.isExistByRoleId(roleId))) {
                throw new ResResultException(ResResultEnum.NO_ROLE_EXIT);
            }

            TbUserRole userRole = new TbUserRole();
            userRole.setIsValid(true);
            userRole.setUserRoleId(IdUtil.simpleUUID());
            userRole.setRoleId(roleId);
            userRole.setUserId(userId);

            userRoles.add(userRole);
        });

        tbUserRoleService.batchInsert(userRoles);

        return ResResultUtil.success();
    }

    @ApiOperation("用户角色-根据用户id获得已分配角色列表")
    @PostMapping("/getRoleAssignData")
    public ResResult<List<RoleVO>> getUserHasAssignRoleList(@RequestBody @Validated UserAssignRoleQueryDTO userAssignRoleQueryDTO) {
        Map<String, Object> params = BeanUtil.beanToMap(userAssignRoleQueryDTO);
        params.remove("userId");
        List<RoleVO> list = tbUserRoleService.getUserHasAssignRoleList(userAssignRoleQueryDTO.getUserId(), params);

        return ResResultUtil.success(list);
    }

    @ApiOperation("用户角色-根据用户id获得未分配角色列表")
    @PostMapping("/getUserNoAssignRoleList")
    public ResResult<List<RoleVO>> getUserNoAssignRoleList(@RequestBody @Validated UserAssignRoleQueryDTO userAssignRoleQueryDTO) {
        Map<String, Object> params = BeanUtil.beanToMap(userAssignRoleQueryDTO);
        params.remove("userId");
        List<RoleVO> list = tbUserRoleService.getUserNoAssignRoleList(userAssignRoleQueryDTO.getUserId(), params);

        return ResResultUtil.success(list);
    }


    @ApiOperation("用户角色-根据用户id以及角色ids批量删除")
    @PostMapping("/batchDeleteByUserIdAndRoleIds")
    public ResResult batchDeleteByUserIdAndRoleIds(@RequestBody @Validated UserRoleBatchDeleteDTO userRoleBatchDeleteDTO) {
        List<String> roleIds = userRoleBatchDeleteDTO.getRoleIds();
        String userId = userRoleBatchDeleteDTO.getUserId();
        tbUserRoleService.updateIsValidByUserIdAndRoleIdList(userId, roleIds, false);

        return ResResultUtil.success();
    }
}