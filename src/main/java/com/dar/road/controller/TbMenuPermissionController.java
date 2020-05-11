package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbMenuPermission;
import com.dar.road.service.TbMenuPermissionService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbMenuPermissionController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbMenuPermission")
public class TbMenuPermissionController {

    @Resource
    private TbMenuPermissionService tbMenuPermissionService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(TbMenuPermission tbMenuPermission){
        Integer count = tbMenuPermissionService.insert(tbMenuPermission);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbMenuPermissionService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbMenuPermission tbMenuPermission) {
        Integer count = tbMenuPermissionService.update(tbMenuPermission);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TbMenuPermission> selectById(@RequestParam String id) {
        TbMenuPermission tbMenuPermission = tbMenuPermissionService.selectById(id);
        return ResResultUtil.success(tbMenuPermission);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbMenuPermission>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TbMenuPermission>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TbMenuPermission> list = tbMenuPermissionService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}