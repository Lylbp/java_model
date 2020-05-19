package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import com.dar.road.DTO.PermissionQueryDTO;
import com.dar.road.VO.PermissionVO;
import com.dar.road.core.annotation.CheckPermission;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbPermission;
import com.dar.road.service.TbPermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TbPermissionController类
 * @date 2020/05/11 09:13
 */
@RestController
@RequestMapping("/tbPermission")
@Api(tags = "权限相关")
public class TbPermissionController {

    @Resource
    private TbPermissionService tbPermissionService;

    @PostMapping("/initPermissionData")
    @ApiOperation("权限-更新权限源数据")
    @CheckPermission(descrption = "权限-更新权限源数据")
    public ResResult initPermissionData() {
        List<TbPermission> permissions = tbPermissionService.getAllAllPermissionByAnnotation();
        tbPermissionService.installPermissionList(permissions);

        return ResResultUtil.success();
    }


    @PostMapping("/getAll")
    @ApiOperation("权限-所有权限列表")
    @CheckPermission(descrption = "权限-所有权限列表")
    public ResResult<List<PermissionVO>> getAll(@RequestBody PermissionQueryDTO permissionQueryDTO) {
        Map<String, Object> params = BeanUtil.beanToMap(permissionQueryDTO);
        List<PermissionVO> list = tbPermissionService.getPermissionByParams(params);

        return ResResultUtil.success(list);
    }

//    @PostMapping("/deleteByPermissionId")
//    @ApiOperation("权限-删除")
//    public ResResult deleteByPermissionId(@RequestBody String permissionId) {
//        tbPermissionService.updateIsValidByPermissionId(permissionId, false);
//
//        return ResResultUtil.success();
//    }
}