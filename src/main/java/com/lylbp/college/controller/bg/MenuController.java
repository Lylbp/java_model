package com.lylbp.college.controller.bg;


import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import com.lylbp.college.DTO.MenuEditDTO;
import com.lylbp.college.DTO.MenuQueryDTO;
import com.lylbp.college.VO.MenuAndRolesVO;
import com.lylbp.college.VO.MenuNodeVO;
import com.lylbp.college.VO.MenuVO;
import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.entity.PageResResult;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.Menu;
import com.lylbp.college.core.enums.ResResultEnum;
import com.lylbp.college.service.MenuRoleService;
import com.lylbp.college.service.MenuService;
import com.lylbp.college.service.TokenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单 前端控制器
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
@RestController
@RequestMapping("/bg/menu")
@Api(tags = "后台管理-RBAC-菜单相关")
public class MenuController {
    @Resource
    private MenuService menuService;

    @Resource
    private MenuRoleService menuRoleService;

    @Resource
    private TokenService tokenService;

    @Value("${super-admin-id}")
    private String superAdminUserId;

    @Value("${security-open}")
    private Boolean securityOpen;

    @PostMapping("/edit")
    @ApiOperation("RBAC-菜单-添加或编辑")
    @CheckPermission(descrption = "RBAC-菜单-添加或编辑")
    @Transactional
    public ResResult edit(@RequestBody MenuEditDTO menuEditDTO){
        //菜单对应权限id移动不能为空
        List<String> roleIds = menuEditDTO.getRoleIds();
        if (ObjectUtil.isEmpty(roleIds)) return ResResultUtil.makeRsp(ResResultEnum.PARAM_VALIDATE_FAILED);
        //添加菜单
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuEditDTO, menu);
        menuService.insertOrUpdate(menu, roleIds);

        return ResResultUtil.success();
    }

    @PostMapping("/deleteByMenuId")
    @ApiOperation("RBAC-菜单-根据菜单id删除")
    @CheckPermission(descrption = "RBAC-菜单-根据菜单id删除")
    @Transactional
    public ResResult deleteByMenuId(@RequestBody @NotBlank String menuId) {
        //设置菜单is_valid
        menuService.updateIsValidByMenuId(menuId, false);
        //设置菜单权限is_valid
        menuRoleService.updateIsValidByMenuId(menuId, false);

        return ResResultUtil.success();
    }

    @PostMapping("/selectByMenuId")
    @ApiOperation("RBAC-菜单-根据菜单id查询信息")
    @CheckPermission(descrption = "RBAC-菜单-根据菜单id查询信息")
    public ResResult<MenuAndRolesVO> selectById(@RequestParam @NotBlank String menuId) {
        MenuAndRolesVO info = menuService.getOneMenuAndRolesVOByMenuId(menuId);

        return ResResultUtil.success(info);
    }

    @PostMapping("/getList")
    @ApiOperation("RBAC-菜单-菜单列表")
    @CheckPermission(descrption = "RBAC-菜单-菜单列表")
    public ResResult<PageResResult<MenuAndRolesVO>> getList(@RequestBody MenuQueryDTO menuQueryDTO,
                                                            @RequestParam(defaultValue = "0") Integer page,
                                                            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        Map<String, Object> params = BeanUtil.beanToMap(menuQueryDTO);
        List<MenuAndRolesVO> list = menuService.getMenuAndRolesVOByParams(params);

        return ResResultUtil.makePageRsp(list);
    }

    @PostMapping("/getSecurityMenuByUserId")
    @ApiOperation("RBAC-菜单-获取当前用户可见菜单")
    @CheckPermission(descrption = "RBAC-菜单-获取当前用户可见菜单")
    public ResResult<List<MenuNodeVO>> getSecurityMenuByUserId(){
        SecurityUserVO user = tokenService.getUserFromHeader(SecurityUserVO.class);
        String userId = user.getUserId();
        //超级管理员查全部
        if (superAdminUserId.equals(user.getUserId()) || securityOpen){
            userId = "";
        }
        List<MenuVO> list = menuService.getSecurityMenuByUserId(userId);

        List<MenuNodeVO> menuNodeVOS = menuService.recursionHandleMenuVOList(list, "0");

        return ResResultUtil.success(menuNodeVOS);
    }
}

