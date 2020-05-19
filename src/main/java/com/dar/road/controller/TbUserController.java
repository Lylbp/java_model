package com.dar.road.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;
import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.core.result.ResResult;
import com.dar.road.core.utils.ResResultUtil;
import com.dar.road.entity.TbUser;
import com.dar.road.service.TbUserService;
import com.dar.road.service.TokenService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class TbUserController implements InitializingBean {

    @Resource
    private TbUserService userService;

    @Resource
    private TokenService tokenService;

    @Value("${super-admin-id}")
    private String superAdminUserId;

    @Value("${super-admin-default-user-name}")
    private String superAdminUserName;

    @Value("${super-admin-default-pwd}")
    private String superAdminUserPwd;

    @PostMapping("/testAuth")
    public ResResult<String> testAuth(String userName){
        SecurityUserVO userVOBySecurityUserName = (SecurityUserVO)userService.loadUserByUsername(userName);
        String token = tokenService.createToken(userVOBySecurityUserName);
        return ResResultUtil.success(token);
    }

    @Override
    public void afterPropertiesSet() {
        List<TbUser> tbUsers = userService.selectAll();
        if (ObjectUtil.isEmpty(tbUsers)){
            Digester md5 = new Digester(DigestAlgorithm.MD5);
            String pwd = md5.digestHex(superAdminUserPwd);
            TbUser tbUser = new TbUser(superAdminUserId, superAdminUserName, pwd);
            userService.insert(tbUser);
        }
    }
}