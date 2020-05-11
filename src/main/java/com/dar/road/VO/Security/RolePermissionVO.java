package com.dar.road.VO.Security;

import com.dar.road.entity.TbPermission;
import com.dar.road.entity.TbRole;
import com.dar.road.entity.TbRolePermission;
import lombok.Data;

/**
 * @Author weiwenbin
 * @Date 2020/5/11 下午2:22
 */
@Data
public class RolePermissionVO extends TbRolePermission {
    private TbRole tbRole;

    private TbPermission tbPermission;
}
