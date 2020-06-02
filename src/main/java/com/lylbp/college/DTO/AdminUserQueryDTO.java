package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/29 上午9:34
 */
@Data
public class AdminUserQueryDTO {
    @ApiModelProperty("手机号模糊查询 传空串此条件不生效")
    String phoneLike;

    @ApiModelProperty("用户名模糊查询 传空串此条件不生效")
    String userNameLike;

    @ApiModelProperty("账号状态模糊查询 传空串此条件不生效")
    String accountStatus;
}
