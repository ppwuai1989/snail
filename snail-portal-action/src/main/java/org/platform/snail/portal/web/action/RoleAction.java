package org.platform.snail.portal.web.action;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.CheckTree;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Role;
import org.platform.snail.portal.service.RoleService;
import org.platform.snail.utils.Page;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/role")
public class RoleAction extends BaseController {
	private static final long serialVersionUID = 1L;
	Logger logger = LogManager.getLogger(this.getClass());
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/findRoleList.do")
	@ResponseBody
	public DataResponse findRoleList(Role condition, Page page) {
		try {
			DataResponse rst = this.roleService.findRoleList(condition, page.getStart(), page.getLimit(),
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

	@RequestMapping(value = "/insertRole.do")
	@ResponseBody
	public DataResponse insertRole(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject josn = JSONObject.fromObject(jsons);
			return this.roleService.insertRole(josn, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/updateRole.do")
	@ResponseBody
	public DataResponse updateRole(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject josn = JSONObject.fromObject(jsons);
			return this.roleService.updateRole(josn, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/insertRoleResources.do")
	@ResponseBody
	public DataResponse insertRoleResources(String roleId, String resourcesId) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			String[] resourcesIds = null;
			String temp = resourcesId;
			//2018.1.7修改 当temp为空或null时候，resourcesIds设为null
			if (SnailUtils.isNotBlankString(temp)) {
				if (temp.indexOf(",") != -1) {
					resourcesIds = temp.split(",");
				}
				if (temp.indexOf(",") == -1) {
					resourcesIds = new String[] { temp };
				}
			} else {
				resourcesIds = null;
			}
			return this.roleService.insertRoleResources(roleId, resourcesIds, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/selectRoleByPrimaryKey.do")
	@ResponseBody
	public DataResponse selectRoleByPrimaryKey(String roleId) {
		try {
			return this.roleService.selectRoleByPrimaryKey(roleId);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/selectRoleResourceTreeList.do")
	@ResponseBody
	public List<CheckTree> selectRoleResourceTreeList(String roleId) throws Exception {
		List<CheckTree> list = this.roleService.selectRoleResourceTreeList(roleId);
		return list;
	}

	@RequestMapping(value = "/deleteRoleByRoleId.do")
	@ResponseBody
	public DataResponse deleteRoleByRoleId(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			String roleId = json.getString("id");
			return this.roleService.deleteRoleByRoleId(roleId, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}
}
