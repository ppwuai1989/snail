package org.platform.snail.portal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.model.Role;
import org.platform.snail.portal.vo.RoleVo;

public interface RoleDao {
	public abstract int init();

	public abstract int insertRole(@Param("role") Role role);

	public abstract int updateRoleByPrimaryKey(@Param("role") Role role);

	public abstract int isExitRoleByRoleName(@Param("roleName") String roleName);

	public abstract List<RoleVo> findRoleList(@Param("condition") Role condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy);

	public abstract int findRoleCount(@Param("condition") Role condition);

	public abstract RoleVo selectRoleVoByPrimaryKey(@Param("roleId") String roleId);

	public abstract int deleteRoleByRoleId(@Param("roleId") String roleId);

	public abstract List<Map<String, String>> selectRoleResourceTreeList(@Param("roleId") String roleId);

	public abstract int insertRoleResources(@Param("roleId") String roleId, @Param("resourcesId") String[] resourcesId);

	public abstract int isExitRoleUsedByRoleId(@Param("roleId") String roleId);

}
