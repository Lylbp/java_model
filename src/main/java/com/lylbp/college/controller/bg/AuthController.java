package com.lylbp.college.controller.bg;

import cn.hutool.core.util.ObjectUtil;
import com.lylbp.college.DTO.AdminLoginDTO;
import com.lylbp.college.DTO.ChangePassWdDTO;
import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.core.exception.ResResultException;
import com.lylbp.college.core.utils.MD5Util;
import com.lylbp.college.core.utils.ResResultUtil;
import com.lylbp.college.entity.Admin;
import com.lylbp.college.enums.ResResultEnum;
import com.lylbp.college.service.*;
import com.lylbp.college.core.entity.ResResult;
import com.lylbp.college.service.AdminService;
import com.lylbp.college.service.TokenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Author weiwenbin
 * @Date 2020/5/25 上午8:22
 */
@RestController
@RequestMapping("/bg/auth")
@Api(tags = "后台管理-登录相关")
public class AuthController {
    @Resource
    private TokenService tokenService;

    @Resource
    private AuthService authService;

    @Resource
    private AdminService adminService;

    @PostMapping("/login")
    @ApiOperation("后台用户登录")
    public ResResult<String> login(@RequestBody @Validated AdminLoginDTO adminLoginDTO){
        String loginName = adminLoginDTO.getLoginName();
        String pwd = MD5Util.MD5(adminLoginDTO.getPwd());

        SecurityUserVO securityUserVO = (SecurityUserVO)authService.loadUserByUsername(loginName);
        String dbPwd = securityUserVO.getPwd();
        if (!pwd.equals(dbPwd)){
            throw new ResResultException(ResResultEnum.ACCOUNT_LOGIN_ERR);
        }

        String token = tokenService.createToken(securityUserVO);

        return ResResultUtil.success(token);
    }
}
