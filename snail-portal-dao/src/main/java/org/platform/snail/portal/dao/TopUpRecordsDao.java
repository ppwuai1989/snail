package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.vo.TopUpRecordsVo;

public interface TopUpRecordsDao {

	public abstract List<TopUpRecordsVo> findRecordsList(@Param("condition") TopUpRecords condition,
			@Param("start") int start, @Param("limit") int limit, @Param("orderBy") String orderBy,
			@Param("agentSearch") String agentSearch, @Param("agentSearchId") String agentSearchId);

	public abstract int findRecordsListCount(@Param("condition") TopUpRecords condition,
			@Param("agentSearch") String agentSearch, @Param("agentSearchId") String agentSearchId);

	public abstract int insertRecords(@Param("records") TopUpRecords records);
}
