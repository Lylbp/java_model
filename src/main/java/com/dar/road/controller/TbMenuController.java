package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbMenu;
import com.dar.road.service.TbMenuService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbMenuController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbMenu")
public class TbMenuController {

    @Resource
    private TbMenuService tbMenuService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(TbMenu tbMenu){
        Integer count = tbMenuService.insert(tbMenu);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbMenuService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbMenu tbMenu) {
        Integer count = tbMenuService.update(tbMenu);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TbMenu> selectById(@RequestParam String id) {
        TbMenu tbMenu = tbMenuService.selectById(id);
        return ResResultUtil.success(tbMenu);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbMenu>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TbMenu>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TbMenu> list = tbMenuService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}