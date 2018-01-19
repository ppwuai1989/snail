package org.platform.snail.portal.service.impl;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.TopUpRecordsDao;
import org.platform.snail.portal.model.TopUpRecords;
import org.platform.snail.portal.service.TopUpRecordsService;
import org.platform.snail.portal.vo.TopUpRecordsVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TopUpRecordsServiceImpl implements TopUpRecordsService {

	@Autowired
	private TopUpRecordsDao topUpRecordsDao;

	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findRecordsList(TopUpRecords condition, int start, int limit, String orderBy,
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
		List<TopUpRecordsVo> list = this.topUpRecordsDao.findRecordsList(condition, start, start + limit, orderBy,
				isSearch, agentId);
		rst.setList(list);
		if (start < 1) {
			int allRows = this.topUpRecordsDao.findRecordsListCount(condition, isSearch, agentId);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	/**
	 * 只是记录表，不需要判断登录逻辑，只有被调用
	 */
	@Override
	public void insertRecords(TopUpRecords records) throws Exception {
		this.topUpRecordsDao.insertRecords(records);
	}

}
