package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.DTO.RolePermissionEditDTO;
import com.dar.road.DTO.RolePermissionQueryDTO;
import com.dar.road.VO.RolePermissionVO;
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
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    @PostMapping("/edit")
    @ApiOperation("角色权限-添加或编辑")
    public ResResult insert(@RequestBody RolePermissionEditDTO rolePermissionEditDTO) {
        TbRolePermission tbRolePermission = new TbRolePermission();
        BeanUtil.copyProperties(rolePermissionEditDTO, tbRolePermission);

        //数据验证---权限是否存在
        String permissionId = tbRolePermission.getPermissionId();
        if (ObjectUtil.isEmpty(permissionService.isExitByPermissionId(permissionId)))
            return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);
        //数据验证---角色是否存在
        String roleId = tbRolePermission.getRoleId();
        if (ObjectUtil.isEmpty(tbRoleService.isExistByRoleId(roleId))) return ResResultUtil.makeRsp(ResResultEnum.NO_PERMISSION_EXIT);

        rolePermissionService.insertOrUpdate(tbRolePermission);

        return ResResultUtil.success();
    }

    @PostMapping("/deleteByRolePermissionId")
    @ApiOperation("角色权限-删除")
    public ResResult deleteByRolePermissionId(@RequestBody String rolePermissionId) {
        Integer count = rolePermissionService.updateIsValidByRolePermissionId(rolePermissionId, false);
        return ResResultUtil.success(count);
    }

    @PostMapping("/getList")
    @ApiOperation("角色权限-列表")
    public ResResult<List<RolePermissionVO>> getList(@RequestBody RolePermissionQueryDTO rolePermissionQueryDTO) {
        Map<String, Object> params = BeanUtil.beanToMap(rolePermissionQueryDTO);
        List<RolePermissionVO> list = rolePermissionService.getListByParams(params);

        return ResResultUtil.success(list);
    }
}