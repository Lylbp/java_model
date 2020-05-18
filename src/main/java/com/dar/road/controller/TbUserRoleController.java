package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.DTO.UserRoleEditDTO;
import com.dar.road.DTO.UserRoleQueryDTO;
import com.dar.road.VO.UserRoleVO;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbRole;
import com.dar.road.entity.TbUserRole;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.service.TbRoleService;
import com.dar.road.service.TbUserRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
* @Description: TbUserRoleController类
* @author weiwenbin
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

    @ApiOperation("用户角色-添加或编辑")
    @PostMapping("/edit")
    public ResResult edit(@RequestBody UserRoleEditDTO userRoleEditDTO){
        TbUserRole userRole = new TbUserRole();
        BeanUtil.copyProperties(userRoleEditDTO, userRole);

        //数据验证---判断角色是否存在
        TbRole role = roleService.isExistByRoleId(userRole.getRoleId());
        if (ObjectUtil.isEmpty(role)) return ResResultUtil.makeRsp(ResResultEnum.NO_ROLE_EXIT);

        tbUserRoleService.insertOrUpdate(userRole);
        return ResResultUtil.success();
    }

    @ApiOperation("用户角色-列表")
    @PostMapping("/getList")
    public ResResult<List<UserRoleVO>> getList(@RequestBody UserRoleQueryDTO userRoleQueryDTO){
        Map<String, Object> params = BeanUtil.beanToMap(userRoleQueryDTO);
        List<UserRoleVO> list = tbUserRoleService.getListByParams(params);

        return ResResultUtil.success(list);
    }

    @ApiOperation("用户角色-删除")
    @PostMapping("/deleteByUserRoleId")
    public ResResult deleteByUserRoleId(@RequestBody String userRoleId){
        tbUserRoleService.updateIsValidByUserRoleId(userRoleId, false);

        return ResResultUtil.success();
    }
}