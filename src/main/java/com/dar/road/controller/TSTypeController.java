package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TSType;
import com.dar.road.service.TSTypeService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TSTypeController类
* @author weiwenbin
* @date 2020/04/17 16:34
*/
@RestController
@RequestMapping("/tSType")
public class TSTypeController {

    @Resource
    private TSTypeService tSTypeService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(TSType tSType){
        Integer count = tSTypeService.insert(tSType);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tSTypeService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TSType tSType) {
        Integer count = tSTypeService.update(tSType);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TSType> selectById(@RequestParam String id) {
        TSType tSType = tSTypeService.selectById(id);
        return ResResultUtil.success(tSType);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TSType>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TSType>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TSType> list = tSTypeService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}