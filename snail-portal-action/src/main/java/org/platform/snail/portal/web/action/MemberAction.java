package org.platform.snail.portal.web.action;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.service.MemberService;
import org.platform.snail.portal.vo.MemberVo;
import org.platform.snail.utils.Page;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/member")
public class MemberAction extends BaseController {

	private static final long serialVersionUID = 1L;

	public Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/findMemberList.do")
	@ResponseBody
	public DataResponse findUsersList(MemberVo condition, Page page) {
		try {
			
			SystemUser systemUser = this.getSessionSystemUser();
			DataResponse rst = this.memberService.findUsersList(condition, page.getStart(), page.getLimit(),
					page.getOrderBy(), systemUser);
			if (rst.getAllRows() == null) {
				rst.setAllRows(page.getTotalRecord());
			}
			return rst;
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/insertMember.do")
	@ResponseBody
	public DataResponse insertUsers(String jsons) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.memberService.insertUsers(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}

	}

	@RequestMapping(value = "/updateMember.do")
	@ResponseBody
	public DataResponse updateUsers(String jsons) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.memberService.updateUsers(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/updateMemberStatusByPrimaryKey.do")
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
			return this.memberService.updateUsersStatusByPrimaryKey(userId, status, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/selectMemberByPrimaryKey.do")
	@ResponseBody
	public DataResponse selectUsersByPrimaryKey(String userId) {
		try {
			return this.memberService.selectUsersByPrimaryKey(userId);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/findMemberAccountInfo.do")
	@ResponseBody
	public DataResponse findMemberAccountInfo() {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			String agentId = systemUser.getUsers().getUserId();
			return this.memberService.findMemberAccountInfo(agentId);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}
	
	@RequestMapping(value = "/topUpMember.do")
	@ResponseBody
	public DataResponse topUpMember(String jsons) {

		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.memberService.topUpMember(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

}
