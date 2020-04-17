package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.SysMenu;
import com.dar.road.service.SysMenuService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: SysMenuController类
* @author weiwenbin
* @date 2020/04/17 16:27
*/
@RestController
@RequestMapping("/sysMenu")
public class SysMenuController {

    @Resource
    private SysMenuService sysMenuService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(SysMenu sysMenu){
        Integer count = sysMenuService.insert(sysMenu);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = sysMenuService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(SysMenu sysMenu) {
        Integer count = sysMenuService.update(sysMenu);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<SysMenu> selectById(@RequestParam String id) {
        SysMenu sysMenu = sysMenuService.selectById(id);
        return ResResultUtil.success(sysMenu);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<SysMenu>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<SysMenu>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<SysMenu> list = sysMenuService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}