package com.lylbp.college.mapper;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.core.universal.Mapper;
import com.lylbp.college.entity.MenuRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuRoleMapper extends Mapper<MenuRole> {
    Integer updateIsValidByMenuId(@Param("menuId") String menuId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("menuRoleList") List<MenuRole> menuRoleList);

    List<RoleVO> queryRoleListByMenuId(@Param("menuId") String menuId);
}