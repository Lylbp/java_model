package com.lylbp.college.mapper;

import com.lylbp.college.VO.Security.SecurityUserVO;
import com.lylbp.college.VO.TDarAdminUserVO;
import com.lylbp.college.core.universal.Mapper;
import com.lylbp.college.entity.TDarAdminUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TDarAdminUserMapper extends Mapper<TDarAdminUser> {
    SecurityUserVO queryByLoginName(@Param("loginName") String loginName);

    List<TDarAdminUserVO> queryByParams(@Param("params") Map<String, Object> params);

    Integer updateIsValidByUserIds(@Param("userIdList") List<String> userIdList, @Param("isValid") Boolean isValid);
}