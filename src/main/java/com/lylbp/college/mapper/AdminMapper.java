package com.lylbp.college.mapper;

import com.lylbp.college.VO.AdminVO;
import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.entity.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 后台管理员 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface AdminMapper extends BaseMapper<Admin> {
    SecurityUserVO queryByLoginName(@Param("loginName") String loginName);

    List<AdminVO> queryByParams(@Param("params") Map<String, Object> params);

    Integer updateIsValidByUserIds(@Param("userIdList") List<String> userIdList, @Param("isValid") Boolean isValid);
}
