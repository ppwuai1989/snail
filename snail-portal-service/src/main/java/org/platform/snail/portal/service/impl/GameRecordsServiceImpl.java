package org.platform.snail.portal.service.impl;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.GameRecordsDao;
import org.platform.snail.portal.model.GameRecords;
import org.platform.snail.portal.service.GameRecordsService;
import org.platform.snail.portal.vo.GameRecordsVo;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GameRecordsServiceImpl implements GameRecordsService {

	@Autowired
	private GameRecordsDao recordsDao;

	@Override
	public DataResponse findRecordsList(GameRecords condition, int start, int limit, String orderBy,
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
		List<GameRecordsVo> list = this.recordsDao.findList(condition, start, start + limit, orderBy, isSearch, agentId);
		rst.setList(list);
		if (start < 1) {
			int allRows = this.recordsDao.findCount(condition, isSearch, agentId);
			rst.setAllRows(allRows);
		}		
		return rst;
	}

}
