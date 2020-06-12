package com.lylbp.college.mapper;

import com.lylbp.college.entity.Area;
import com.lylbp.college.VO.AreaVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;
/**
 * <p>
 * 地址表 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-12
 */
public interface AreaMapper extends BaseMapper<Area> {
    /**
    * 条件查询List<AreaVO>
    *
    * @param params 查询参数
    * @return List<AreaVO>
    */
    List<AreaVO> queryAreaVOByParams(@Param("params") Map<String, Object> params);
}
