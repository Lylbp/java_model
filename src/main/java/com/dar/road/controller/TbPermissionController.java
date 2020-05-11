package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbPermission;
import com.dar.road.service.TbPermissionService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbPermissionController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbPermission")
public class TbPermissionController {

    @Resource
    private TbPermissionService tbPermissionService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(TbPermission tbPermission){
        Integer count = tbPermissionService.insert(tbPermission);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbPermissionService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbPermission tbPermission) {
        Integer count = tbPermissionService.update(tbPermission);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TbPermission> selectById(@RequestParam String id) {
        TbPermission tbPermission = tbPermissionService.selectById(id);
        return ResResultUtil.success(tbPermission);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbPermission>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TbPermission>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TbPermission> list = tbPermissionService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}