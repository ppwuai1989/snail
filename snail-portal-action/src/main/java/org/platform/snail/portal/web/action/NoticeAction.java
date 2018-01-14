package org.platform.snail.portal.web.action;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.web.action.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/notice")
public class NoticeAction extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = LogManager.getLogger(this.getClass());

	@RequestMapping(value = "/findListTop.do")
	@ResponseBody
	public DataResponse findListTop(String limit) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			// DataResponse rst =
			// this.noticeService.findListTop(limit,systemUser);
			DataResponse rst = null;
			return rst;
		} catch (Exception e) {
			this.logger.error(e);
			return new DataResponse(false, e.getMessage());
		}
	}

}
