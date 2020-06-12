package com.lylbp.college.controller;

import org.springframework.web.bind.annotation.RestController;
import com.lylbp.college.controller.BaseController;


import com.lylbp.college.service.AreaService;
import com.lylbp.college.entity.Area;
import com.lylbp.college.VO.AreaVO;
import com.lylbp.college.QO.AreaQO;
import com.lylbp.college.DTO.AreaDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import io.swagger.annotations.*;
import org.springframework.validation.annotation.*;
import org.springframework.web.bind.annotation.*;
import javax.validation.constraints.*;
import com.lylbp.college.core.entity.PageResResult;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.utils.ResResultUtil;
import cn.hutool.core.bean.BeanUtil;
import com.github.pagehelper.PageHelper;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
/**
 * <p>
 * 地址表 前端控制器
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
@RestController
@RequestMapping("/area")
@Api(tags = "地址表")
public class AreaController extends BaseController {
    @Resource
    private AreaService  service;

    @PostMapping(value = "/getList")
    @ApiOperation("获取AreaVO对象列表")
    public ResResult<PageResResult<AreaVO>> getList(@RequestBody AreaQO query,
    @RequestParam(defaultValue = "0") Integer page,@RequestParam(defaultValue = "0") Integer size) {
            Map<String, Object> params = BeanUtil.beanToMap(query);

            PageHelper.startPage(page, size);
            List<AreaVO> list = service.getAreaVOListByParams(params);

            return ResResultUtil.makePageRsp(list);
    }

    @PostMapping(value = "/edit")
    @ApiOperation("添加或编辑")
    public ResResult edit(@RequestBody @Validated AreaDTO dto) {
        Area entity = new Area();
        BeanUtil.copyProperties(dto, entity);
        service.edit(entity);

        return ResResultUtil.success();
    }

    @PostMapping(value = "/batchDeleteByIds")
    @ApiOperation("通过主键批量删除")
    public ResResult batchDeleteByUserIds(@RequestBody @NotNull List<String> idList) {
        service.removeByIds(idList);
        return ResResultUtil.success();
    }
}

