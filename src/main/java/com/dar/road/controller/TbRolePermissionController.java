package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbRolePermission;
import com.dar.road.service.TbRolePermissionService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbRolePermissionController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbRolePermission")
public class TbRolePermissionController {

    @Resource
    private TbRolePermissionService tbRolePermissionService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(TbRolePermission tbRolePermission){
        Integer count = tbRolePermissionService.insert(tbRolePermission);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbRolePermissionService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbRolePermission tbRolePermission) {
        Integer count = tbRolePermissionService.update(tbRolePermission);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TbRolePermission> selectById(@RequestParam String id) {
        TbRolePermission tbRolePermission = tbRolePermissionService.selectById(id);
        return ResResultUtil.success(tbRolePermission);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbRolePermission>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TbRolePermission>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TbRolePermission> list = tbRolePermissionService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}