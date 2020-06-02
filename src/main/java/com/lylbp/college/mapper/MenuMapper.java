package com.lylbp.college.mapper;

import com.lylbp.college.VO.MenuAndRolesVO;
import com.lylbp.college.VO.MenuVO;
import com.lylbp.college.core.universal.Mapper;
import com.lylbp.college.entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MenuMapper extends Mapper<Menu> {
    List<MenuVO> queryByParams(@Param("params") Map<String, Object> params);

    List<MenuVO> getSecurityMenuByUserId(@Param("userId") String userId);

    List<MenuAndRolesVO> queryMenuAndRolesVOByParams(@Param("params") Map<String, Object> params);
}