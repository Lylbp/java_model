package com.lylbp.college.mapper;

import com.lylbp.college.VO.RoleVO;
import com.lylbp.college.VO.Security.SecurityRoleVO;
import com.lylbp.college.VO.UserRoleVO;
import com.lylbp.college.entity.UserRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户与角色关系 Mapper 接口
 * </p>
 *
 * @author weiwenbin
 * @since 2020-06-02
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {
    List<SecurityRoleVO> queryListByUserId(@Param("userId") String userId);

    List<UserRoleVO> queryByParams(@Param("params") Map<String, Object> params);

    Integer updateIsValidByUserId(@Param("userId") String userId, @Param("isValid") Boolean isValid);

    Integer batchInsert(@Param("userRoles") List<Object> userRoles);

    List<RoleVO> getUserNoAssignRoleList(@Param("userId") String userId, @Param("params") Map<String, Object> params);

    List<RoleVO> getUserHasAssignRoleList(@Param("userId") String userId, @Param("params") Map<String, Object> params);

    Integer updateIsValidByUserIdAndRoleIdList(@Param("userId") String userId, @Param("roleIdList") List<String> roleIdList,
                                               @Param("isValid") Boolean isValid);

    Integer updateIsValidByRoleId(@Param("roleId") String roleId, @Param("isValid") Boolean isValid);
}
