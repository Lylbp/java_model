package com.dar.road.controller;

import com.dar.road.core.annotation.ActionLog;
import com.dar.road.core.utils.AnnotationUtil;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbRole;
import com.dar.road.service.TbRoleService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbRoleController类
* @author weiwenbin
* @date 2020/05/11 09:13
*/
@RestController
@RequestMapping("/tbRole")
public class TbRoleController {

    @Resource
    private TbRoleService tbRoleService;

    @Resource
    private AnnotationUtil annotationUtil;
    @PostMapping("/insert")
    public ResResult<Integer> insert(TbRole tbRole){
        Integer count = tbRoleService.insert(tbRole);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbRoleService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbRole tbRole) {
        Integer count = tbRoleService.update(tbRole);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    @ActionLog(descrption = "更具id查询")
    public ResResult<TbRole> selectById(@RequestParam String id) {
        TbRole tbRole = tbRoleService.selectById(id);
        return ResResultUtil.success(tbRole);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbRole>>
    */
    @PostMapping("/list")
    @ActionLog(descrption = "分页查询")
    public ResResult<PageResResult<TbRole>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) throws Exception {
        annotationUtil.getAllAddTagAnnotationUrl("classpath*:com/dar/road/controller/**/*.class", ActionLog.class);
        PageHelper.startPage(page, size);
        List<TbRole> list = tbRoleService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}