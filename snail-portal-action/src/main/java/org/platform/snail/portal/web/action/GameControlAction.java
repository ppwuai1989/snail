package org.platform.snail.portal.web.action;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.model.GameControl;
import org.platform.snail.portal.service.GameControlService;
import org.platform.snail.utils.Page;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/gameControl")
public class GameControlAction extends BaseController {

	private static final long serialVersionUID = 1L;
	Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private GameControlService gameControlService;

	@RequestMapping(value = "/findControlList.do")
	@ResponseBody
	public DataResponse findControlList(GameControl control, Page page) {
		try {
			DataResponse rst = this.gameControlService.findControlList(control, page.getStart(), page.getLimit(),
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

	@RequestMapping(value = "/insertControl.do")
	@ResponseBody
	public DataResponse insertControl(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.gameControlService.insertControl(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, "保存失败！", e.getMessage());
		}
	}
	
	@RequestMapping(value = "/updateControl.do")
	@ResponseBody
	public DataResponse updateControl(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			JSONObject json = JSONObject.fromObject(jsons);
			return this.gameControlService.updateControl(json, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, "更新失败！", e.getMessage());
		}
	}
	
	@RequestMapping(value = "/deleteControl.do")
	@ResponseBody
	public DataResponse deleteControl(String jsons) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();	
			JSONObject json = JSONObject.fromObject(jsons);
			String id=json.getString("id");
			return this.gameControlService.deleteControl(id, systemUser);
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, "删除失败！", e.getMessage());
		}
	}

}
