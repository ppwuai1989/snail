package org.platform.snail.portal.service.impl;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.AgentDao;
import org.platform.snail.portal.dao.UsersDao;
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
	private UsersDao usersDao;

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
		// 判断更改的等级，向角色权限表中做更新，再更新会员表中的代理信息
		String[] roleId = null;
		switch (agent.getAgentLevel()) {
		case CommonKeys.junior:
			if (SnailUtils.isBlankString(agent.getParentAgentId())) {
				return new DataResponse(false, "您必须为初级代理指定一个上级！");
			} else {
				roleId = new String[] { CommonKeys.juniorAgent };
			}
			break;
		case CommonKeys.medium:
			if (SnailUtils.isBlankString(agent.getParentAgentId())) {
				return new DataResponse(false, "您必须为中级代理指定一个上级！");
			} else {
				roleId = new String[] { CommonKeys.mediumAgent };
			}
			break;
		case CommonKeys.senior:
			agent.setParentAgentId(null);
			roleId = new String[] { CommonKeys.seniorAgent };
			break;
		}
		this.usersDao.insertUsersRole(agent.getAgentId(), roleId);// 修改相应权限
		// 更新代理信息 做日志记录
		AgentVo o = this.agentDao.selectAgentByAgentId(agent.getAgentId());
		int update = this.agentDao.updateAgentByAgentId(agent);
		if (update > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", o.toString(), agent.toString(),
					"代理管理-id为" + agent.getAgentId(), systemUser, "27");
		}
		return new DataResponse(true, "更新成功！");
	}

}
