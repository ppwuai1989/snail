package org.platform.snail.portal.service.impl;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.ReportStatisticsDao;
import org.platform.snail.portal.model.TBGameReport;
import org.platform.snail.portal.service.ReportStatisticsService;
import org.platform.snail.portal.vo.TBGameReportVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportStatisticsServiceImpl implements ReportStatisticsService {

	@Autowired
	private ReportStatisticsDao reportDao;
	
	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse tbGameStatistics(TBGameReport condition, int start, int limit, String orderBy,
			SystemUser systemUser) throws Exception {
		DataResponse rst = new DataResponse();
		// 20180118判断当前用户是否为代理，并查询相应权限的页面
		String isSearch = "";
		String agentId = "";
		// 判断是否为代理登录
		if (systemUser.getAgent() != null) {
			agentId = systemUser.getAgent().getAgentId();
			if (SnailUtils.isNotBlankString(agentId)) {
				isSearch = "1";
			}
		}
		List<TBGameReportVo> list = this.reportDao.tbGameStatistics(condition, start, start + limit, orderBy, isSearch,
				agentId);
		rst.setList(list);
		if (start < 1) {
			int allRows = this.reportDao.tbGameStatisticsCount(condition, isSearch, agentId);
			rst.setAllRows(allRows);
		}
		return rst;
	}

}
