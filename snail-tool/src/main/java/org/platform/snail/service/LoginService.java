package org.platform.snail.service;

import java.util.List;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Agent;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;

public interface LoginService {

	public abstract SystemUser getSystemUserByAccount(String account);

	public abstract Users getUsersByAccount(String account);

	public abstract List<Resources> getResourcesByUserId(String userId);

	public abstract boolean updateLastLoginTimeByUserId(SystemUser systemUser);
	
	public abstract Agent selectAgentById(String agentId);

}
