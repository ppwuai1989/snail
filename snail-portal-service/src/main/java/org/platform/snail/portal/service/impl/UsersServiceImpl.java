package org.platform.snail.portal.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Role;
import org.platform.snail.model.Users;
import org.platform.snail.portal.dao.UsersDao;
import org.platform.snail.portal.service.UsersService;
import org.platform.snail.portal.vo.UsersVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;
	@Autowired
	private DataBaseLogService dataBaseLogService;

	/**
	 * 测试用的
	 */
	public DataResponse selectByUserId(String userId) throws Exception {
		DataResponse rst = new DataResponse();
		Users users = this.usersDao.selectByUserId(userId);
		rst.setResponse(users);
		return rst;
	}

	public DataResponse findUsersSearchList(Users condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<Map<String, String>> list = this.usersDao.findUsersSearchList(condition, start, limit, orderBy);
		rst.setList(list);
		int allRows = this.usersDao.findUsersSearchCount(condition);
		rst.setAllRows(allRows);
		return rst;
	}

	public DataResponse findUsersList(Users condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<UsersVo> list = this.usersDao.findUsersList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.usersDao.findUsersCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	public DataResponse insertUsers(JSONObject josnObject, SystemUser systemUser) throws Exception {

		Users users = new Users();
		SnailBeanUtils.copyProperties(users, josnObject);
		// if (SnailUtils.isBlankString(users.getDepartmentId())) {
		// return new DataResponse(false, "所属部门不能为空!");
		// }
		if (SnailUtils.isBlankString(users.getAccount())) {
			return new DataResponse(false, "账户不能为空!");
		}
		if (this.usersDao.isExitUsersAccount(users.getAccount()) > 0) {
			return new DataResponse(false, "账户已存在!");
		}
		if (SnailUtils.isBlankString(users.getPassword())) {
			return new DataResponse(false, "密码不能为空!");
		}
		if (SnailUtils.isBlankString(users.getSex())) {
			return new DataResponse(false, "性别不能为空!");
		}
		if (SnailUtils.isBlankString(users.getIdCard())) {
			return new DataResponse(false, "身份证号不能为空!");
		}
		if (!SnailUtils.isValidIdCard(users.getIdCard())) {
			return new DataResponse(false, "身份证号格式不正确!");
		}
		if (SnailUtils.isBlankString(users.getName())) {
			return new DataResponse(false, "用户名不能为空!");
		}
		if (users.getBirthday() == null) {
			return new DataResponse(false, "出生日期不能为空!");
		}
		if (SnailUtils.isBlankString(users.getMobile())) {
			return new DataResponse(false, "手机号不能为空!");
		}
		if (!SnailUtils.isValidMobile(users.getMobile())) {
			return new DataResponse(false, "手机号格式不正确!");
		}
		if (SnailUtils.isBlankString(users.getEmail())) {
			return new DataResponse(false, "电子邮箱不能为空!");
		}
		if (!SnailUtils.isValidEmail(users.getEmail())) {
			return new DataResponse(false, "电子邮箱格式不正确!");
		}
		if (this.usersDao.isExitUsersByEmail(users.getEmail()) > 0) {
			return new DataResponse(false, "电子邮箱已经被注册使用!");
		}
		if (!SnailUtils.isBlankString(users.getUserLevel())) {
			if (!SnailUtils.isDouble(users.getUserLevel())) {
				return new DataResponse(false, "用户级别不是数字!");
			}
		}
		users.setStatus("1");
		users.setCreateTime(new Date());
		users.setPassword(SnailUtils.getMd5(users.getPassword()));
		this.usersDao.insertUsers(users);
		this.dataBaseLogService.log("添加新用户", "用户", users.getAccount(), users.getName(), "01", systemUser);
		return new DataResponse(true, "添加新用户成功！");
	}

	public DataResponse updateUsers(JSONObject josnObject, SystemUser systemUser) throws Exception {

		Users users = new Users();
		SnailBeanUtils.copyProperties(users, josnObject);
		if (SnailUtils.isBlankString(users.getUserId())) {
			return new DataResponse(false, "用户编号不能为空!");
		}
//		if (SnailUtils.isBlankString(users.getDepartmentId())) {
//			return new DataResponse(false, "所属部门不能为空!");
//		}
		if (SnailUtils.isBlankString(users.getAccount())) {
			return new DataResponse(false, "账户不能为空!");
		}
//		if (SnailUtils.isBlankString(users.getPassword())) {
//			return new DataResponse(false, "密码不能为空!");
//		}
		if (SnailUtils.isBlankString(users.getSex())) {
			return new DataResponse(false, "性别不能为空!");
		}
		if (SnailUtils.isBlankString(users.getIdCard())) {
			return new DataResponse(false, "身份证号不能为空!");
		}
		if (!SnailUtils.isValidIdCard(users.getIdCard())) {
			return new DataResponse(false, "身份证号格式不正确!");
		}
		if (SnailUtils.isBlankString(users.getName())) {
			return new DataResponse(false, "用户名不能为空!");
		}
		if (users.getBirthday() == null) {
			return new DataResponse(false, "出生日期不能为空!");
		}
		if (SnailUtils.isBlankString(users.getMobile())) {
			return new DataResponse(false, "手机号不能为空!");
		}
		if (!SnailUtils.isValidMobile(users.getMobile())) {
			return new DataResponse(false, "手机号格式不正确!");
		}
		if (SnailUtils.isBlankString(users.getEmail())) {
			return new DataResponse(false, "电子邮箱不能为空!");
		}
		if (!SnailUtils.isValidEmail(users.getEmail())) {
			return new DataResponse(false, "电子邮箱格式不正确!");
		}
		if (!SnailUtils.isBlankString(users.getUserLevel())) {
			if (!SnailUtils.isDouble(users.getUserLevel())) {
				return new DataResponse(false, "用户级别不是数字!");
			}
		}
		if (!SnailUtils.isBlankString(users.getUserLevel())) {
			if (!SnailUtils.isDouble(users.getUserLevel())) {
				return new DataResponse(false, "用户级别不是数字!");
			}
		}
		if (users.getPassword().length() < 20) {
			users.setPassword(SnailUtils.getMd5(users.getPassword()));
		}
		this.usersDao.updateUsersByPrimaryKey(users);
		this.dataBaseLogService.log("用户信息变更", "用户", users.getUserId(), users.getName(), users.getUserId(), systemUser);
		return new DataResponse(true, "用户信息变更成功！");
	}

	public DataResponse updateUsersStatusByPrimaryKey(String usersId, String status, SystemUser systemUser)
			throws Exception {
		if (SnailUtils.isBlankString(usersId)) {
			return new DataResponse(false, "用户编号不能为空！");
		}
		if (SnailUtils.isBlankString(status)) {
			return new DataResponse(false, "用户状态不能为空！");
		}
		this.usersDao.updateUsersStatusByPrimaryKey(usersId, status);
		this.dataBaseLogService.log("删除用户", "删除用户", "", status, usersId, systemUser);
		return new DataResponse(true, "删除用户成功！");
	}

	public DataResponse updateUsersForInitPassword(String usersId, String password, SystemUser systemUser)
			throws Exception {
		if (SnailUtils.isBlankString(usersId)) {
			return new DataResponse(false, "用户编号不能为空！");		}
		if (SnailUtils.isBlankString(password)) {
			return new DataResponse(false, "密码不能为空！");
		}
		password = SnailUtils.getMd5(password);
		this.usersDao.updateUsersForInitPassword(usersId, password);
		this.dataBaseLogService.log("用户密码初始化", "用户密码", "", password, usersId, systemUser);
		return new DataResponse(true, "用户密码初始化成功！");
	}

	public DataResponse selectUsersByPrimaryKey(String usersId) throws Exception {
		DataResponse rst = new DataResponse();
		UsersVo usersVo = this.usersDao.selectUsersVoByPrimaryKey(usersId);
		rst.setResponse(usersVo);
		return rst;
	}

	public DataResponse insertUsersRole(String userId, String[] roleId, SystemUser systemUser) throws Exception {
		this.usersDao.insertUsersRole(userId, roleId);
		this.dataBaseLogService.log("用户分配角色", "分配角色", "", "", userId, systemUser);
		return new DataResponse(true, "角色分配成功！");
	}

	public DataResponse selectRoleList() throws Exception {
		DataResponse rst = new DataResponse();
		List<Role> list = this.usersDao.selectRoleList();
		rst.setList(list);
		if (list != null) {
			rst.setAllRows(list.size());
		}
		return rst;
	}

	public DataResponse selectRoleListByUserId(String userId) throws Exception {
		DataResponse rst = new DataResponse();
		List<Role> list = this.usersDao.selectRoleListByUserId(userId);
		rst.setList(list);
		if (list != null) {
			rst.setAllRows(list.size());
		}
		return rst;
	}


}
