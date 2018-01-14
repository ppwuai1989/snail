package org.platform.snail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.model.Agent;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;

public interface LoginDao {
	/**
	 * @description: init
	 * @createDate: 2017-12-14
	 */
	public abstract int init();

	/**
	 * @description: 根据账户名获取用户基本信息
	 * @param: account
	 *             账户名
	 * @return: Users
	 * @createDate: 2017-12-15
	 */
	public abstract Users selectUsersByAccount(@Param("account") String account);

	/**
	 * @description: 根据个人编号获取用户资源信息
	 * @param: userId
	 *             个人编号
	 * @return: List<Resources>
	 * @createDate: 2017-12-15
	 */
	public abstract List<Resources> selectResourcesByUserId(@Param("userId") String userId,
			@Param("portal") String portal);

	/**
	 * 刷新登录时间
	 */
	public abstract int updateUsersLastLoginTimeByPrimaryKey(@Param("userId") String userId);

	/**
	 * 根据id找到代理信息
	 * @param agentId
	 * @return
	 */
	public abstract Agent selectAgentById(@Param("agentId") String agentId);

}
