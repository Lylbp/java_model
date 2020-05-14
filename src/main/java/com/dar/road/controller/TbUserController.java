package com.dar.road.controller;

import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbUser;
import com.dar.road.service.TbUserService;
import com.dar.road.service.TokenService;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
* @Description: TbUserController类
* @author weiwenbin
* @date 2020/05/11 09:24
*/
@RestController
@RequestMapping("/tbUser")
public class TbUserController {

    @Resource
    private TbUserService tbUserService;

    @Resource
    private TokenService tokenService;

    @PostMapping("/testAuth")
    public ResResult<String> testAuth(String userName){
        SecurityUserVO userVOBySecurityUserName = tbUserService.getUserVOByUserName(userName);
        String token = tokenService.createToken(userVOBySecurityUserName);
        return ResResultUtil.success(token);
    }

    @PostMapping("/insert")
    public ResResult<Integer> insert(TbUser tbUser){
        Integer count = tbUserService.insert(tbUser);
        return ResResultUtil.success(count);
    }

    @PostMapping("/deleteById")
    public ResResult<Integer> deleteById(@RequestParam String id) {
        Integer count = tbUserService.deleteById(id);
        return ResResultUtil.success(count);
    }

    @PostMapping("/update")
    public ResResult<Integer> update(TbUser tbUser) {
        Integer count = tbUserService.update(tbUser);
        return ResResultUtil.success(count);
    }

    @PostMapping("/selectById")
    public ResResult<TbUser> selectById(@RequestParam String id) {
        TbUser tbUser = tbUserService.selectById(id);
        return ResResultUtil.success(tbUser);
    }

    /**
    * @Description: 分页查询
    * @param page 页码
    * @param size 每页条数
    * @Reutrn ResResult<PageResResult<TbUser>>
    */
    @PostMapping("/list")
    public ResResult<PageResResult<TbUser>> selectAll(@RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<TbUser> list = tbUserService.selectAll();

        return ResResultUtil.makePageRsp(list);
    }
}