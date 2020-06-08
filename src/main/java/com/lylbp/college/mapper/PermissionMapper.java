package com.lylbp.college.mapper;

import com.lylbp.college.VO.PermissionVO;
import com.lylbp.college.entity.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 权限 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface PermissionMapper extends BaseMapper<Permission> {
    /**
     * 条件查询
     *
     * @param params
     * @return
     */
    List<PermissionVO> queryByParams(@Param("params") Map<String, Object> params);
}
