package org.platform.snail.portal.service.impl;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.AgentDao;
import org.platform.snail.portal.model.Agent;
import org.platform.snail.portal.service.AgentService;
import org.platform.snail.portal.vo.AgentVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("agentService")
public class AgentServiceImpl implements AgentService {

	@Autowired
	private AgentDao agentDao;
	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findAgentList(Agent condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<AgentVo> list = this.agentDao.findAgentList(condition, start, limit, orderBy);
		rst.setList(list);
		if (start < 1) {
			int allRows = this.agentDao.findAgentListCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse updateAgentByAgentId(JSONObject jsonObject, SystemUser systemUser) throws Exception {
		Agent agent = new Agent();
		SnailBeanUtils.copyProperties(agent, jsonObject);
		if (SnailUtils.isBlankString(agent.getName())) {
			return new DataResponse(false, "游戏昵称不能为空!");
		}
		if (SnailUtils.isBlankString(agent.getSex())) {
			return new DataResponse(false, "性别不能为空!");
		}
		if (agent.getAgentLevel().equals("3")) {
			// 升级为高级代理将移除其上级代理
			agent.setParentAgentId(null);
		}
		AgentVo o = this.agentDao.findAgentList(agent, 1, 1, "").get(0);
		int update = this.agentDao.updateAgentByAgentId(agent);
		if (update > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", o.toString(), agent.toString(),
					"代理管理-id为" + agent.getAgentId(), systemUser, "27");
		}
		return null;
	}

}
