package com.lylbp.college.controller.bg;

import cn.hutool.core.bean.BeanUtil;
import com.lylbp.college.DTO.AdminUserEditDTO;
import com.lylbp.college.DTO.AdminUserQueryDTO;
import com.lylbp.college.VO.TDarAdminUserVO;
import com.lylbp.college.core.annotation.CheckPermission;
import com.lylbp.college.core.entity.PageResResult;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.TDarAdminUser;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.service.TDarAdminUserService;
import com.github.pagehelper.PageHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author weiwenbin
 * @Description: TDarAdminUserController类
 * @date 2020/05/22 15:57
 */
@RestController
@RequestMapping("/bg/adminUser")
@Api(tags = "后台管理-后台管理员相关")
public class TDarAdminUserController {
    @Resource
    private TDarAdminUserService tDarAdminUserService;

    @Value("${super-admin-id}")
    private String superAdminUserId;

    @PostMapping(value = "/getList")
    @ApiOperation("后台管理员-获取列表")
    @CheckPermission(descrption = "后台管理员-获取列表")
    public ResResult<PageResResult<TDarAdminUserVO>> getList(@RequestBody AdminUserQueryDTO query,
                                                             @RequestParam(defaultValue = "0") Integer page,
                                                             @RequestParam(defaultValue = "0") Integer size) {
        Map<String, Object> params = BeanUtil.beanToMap(query);

        PageHelper.startPage(page, size);
        List<TDarAdminUserVO> list = tDarAdminUserService.getListByParams(params);

        return ResResultUtil.makePageRsp(list);
    }

    @PostMapping(value = "/getInfoByUserID")
    @ApiOperation("后台管理员-通过用户id获取详情")
    @CheckPermission(descrption = "后台管理员-通过用户id获取详情")
    public ResResult<TDarAdminUserVO> getInfoByUserID(@RequestBody String userId) {
        TDarAdminUserVO tDarAdminUserVO = tDarAdminUserService.getOneByUserId(userId);

        return ResResultUtil.success(tDarAdminUserVO);
    }

    @PostMapping(value = "/edit")
    @ApiOperation("后台管理员-新增或编辑")
    @CheckPermission(descrption = "后台管理员-新增或编辑")
    public ResResult edit(@RequestBody @Validated AdminUserEditDTO adminUserEditDTO) {
        TDarAdminUser adminUser = new TDarAdminUser();
        BeanUtil.copyProperties(adminUserEditDTO, adminUser);
        tDarAdminUserService.insertOrUpdate(adminUser);

        return ResResultUtil.success();
    }

    @PostMapping(value = "/batchDeleteByUserIds")
    @ApiOperation("后台管理员-批量删除")
    @CheckPermission(descrption = "后台管理员-批量删除")
    public ResResult batchDeleteByUserIds(@RequestBody List<String> userIdList) {
        if (userIdList.contains(superAdminUserId)) {
            TDarAdminUser supperAdmin = tDarAdminUserService.selectById(superAdminUserId);
            String content = String.format(
                    ResResultEnum.ACTION_ADMIN_USER_IS_SUPPER.getMsg() + "[用户名:%s,账号:%s]",
                    supperAdmin.getUserName(),
                    supperAdmin.getPhone()
            );
            return ResResultUtil.makeRsp(ResResultEnum.ACTION_ADMIN_USER_IS_SUPPER.getCode(), content);
        }

        tDarAdminUserService.updateIsValidByUserIds(userIdList, false);

        return ResResultUtil.success();
    }

    @PostMapping(value = "/updateStatusByUserId")
    @ApiOperation("后台管理员-修改账号状态")
    @CheckPermission(descrption = "后台管理员-修改账号状态")
    public ResResult updateStatusByUserId(@RequestBody String userId) {
        if (userId.equals(superAdminUserId)) {
            return ResResultUtil.makeRsp(ResResultEnum.ACTION_ADMIN_USER_IS_SUPPER);
        }

        tDarAdminUserService.updateStatusByUserId(userId);

        return ResResultUtil.success();
    }
}