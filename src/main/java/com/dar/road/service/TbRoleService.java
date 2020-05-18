package com.dar.road.service;

import com.dar.road.VO.RoleVO;
import com.dar.road.entity.TbRole;
import com.dar.road.core.universal.Service;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
* @Description: TbRoleService接口
* @author weiwenbin
* @date 2020/05/11 09:13
*/
public interface TbRoleService extends Service<TbRole> {
    /**
     * 添加或编辑
     * @param tbRole
     * @return
     */
    Integer insertOrUpdate(TbRole tbRole);


    /**
     * 修改是否有效
     *
     * @param roleId
     * @param isValid
     * @return
     */
    Integer updateIsValidByRoleId(String roleId, Boolean isValid);

    /**
     * 根据查询参数获取列表
     *
     * @param params
     * @return
     */
    List<RoleVO> getListByParams(@Param("beanToMap") Map<String, Object> params);

    /**
     * 通过角色id判断数据是否存在
     *
     * @param roleId
     * @return
     */
    TbRole isExistByRoleId(String roleId);

    /**
     * 通过角色名获取数据列表
     *
     * @param roleName
     * @return
     */
    List<RoleVO> getListByRoleName(String roleName);
}