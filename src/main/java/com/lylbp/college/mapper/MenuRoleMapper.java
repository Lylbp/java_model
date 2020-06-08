package com.lylbp.college.mapper;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.entity.MenuRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单与角色关系 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface MenuRoleMapper extends BaseMapper<MenuRole> {
    Integer updateIsValidByMenuId(@Param("menuId") String menuId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("menuRoleList") List<MenuRole> menuRoleList);

    List<RoleVO> queryRoleListByMenuId(@Param("menuId") String menuId);
}
