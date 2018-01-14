package org.platform.snail.portal.web.action;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.Agent;
import org.platform.snail.portal.service.AgentService;
import org.platform.snail.utils.Page;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/agent")
public class AgentAction extends BaseController {

	private static final long serialVersionUID = 1L;
	Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private AgentService agentService;

	@RequestMapping(value = "/findAgentList.do")
	@ResponseBody
	public DataResponse findAgentList(Agent agent, Page page) {
		try {
			DataResponse rst = this.agentService.findAgentList(agent, page.getStart(), page.getLimit(),
					page.getOrderBy());
			if (rst.getAllRows() == null) {
				rst.setAllRows(page.getTotalRecord());
			}
			return rst;
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/upadateAgent.do")
	@ResponseBody
	public DataResponse updateAgent(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject josn = JSONObject.fromObject(jsons);
			return this.agentService.updateAgentByAgentId(josn, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

}
