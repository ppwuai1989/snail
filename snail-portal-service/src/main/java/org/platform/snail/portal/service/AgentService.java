package org.platform.snail.portal.service;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.Agent;

import net.sf.json.JSONObject;

public interface AgentService {

	public abstract DataResponse findAgentList(Agent condition, int start, int limit, String orderBy) throws Exception;

	public abstract DataResponse updateAgentByAgentId(JSONObject jsonObject, SystemUser systemUser)throws Exception;

}
