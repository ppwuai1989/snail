package org.platform.snail.portal.web.listener;

import java.util.List;

import org.platform.snail.portal.dao.ReportStatisticsDao;
import org.platform.snail.portal.vo.TBGameReportVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

/**
 * @author paopao 测试类 可以做单元测试
 */
public class TestService {

	public static void main(String[] args) {

		// 报表单元测试
		// ApplicationContext ac = new
		// FileSystemXmlApplicationContext("src/main/resources/applicationContext.xml");
		// ReportStatisticsDao reportDao =
		// ac.getBean(ReportStatisticsDao.class);
		// TBGameReportVo condition = new TBGameReportVo();
		// // "yyyy-MM-dd HH:mm:ss"
		// condition.setStartDate("2018-01-20 12:12:12");
		// condition.setEndDate("2018-01-31 12:12:12");
		// List<TBGameReportVo> list = reportDao.tbGameStatistcs(condition, 0,
		// 10, "", "1", "2");
		// System.out.println("list大小" + list.size());

	}

}
