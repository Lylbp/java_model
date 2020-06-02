package com.lylbp.college.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @Author weiwenbin
 * @Date 2020/5/18 上午8:37
 */
@Data
public class UserRoleBatchDeleteDTO {
    @ApiModelProperty(value = "用户id 必传", required = true)
    @NotBlank
    private String userId;

    @ApiModelProperty(value = "角色id集合", required = true)
    private List<String> roleIds;
}
