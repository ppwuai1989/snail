package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.GameRecords;
import org.platform.snail.portal.vo.GameRecordsVo;

public interface GameRecordsDao {

	public abstract int findCount(@Param("condition") GameRecords condition, @Param("agentSearch") String agentSearch,
			@Param("agentSearchId") String agentSearchId);

	public abstract List<GameRecordsVo> findList(@Param("condition") GameRecords condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy, @Param("agentSearch") String agentSearch,
			@Param("agentSearchId") String agentSearchId);

}
