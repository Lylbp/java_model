package com.lylbp.college.controller.bg;


import cn.hutool.core.bean.BeanUtil;
import com.lylbp.college.DTO.PermissionQueryDTO;
import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.controller.BaseController;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.Permission;
import com.lylbp.college.service.PermissionService;
import com.lylbp.college.service.RolePermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 权限 前端控制器
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@RestController
@RequestMapping("/bg/permission")
@Api(tags = "后台管理-RBAC-权限相关")
public class PermissionController extends BaseController {
    @Resource
    private PermissionService permissionService;

    @Resource
    private RolePermissionService rolePermissionService;

    @PostMapping("/initPermissionData")
    @ApiOperation("RBAC-权限-更新权限源数据")
    @CheckPermission(descrption = "RBAC-权限-更新权限源数据")
    public ResResult initPermissionData() {
        List<Permission> permissions = permissionService.getAllAllPermissionByAnnotation();
        permissionService.installPermissionList(permissions);

        //删除redis中的权限数据
        rolePermissionService.deleteSecurityRedis();

        return ResResultUtil.success();
    }


    @PostMapping("/getAll")
    @ApiOperation("RBAC-权限-所有权限列表")
    @CheckPermission(descrption = "RBAC-权限-所有权限列表")
    public ResResult<List<PermissionVO>> getAll(@RequestBody PermissionQueryDTO permissionQueryDTO) {
        Map<String, Object> params = BeanUtil.beanToMap(permissionQueryDTO);
        List<PermissionVO> list = permissionService.getPermissionByParams(params);

        return ResResultUtil.success(list);
    }

//    @PostMapping("/deleteByPermissionId")
//    @ApiOperation("权限-删除")
//    public ResResult deleteByPermissionId(@RequestBody String permissionId) {
//        permissionService.updateIsValidByPermissionId(permissionId, false);
//
//        return ResResultUtil.success();
//    }
}

