package com.dar.road.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.dar.road.DTO.MenuEditDTO;
import com.dar.road.VO.MenuNodeVO;
import com.dar.road.VO.MenuVO;
import com.dar.road.core.annotation.CheckPermission;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbMenu;
import com.dar.road.entity.TbUser;
import com.dar.road.enums.ResResultEnum;
import com.dar.road.service.TbMenuPermissionService;
import com.dar.road.service.TbMenuService;
import com.dar.road.service.TokenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
* @Description: TbMenuController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbMenu")
@Api(tags = "菜单相关")
public class TbMenuController {

    @Resource
    private TbMenuService tbMenuService;

    @Resource
    private TbMenuPermissionService menuPermissionService;

    @Resource
    private TokenService tokenService;

    @Value("${super-admin-id}")
    private String superAdminUserId;

    @Value("${security-open}")
    private Boolean securityOpen;

    @PostMapping("/edit")
    @ApiOperation("菜单-添加或编辑")
    @CheckPermission(descrption = "菜单-添加或编辑")
    @Transactional
    public ResResult edit(@RequestBody MenuEditDTO menuEditDTO){
        //菜单对应权限id移动不能为空
        List<String> permissionIds = menuEditDTO.getPermissionIds();
        if (ObjectUtil.isEmpty(permissionIds)) return ResResultUtil.makeRsp(ResResultEnum.PARAM_VALIDATE_FAILED);
        //添加菜单
        TbMenu menu = new TbMenu();
        BeanUtil.copyProperties(menuEditDTO, menu);
        tbMenuService.insertOrUpdate(menu, permissionIds);

        return ResResultUtil.success();
    }

    @PostMapping("/deleteByMenuId")
    @ApiOperation("菜单-根据菜单id删除")
    @CheckPermission(descrption = "菜单-根据菜单id删除")
    @Transactional
    public ResResult<Integer> deleteByMenuId(@RequestBody @NotBlank String menuId) {
        //设置菜单is_valid
        tbMenuService.updateIsValidByMenuId(menuId, false);
        //设置菜单权限is_valid
        menuPermissionService.updateIsValidByMenuId(menuId, false);

        return ResResultUtil.success();
    }

    @PostMapping("/selectByMenuId")
    @ApiOperation("菜单-根据菜单id查询信息")
    @CheckPermission(descrption = "菜单-根据菜单id查询信息")
    public ResResult<TbMenu> selectById(@RequestParam @NotBlank String menuId) {
        TbMenu tbMenu = tbMenuService.selectById(menuId);
        return ResResultUtil.success(tbMenu);
    }

    @PostMapping("/getSecurityMenuByUserId")
    @ApiOperation("菜单-获取当前用户可见菜单")
    @CheckPermission(descrption = "菜单-获取当前用户可见菜单")
    public ResResult<List<MenuNodeVO>> getSecurityMenuByUserId(){
        TbUser user = tokenService.getUserFromHeader(TbUser.class);
        String userId = user.getUserId();
        //超级管理员查全部
        if (superAdminUserId.equals(user.getUserId()) || securityOpen){
            userId = "";
        }
        List<MenuVO> list = tbMenuService.getSecurityMenuByUserId(userId);

        List<MenuNodeVO> menuNodeVOS = tbMenuService.recursionHandleMenuVOList(list, "0");

        return ResResultUtil.success(menuNodeVOS);
    }

}