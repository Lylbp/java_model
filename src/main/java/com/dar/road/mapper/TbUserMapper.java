package com.dar.road.mapper;

import com.dar.road.VO.Security.UserVO;
import com.dar.road.core.universal.Mapper;
import com.dar.road.entity.TbUser;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface TbUserMapper extends Mapper<TbUser> {
    UserVO queryByUserName(@Param("userName") String userName);
}