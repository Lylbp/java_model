package com.lylbp.college.mapper;

import com.lylbp.college.VO.MenuAndRolesVO;
import com.lylbp.college.VO.MenuVO;
import com.lylbp.college.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 菜单 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface MenuMapper extends BaseMapper<Menu> {
    List<MenuVO> queryByParams(@Param("params") Map<String, Object> params);

    List<MenuVO> getSecurityMenuByUserId(@Param("userId") String userId);

    List<MenuAndRolesVO> queryMenuAndRolesVOByParams(@Param("params") Map<String, Object> params);
}
