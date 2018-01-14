package org.platform.snail.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.beans.Tree;
import org.platform.snail.dao.SystemDao;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;
import org.platform.snail.service.CacheService;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.service.SystemService;
import org.platform.snail.utils.CommonTreeUtils;
import org.platform.snail.utils.Config;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.utils.TreeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("systemService")
public class SystemServiceImpl implements SystemService {

	Logger logger = LogManager.getLogger(this.getClass());
	@Autowired
	private SystemDao systemDao;

	@Autowired
	private DataBaseLogService dataBaseLogService;
	// 暂时不用
	// @Autowired
	// private EmailServiceInterface emailService;
	@Autowired
	private CacheService cacheService;

	@Override
	public SystemUser getSystemUser(String userId) {
		String portal = Config.getProperty("portal.type");
		SystemUser systemUser = new SystemUser();
		Users users = this.systemDao.selectUsersByUserId(userId);
		List<Resources> resources = this.systemDao.selectResourcesByUserId(userId, portal);
		String departmentId = users.getDepartmentId();
		systemUser.setUsers(users);
		systemUser.setResources(resources);
		this.logger.debug(users.toString());
		return systemUser;
	}

	@Override
	public List<Tree> getTreeList(List<Resources> resources, String id, boolean loadButton) {
		TreeUtils treeUtils = new TreeUtils(resources, loadButton);
		return treeUtils.getTreeList(id);
	}

	@Override
	public Map<String, String> getButtonAuthor(List<Resources> resources, String id) {
		Map<String, String> author = new HashMap<String, String>();
		TreeUtils treeUtils = new TreeUtils(resources, true);
		List<Resources> list = treeUtils.getChildResourcesList(id);
		if (list != null) {
			for (Resources r : list) {
				author.put(r.getResourcesUrl(), r.getResourcesName());
			}
		}
		return author;
	}

	@Override
	public List<Tree> selectProvinceTreeList() {
		String key = "C0001";
		try {
			if (cacheService.get(key) == null) {
				CommonTreeUtils commonTreeUtils = new CommonTreeUtils(this.systemDao.selectProvinceTreeList());
				cacheService.put(key, commonTreeUtils.getTreeList("00"));
			}
			return (List<Tree>) cacheService.get(key);
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public List<Tree> selectProvinceTreeList(String pid, boolean isRoot, String value) {
		int len = 0;
		if (value != null) {
			len = value.length();
		}
		CommonTreeUtils commonTreeUtils = new CommonTreeUtils(
				this.systemDao.selectProvinceTreeListByPid(pid, value, len));
		if (isRoot) {
			return commonTreeUtils.getTreeListCaseSelf(pid);
		}
		return commonTreeUtils.getTreeList(pid);
	}

	@Override
	public DataResponse updatePassword(String password, String repassword, SystemUser systemUser) throws Exception {
		if (SnailUtils.isBlankString(password)) {
			return new DataResponse(false, "密码不能为空！");
		}
		if (SnailUtils.isBlankString(repassword)) {
			return new DataResponse(false, "确认密码不能为空！");
		}
		if (!repassword.equals(password)) {
			return new DataResponse(false, "确认密码与密码不一致！");
		}
		password = SnailUtils.getMd5(password);
		this.systemDao.updatePassword(systemUser.getUsers().getUserId(), password);
		this.dataBaseLogService.log("用户密码修改", "用户密码", "", password, systemUser.getUsers().getUserId(), systemUser);
		return new DataResponse(true, "密码修改成功！");
	}

	@Override
	public SystemUser getSystemUserByAccount(String account) {
		String portal = Config.getProperty("portal.type");
		Map<String, Resources> map = new HashMap<String, Resources>();
		SystemUser systemUser = new SystemUser();
		Users users = this.systemDao.selectUsersByAccount(account);
		List<Resources> resources = this.systemDao.selectResourcesByUserId(users.getUserId(), portal);
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
	public Map<String, Object> selectDepartment(Map<String, String> params) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<Map<String, String>> list = this.systemDao.selectDepartment(params);
		rst.put("total", list.size());
		rst.put("rows", list);
		return rst;
	}

	@Override
	public Map<String, Object> selectUsers(Map<String, Object> params) {
		Map<String, Object> rst = new HashMap<String, Object>();
		List<Map<String, String>> list = this.systemDao.selectUsers(params);
		rst.put("total", list.size());
		rst.put("rows", list);
		return rst;
	}

	// 重置密码
	@Override
	public DataResponse retrievePassword(String email) throws Exception {
		/*
		 * DataResponse rst = new DataResponse(); if
		 * (SnailUtils.isBlankString(email)) { return new DataResponse(false,
		 * "Email不能为空！"); }
		 * 
		 * Users user = this.systemDao.selectUsersByEmail(email); if (user ==
		 * null) { return new DataResponse(false, "不存在此用户的Email！"); } String
		 * newPasswd = SnailUtils.genRandomNum(6);
		 * this.systemDao.updatePassword(user.getUserId(),
		 * SnailUtils.getMd5(newPasswd)); List address = new ArrayList();
		 * address.add(email); String subject = "", content = ""; VelocityEngine
		 * velocityEngine = new VelocityEngine();
		 * velocityEngine.setProperty("resource.loader", "class");
		 * velocityEngine.setProperty("class.resource.loader.class",
		 * "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader"
		 * );
		 * 
		 * Map<String, Object> model = new HashMap<String, Object>();
		 * SnailBeanUtils.copyBean2Map(user, model); model.put("newPasswd",
		 * newPasswd); model.put("sysDate", new Date().toLocaleString());
		 * subject = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
		 * "email.subject.vm", "UTF-8", model); content =
		 * VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
		 * "email.vm", "UTF-8", model);
		 * this.emailService.sendBatchEmail(subject, content, address);
		 */
		return new DataResponse(true, "密码已重新设置，请查收 " + email);
	}

	@Override
	public List<Resources> findAllSystemResources() throws Exception {
		List<Resources> list = this.systemDao.findAllSystemResources();
		return list;
	}

}
