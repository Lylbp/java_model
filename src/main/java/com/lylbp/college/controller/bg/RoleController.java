package com.lylbp.college.controller.bg;


import cn.hutool.core.bean.BeanUtil;
import com.lylbp.college.DTO.RoleEditDTO;
import com.lylbp.college.DTO.RoleQueryDTO;
import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.controller.BaseController;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.Role;
import com.lylbp.college.service.RolePermissionService;
import com.lylbp.college.service.RoleService;
import com.lylbp.college.service.UserRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 角色 前端控制器
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@RestController
@RequestMapping("/bg/role")
@Api(tags = "后台管理-RBAC-角色相关")
public class RoleController extends BaseController {
    @Resource
    private RoleService roleService;

    @Resource
    private RolePermissionService rolePermissionService;

    @Resource
    private UserRoleService userRoleService;

    @PostMapping("/list")
    @ApiOperation(value = "RBAC-角色-角色列表")
    @CheckPermission(descrption = "RBAC-角色-角色列表")
    public ResResult<List<RoleVO>> getList(@RequestBody RoleQueryDTO roleQueryDTO) {
        List<RoleVO> list = roleService.getListByParams(BeanUtil.beanToMap(roleQueryDTO));

        return ResResultUtil.success(list);
    }

    @PostMapping(value = "/getInfoByRoleID")
    @ApiOperation("RBAC-角色-通过角色id获取详情")
    @CheckPermission(descrption = "RBAC-角色-通过角色id获取详情")
    public ResResult<RoleVO> getInfoByRoleID(@RequestBody String roleId) {
        RoleVO info = roleService.getInfoByRoleId(roleId);

        return ResResultUtil.success(info);
    }

    @PostMapping("/edit")
    @ApiOperation(value = "RBAC-角色-添加或编辑")
    @CheckPermission(descrption = "RBAC-角色-添加或编辑")
    public ResResult<Integer> edit(@RequestBody RoleEditDTO roleEditDTO) {
        Role role = new Role();
        BeanUtil.copyProperties(roleEditDTO, role);
        roleService.insertOrUpdate(role);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }

    @PostMapping("/deleteByRoleId")
    @ApiOperation(value = "RBAC-角色-根据id删除")
    @CheckPermission(descrption = "RBAC-角色-根据id删除")
    @Transactional
    public ResResult<Integer> deleteById(@RequestBody String roleId) {
        roleService.updateIsValidByRoleId(roleId, false);
        rolePermissionService.updateIsValidByRoleId(roleId, false);
        userRoleService.updateIsValidByRoleId(roleId, false);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }
}

