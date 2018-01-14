package org.platform.snail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.model.Department;
import org.platform.snail.model.Files;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;

public interface SystemDao {

	/**
	 * @description: init
	 * @createDate: 2017-12-14
	 */
	public abstract int init();

	/**
	 * @description: 根据个人编号获取用户基本信息
	 * @param: userId
	 *             个人编号
	 * @return: Users
	 * @createDate: 2017-12-15
	 */
	public abstract Users selectUsersByUserId(@Param("userId") String userId);

	/**
	 * @description: 根据部门编号获取用户部门基本信息
	 * @param: departmentId
	 *             部门编号
	 * @return: Department
	 * @createDate: 2017-12-15
	 */
	public abstract Department selectDepartmentByDepartmentId(@Param("departmentId") String departmentId);

	/**
	 * @description: 根据个人编号获取用户资源信息
	 * @param: userId
	 *             个人编号
	 * @return: List<Resources>
	 * @createDate: 2017-12-15
	 */
	public abstract List<Resources> selectResourcesByUserId(@Param("userId") String userId,
			@Param("portal") String portal);

	public abstract List<Map<String, String>> selectProvinceTreeList();

	public abstract List<Map<String, String>> selectProvinceTreeListByPid(@Param("pid") String pid,
			@Param("value") String value, @Param("length") int length);

	public abstract int insertFiles(@Param("files") Files files);

	public abstract int updatePassword(@Param("userId") String userId, @Param("password") String password);

	/**
	 * @description: 根据账户名获取用户基本信息
	 * @param: account
	 *             账户名
	 * @return: Users
	 * @createDate: 2017-12-15
	 */
	public abstract Users selectUsersByAccount(@Param("account") String account);

	/**
	 * @description: 查询系统受保护的资源
	 * @param:
	 * @return: Map
	 * @createDate: 2017-12-15
	 */
	public abstract List<Map<String, String>> loadResourceDefine();

	public abstract List<Map<String, String>> selectRoleListByUserId(@Param("userId") String userId);

	public abstract List<Map<String, String>> selectDepartment(@Param("params") Map<String, String> params);

	public abstract List<Map<String, String>> selectUsers(@Param("params") Map<String, Object> params);

	/**
	 * @description: 根据Email获取用户基本信息
	 * @param: email
	 *             email
	 * @return: Users
	 * @createDate: 2014-10-15
	 */
	public abstract Users selectUsersByEmail(@Param("email") String email);
	
	public abstract List<Resources> findAllSystemResources();
	

}
