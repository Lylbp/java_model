package com.dar.road.controller;

import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbUserRole;
import com.dar.road.service.TbUserRoleService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbUserRoleController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbUserRole")
public class TbUserRoleController {

    @Resource
    private TbUserRoleService tbUserRoleService;

    @PostMapping("/insert")
    public ResResult<Integer> insert(TbUserRole tbUserRole){
        Integer count = tbUserRoleService.insert(tbUserRole);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbUserRoleService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbUserRole tbUserRole) {
        Integer count = tbUserRoleService.update(tbUserRole);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TbUserRole> selectById(@RequestParam String id) {
        TbUserRole tbUserRole = tbUserRoleService.selectById(id);
        return ResResultUtil.success(tbUserRole);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbUserRole>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TbUserRole>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TbUserRole> list = tbUserRoleService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}