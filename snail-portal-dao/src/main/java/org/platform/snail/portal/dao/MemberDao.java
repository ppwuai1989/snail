package org.platform.snail.portal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.vo.MemberVo;

public interface MemberDao {

	public abstract int init();

	public abstract List<Map<String, String>> findUsersSearchList(@Param("condition") Member condition,
			@Param("start") int start, @Param("limit") int limit, @Param("orderBy") String orderBy);

	public abstract int findUsersSearchCount(@Param("condition") Member condition);

	public abstract int insertUsers(@Param("member") Member member);

	public abstract int updateUsersByPrimaryKey(@Param("member") Member member);

	public abstract int updateUsersStatusByPrimaryKey(@Param("userId") String userId, @Param("status") String status);

	public abstract List<MemberVo> findUsersList(@Param("condition") Member condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy, @Param("agentSearch") String agentSearch,
			@Param("agentSearchId") String agentSearchId);

	public abstract int findUsersCount(@Param("condition") Member condition, @Param("agentSearch") String agentSearch,
			@Param("agentSearchId") String agentSearchId);

	public abstract MemberVo selectMemberVoByPrimaryKey(@Param("userId") String userId);
	
	public abstract MemberVo selectMemberVoByAgentId(@Param("agentId") String agentId);

	public abstract int isExitUsersAccount(@Param("account") String account);

	public abstract int isExitUsersWeChatId(@Param("weChatId") String weChatId);

	public abstract int isExitUsersMobile(@Param("mobile") String mobile);

	// 查询代理账户信息
	public abstract MemberVo findMemberAccountInfo(@Param("agentId") String agentId);

	public abstract int isExitUsersUnionId(@Param("unionId") String unionId);

	public abstract MemberVo selectMemberByUnionId(@Param("unionId") String unionId);

	public abstract int updateMemberUserInfoByUserId(@Param("member") Member member);

	public abstract int registerMemberByWeChat(@Param("member") Member member);
}
