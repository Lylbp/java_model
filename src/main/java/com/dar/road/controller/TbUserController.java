package com.dar.road.controller;

import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.core.annotation.ActionLog;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.result.PageResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbUser;
import com.dar.road.service.TbUserService;
import com.dar.road.service.TokenService;
import com.github.pagehelper.PageHelper;
import io.swagger.annotations.Api;
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
@Api(tags = "用户相关")
public class TbUserController {

    @Resource
    private TbUserService tbUserService;

    @Resource
    private TokenService tokenService;

    @PostMapping("/testAuth")
    public ResResult<String> testAuth(String userName){
        SecurityUserVO userVOBySecurityUserName = (SecurityUserVO)tbUserService.loadUserByUsername(userName);
        String token = tokenService.createToken(userVOBySecurityUserName);
        return ResResultUtil.success(token);
    }
}