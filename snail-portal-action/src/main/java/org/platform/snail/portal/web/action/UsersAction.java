package org.platform.snail.portal.web.action;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Role;
import org.platform.snail.portal.service.RoleService;
import org.platform.snail.portal.service.UsersService;
import org.platform.snail.portal.vo.UsersVo;
import org.platform.snail.utils.Page;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/users")
public class UsersAction extends BaseController {
	
	private static final long serialVersionUID = 1L;

	public Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private UsersService usersService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/findUsersList.do")
	@ResponseBody
	public DataResponse findUsersList(UsersVo condition, Page page) {
		try {
			// if (SnailUtils.isBlankString(condition.getAreaCode())) {
			// SystemUser systemUser = this.getSessionSystemUser();
			// condition.setAreaCode(systemUser.getDepartment().getAreaCode());
			// }
			DataResponse rst = this.usersService.findUsersList(condition,
					page.getStart(), page.getLimit(), page.getOrderBy());
			if (rst.getAllRows() == null ) {
				rst.setAllRows(page.getTotalRecord());
			}
			return rst;
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}
	@RequestMapping(value = "/insertUsers.do")
	@ResponseBody
	public DataResponse insertUsers(String jsons) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.usersService.insertUsers(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}

	}

	@RequestMapping(value = "/updateUsers.do")
	@ResponseBody
	public DataResponse updateUsers(String jsons) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.usersService.updateUsers(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/updateUsersStatusByPrimaryKey.do")
	@ResponseBody
	public DataResponse updateUsersStatusByPrimaryKey(String jsons) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			String userId = json.getString("id");
			String status = "0";
			if (json.containsKey("status")) {
				status = json.getString("status");
			}
			return this.usersService.updateUsersStatusByPrimaryKey(userId,
					status, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}
	@RequestMapping(value = "/updateUsersForInitPassword.do")
	@ResponseBody
	public DataResponse updateUsersForInitPassword(String userId,
			String password) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			return this.usersService.updateUsersForInitPassword(userId,
					password, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/selectUsersByPrimaryKey.do")
	@ResponseBody
	public DataResponse selectUsersByPrimaryKey(String userId) {
		try {
			return this.usersService.selectUsersByPrimaryKey(userId);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/insertUsersRole.do")
	@ResponseBody
	public DataResponse insertUsersRole(String userId, String roleId) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			String[] roleIds = null;
			String temp = roleId;
			if (temp != null && temp.indexOf(",") != -1) {
				roleIds = temp.split(",");
			}
			if (temp != null && temp.indexOf(",") == -1) {
				roleIds = new String[] { temp };
			}
			return this.usersService.insertUsersRole(userId, roleIds,
					systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/selectRoleList.do")
	@ResponseBody
	public DataResponse selectRoleList() {
		try {
			return this.usersService.selectRoleList();
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/selectRoleListByUserId.do")
	@ResponseBody
	public DataResponse selectRoleListByUserId(String userId) {
		try {
			return this.usersService.selectRoleListByUserId(userId);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/findRoleList.do")
	@ResponseBody
	public DataResponse findRoleList(Role condition, Page page) {
		try {
			DataResponse rst = this.roleService.findRoleList(condition,
					page.getStart(), page.getLimit(), page.getOrderBy());
			if (rst.getAllRows() == null) {
				rst.setAllRows(page.getTotalRecord());
			}
			return rst;
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}

	}

}
