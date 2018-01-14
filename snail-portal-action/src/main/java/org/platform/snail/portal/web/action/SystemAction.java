package org.platform.snail.portal.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.beans.Tree;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;
import org.platform.snail.service.SystemService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.DictUtils;
import org.platform.snail.utils.JsonUtils;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/system")
public class SystemAction extends BaseController {

	private static final long serialVersionUID = 1L;
	@Autowired
	private SystemService systemService;

	@RequestMapping(value = "/updatePassword.do")
	@ResponseBody
	public DataResponse updatePassword(String password, String repassword) throws Exception {
		SystemUser systemUser = this.getSessionSystemUser();
		DataResponse rst = this.systemService.updatePassword(password, repassword, systemUser);
		return rst;
	}

	@RequestMapping(value = "/getTreeList.do")
	@ResponseBody
	public List<Tree> getTreeList(String loadButton) throws Exception {
		SystemUser systemUser = this.getSessionSystemUser();
		boolean lb = Boolean.valueOf(loadButton);
		List<Tree> list = this.systemService.getTreeList(systemUser.getResources(), "0", lb);
		return list;
	}

	@RequestMapping(value = "/getUrlMap.do", produces = "text/plain;charset=utf-8")
	public ModelAndView getUrlMap() throws Exception {
		SystemUser systemUser = this.getSessionSystemUser();
		List<Resources> list = systemUser.getResources();
		Map<String, String> url = new HashMap<String, String>();
		StringBuffer sb = new StringBuffer("var map=");
		for (Resources resources : list) {
			if (resources.getResourcesType().equals("2")) {
				url.put(resources.getResourcesId(), resources.getResourcesUrl());
			}
		}
		sb.append(DictUtils.toJsonString(url));
		sb.append(";");
		this.logger.info(sb.toString());
		ModelAndView mav = new ModelAndView("js");
		mav.addObject("js", sb.toString());
		return mav;
	}

	@RequestMapping(value = "/getButtonAuthority.do", produces = "text/plain;charset=utf-8")
	public ModelAndView getButtonAuthority(String id) throws Exception {
		SystemUser systemUser = this.getSessionSystemUser();
		List<Resources> list = systemUser.getResources();
		Map<String, String> author = this.systemService.getButtonAuthor(list, id);
		StringBuffer sb = new StringBuffer("var authorConfig=");
		sb.append(DictUtils.toJsonString(author));
		sb.append(";");
		this.logger.info(sb.toString());
		ModelAndView mav = new ModelAndView("js");
		mav.addObject("js", sb.toString());
		// mav.addObject(CommonKeys.CWebPath,SeachPathUtils.getPath(systemUser.getMap(),
		// id));
		return mav;
	}

	@RequestMapping(value = "/getSessionSystemUser.do", produces = "text/plain;charset=utf-8")
	public ModelAndView getSessionUser() throws Exception {
		SystemUser systemUser = this.getSessionSystemUser();
		SystemUser csystemUser = new SystemUser();
		csystemUser.setUsers(systemUser.getUsers());
		// csystemUser.setDepartment(systemUser.getDepartment());
		StringBuffer sb = new StringBuffer("var systemUser=");
		sb.append(JsonUtils.toJSONString(csystemUser));
		sb.append(";");
		this.logger.info(sb.toString());
		ModelAndView mav = new ModelAndView("js");
		mav.addObject("js", sb.toString());
		return mav;
	}

	// @RequestMapping(value = "/selectProvinceTreeList.do")
	@ResponseBody
	public List<Tree> selectProvinceTreeList(String id, String value) throws Exception {
		SystemUser systemUser = this.getSessionSystemUser();
		this.logger.info("pid-->" + id);
		boolean isRoot = false;
		if (SnailUtils.isBlankString(id)) {
			// id = systemUser.getDepartment().getAreaCode();
			isRoot = true;
		}
		this.logger.info("pid-->" + id);
		List<Tree> list = this.systemService.selectProvinceTreeList(id, isRoot, value);
		return list;
	}

	// @RequestMapping(value = "/selectDepartment.do")
	@ResponseBody
	public Map<String, Object> selectDepartment(String q, String id) throws Exception {
		/*
		 * Map<String, String> params = new HashMap<String, String>();
		 * params.put("q", id); SystemUser systemUser =
		 * this.getSessionSystemUser(); String arecode =
		 * systemUser.getDepartment().getAreaCode(); params.put("arecode",
		 * arecode); if (!SnailUtils.isBlankString(q)) { params.put("q", q); }
		 * return this.systemService.selectDepartment(params);
		 */
		return null;
	}

	@RequestMapping(value = "/loadDictByKey.do")
	@ResponseBody
	public List loadDictByKey(String key) throws Exception {
		Map<String, List> dictMap = (Map<String, List>) this.getSessionSystemUser();
		// this.getRequest().getSession().getServletContext().getAttribute(CommonKeys.dictAppKey);
		return dictMap.get(key);
	}

	@RequestMapping(value = "/selectUsers.do")
	@ResponseBody
	public Map<String, Object> selectUsers(Users user) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		org.platform.snail.utils.SnailBeanUtils.copyBean2Map(user, params);
		this.logger.info(params);
		return this.systemService.selectUsers(params);
	}

	@RequestMapping(value = "/retrievePassword.do")
	@ResponseBody
	public DataResponse retrievePassword(String email) throws Exception {
		if(SnailUtils.isBlankString(email))
		{
			return new DataResponse(false,"Email不能为空！");
		}
		
		try {
			return this.systemService.retrievePassword(email);
		} catch (Exception e) {
			return new DataResponse(false, "发送Email失败!", e.getMessage());
		}

	}

}
