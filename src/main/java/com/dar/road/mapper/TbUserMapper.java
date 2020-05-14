package com.dar.road.mapper;

import com.dar.road.VO.Security.SecurityUserVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbUser;
import org.apache.ibatis.annotations.Param;

public interface TbUserMapper extends Mapper<TbUser> {
    SecurityUserVO queryByUserName(@Param("userName") String userName);
}