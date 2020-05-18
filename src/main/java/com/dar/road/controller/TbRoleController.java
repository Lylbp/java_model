package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import com.dar.road.DTO.RoleEditDTO;
import com.dar.road.DTO.RoleQueryDTO;
import com.dar.road.VO.RoleVO;
import com.dar.road.core.annotation.ActionLog;
import com.dar.road.core.annotation.CheckPermission;
import com.dar.road.core.utils.AnnotationUtil;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbRole;
import com.dar.road.service.TbRoleService;
import com.github.pagehelper.PageHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbRoleController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbRole")
@Api(tags = "角色相关")
public class TbRoleController {

    @Resource
    private TbRoleService tbRoleService;
    
    @PostMapping("/edit")
    @ApiOperation(value = "角色-添加或编辑")
    public ResResult<Integer> edit(@RequestBody RoleEditDTO roleEditDTO){
        TbRole role = new TbRole();
        BeanUtil.copyProperties(roleEditDTO, role);
        tbRoleService.insertOrUpdate(role);

        return ResResultUtil.success();
    }

    @PostMapping("/deleteByRoleId")
    @ApiOperation(value = "角色-根据id删除")
    @CheckPermission(descrption = "角色-根据id删除")
    public ResResult<Integer> deleteById(@RequestBody String roleId) {
        tbRoleService.updateIsValidByRoleId(roleId, false);

        return ResResultUtil.success();
    }


    @PostMapping("/list")
    @CheckPermission(descrption = "角色-角色列表")
    @ApiOperation(value = "角色-角色列表")
    public ResResult<List<RoleVO>> selectAll(@RequestBody RoleQueryDTO roleQueryDTO)  {
        List<RoleVO> list = tbRoleService.getListByParams(BeanUtil.beanToMap(roleQueryDTO));

        return ResResultUtil.success(list);
    }
}