package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.TBGameReport;

public interface ReportStatisticsService {
	
	public abstract DataResponse tbGameStatistics(TBGameReport condition, int start, int limit, String orderBy,
	SystemUser systemUser) throws Exception;

}
