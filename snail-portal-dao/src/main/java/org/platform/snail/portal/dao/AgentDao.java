package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.Agent;
import org.platform.snail.portal.vo.AgentVo;

public interface AgentDao {

	public abstract int findAgentListCount(@Param("condition") Agent condition);

	public abstract List<AgentVo> findAgentList(@Param("condition") Agent condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy);

	public abstract int updateAgentByAgentId(@Param("agent") Agent agent);

}
