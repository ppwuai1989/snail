package org.platform.snail.portal.web.action;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.MallSettings;
import org.platform.snail.portal.service.MallSettingsService;
import org.platform.snail.utils.Page;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/mallSettings")
public class MallSettingsAction extends BaseController {

	private static final long serialVersionUID = 1L;
	Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private MallSettingsService mallService;

	@RequestMapping(value = "/findList.do")
	@ResponseBody
	public DataResponse findList(MallSettings settings, Page page) {
		try {
			DataResponse rst = this.mallService.findList(settings, page.getStart(), page.getLimit(), page.getOrderBy());
			if (rst.getAllRows() == null) {
				rst.setAllRows(page.getTotalRecord());
			}
			return rst;
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

	@RequestMapping(value = "/insertSettings.do")
	@ResponseBody
	public DataResponse insertSettings(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.mallService.insertSettings(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, "添加失败！", e.getMessage());
		}
	}

	@RequestMapping(value = "/updateSettings.do")
	@ResponseBody
	public DataResponse updateSettings(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.mallService.updateSettings(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, "更新失败！", e.getMessage());
		}
	}

	@RequestMapping(value = "/deleteSettings.do")
	@ResponseBody
	public DataResponse deleteSettings(String id) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			return this.mallService.deleteSettings(id, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, "删除失败！", e.getMessage());
		}
	}

}
