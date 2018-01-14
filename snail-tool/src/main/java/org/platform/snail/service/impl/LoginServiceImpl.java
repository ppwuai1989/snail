package org.platform.snail.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.dao.LoginDao;
import org.platform.snail.model.Agent;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.service.LoginService;
import org.platform.snail.utils.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	Logger logger = LogManager.getLogger(this.getClass());
	@Autowired
	private LoginDao loginDao;

	@Autowired
	private DataBaseLogService dataBaseLogService;

	// 根据账户获取users
	@Override
	public Users getUsersByAccount(String account) {
		Users users = this.loginDao.selectUsersByAccount(account);
		return users;
	}

	@Override
	public List<Resources> getResourcesByUserId(String userId) {
		String portal = Config.getProperty("portal.type");
		List<Resources> resources = this.loginDao.selectResourcesByUserId(userId, portal);
		return resources;
	}

	@Override
	public SystemUser getSystemUserByAccount(String account) {
		String portal = Config.getProperty("portal.type");
		Map<String, Resources> map = new HashMap<String, Resources>();
		SystemUser systemUser = new SystemUser();
		Users users = this.loginDao.selectUsersByAccount(account);
		List<Resources> resources = this.loginDao.selectResourcesByUserId(users.getUserId(), portal);
		systemUser.setUsers(users);
		systemUser.setResources(resources);
		for (Resources o : resources) {
			map.put(o.getResourcesId(), o);
		}
		systemUser.setMap(map);
		this.logger.debug(users.toString());
		this.logger.debug(systemUser.toString());
		return systemUser;
	}

	@Override
	public boolean updateLastLoginTimeByUserId(SystemUser systemUser) {
		int update = this.loginDao.updateUsersLastLoginTimeByPrimaryKey(systemUser.getUsers().getUserId());
		// 记录登录日志
		if (update > 0) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String oldValue = df.format(systemUser.getUsers().getLastLoginTime());
			String newValue = df.format(new Date());
			String logDetail = "id为" + systemUser.getUsers().getUserId() + "的用户在" + newValue + "登录了系统。";
			this.dataBaseLogService.log(logDetail, "用户登录", oldValue, newValue, systemUser.getUsers().getUserId(),
					systemUser);
			return true;
		} else
			return false;
	}

	@Override
	public Agent selectAgentById(String agentId) {

		return this.loginDao.selectAgentById(agentId);
	}
}
