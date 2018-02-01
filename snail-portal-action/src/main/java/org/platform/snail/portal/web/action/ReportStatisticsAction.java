package org.platform.snail.portal.web.action;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.service.ReportStatisticsService;
import org.platform.snail.portal.vo.TBGameReportVo;
import org.platform.snail.utils.Page;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reportStatistics")
public class ReportStatisticsAction extends BaseController {

	private static final long serialVersionUID = 1L;
	Logger logger = LogManager.getLogger(this.getClass());

	@Autowired
	private ReportStatisticsService reportService;

	@RequestMapping(value = "/tb/findTBDetailReport.do")
	@ResponseBody
	public DataResponse findTBDetailReport(HttpServletRequest request, Page page) {
		try {
			SystemUser systemUser = this.getSessionSystemUser();
			Map<String, Object> condition = new HashMap<String, Object>();
			Enumeration e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String key = (String) e.nextElement();
				String value = request.getParameter(key);
				condition.put(key, value);
			}
			TBGameReportVo report = new TBGameReportVo();
			SnailBeanUtils.copyMap2Bean(report, condition);
			DataResponse rst = this.reportService.tbGameStatistics(report, page.getStart(), page.getLimit(),
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
}
