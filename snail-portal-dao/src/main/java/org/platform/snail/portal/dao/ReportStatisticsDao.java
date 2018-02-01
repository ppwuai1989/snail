package org.platform.snail.portal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.platform.snail.portal.model.TBGameReport;
import org.platform.snail.portal.vo.TBGameReportVo;

public interface ReportStatisticsDao {

	public abstract List<TBGameReportVo> tbGameStatistics(@Param("condition") TBGameReport condition,
			@Param("start") int start, @Param("limit") int limit, @Param("orderBy") String orderBy,
			@Param("agentSearch") String agentSearch, @Param("agentSearchId") String agentSearchId);

	public abstract int tbGameStatisticsCount(@Param("condition") TBGameReport condition,
			@Param("agentSearch") String agentSearch, @Param("agentSearchId") String agentSearchId);

}
