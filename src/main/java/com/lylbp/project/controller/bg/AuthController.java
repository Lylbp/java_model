package com.lylbp.project.controller.bg;

import com.lylbp.common.constant.ProjectConstant;
import com.lylbp.common.entity.ResResult;
import com.lylbp.common.utils.ResResultUtil;
import com.lylbp.common.utils.TokenUtil;
import com.lylbp.manager.redis.service.RedisService;
import com.lylbp.project.entity.SecurityUser;
import com.lylbp.project.service.AuthService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author weiwenbin
 * @date 2020/7/1 下午2:38
 */
@RestController
@RequestMapping("/bg/auth")
@Api(tags = "登录相关")
public class AuthController {
    @Resource
    private AuthService authService;
    @Resource
    private RedisService redisService;

    @PostMapping("/login")
    @ApiOperation("后台用户登录")
    public ResResult<String> login() {
        SecurityUser securityUser = authService.login("admin", "admin");
        //token存redis
        String token = TokenUtil.createToken(securityUser, ProjectConstant.JWT_EXPIRE_TIME);
        redisService.strSet(authService.getRedisTokenKey(token), token, ProjectConstant.JWT_EXPIRE_TIME);

        return ResResultUtil.success(token);
    }

    @PostMapping("/test")
    @ApiOperation("测试")
    public ResResult<String> test() {
        return ResResultUtil.success("测试");
    }
}
