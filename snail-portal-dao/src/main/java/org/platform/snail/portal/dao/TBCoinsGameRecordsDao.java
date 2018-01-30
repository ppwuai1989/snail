package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.TBCoinsGameRecords;
import org.platform.snail.portal.vo.TBCoinsGameRecordsVo;

public interface TBCoinsGameRecordsDao {
	
	public abstract int findCount(@Param("condition") TBCoinsGameRecords condition, @Param("agentSearch") String agentSearch,
			@Param("agentSearchId") String agentSearchId);

	public abstract List<TBCoinsGameRecordsVo> findList(@Param("condition") TBCoinsGameRecords condition, @Param("start") int start,
			@Param("limit") int limit, @Param("orderBy") String orderBy, @Param("agentSearch") String agentSearch,
			@Param("agentSearchId") String agentSearchId);


}
