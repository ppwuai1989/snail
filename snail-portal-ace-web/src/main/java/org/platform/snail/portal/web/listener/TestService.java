package org.platform.snail.portal.web.listener;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.io.IOUtils;
import org.apache.commons.net.util.Base64;
import org.platform.snail.portal.dao.ReportStatisticsDao;
import org.platform.snail.portal.model.TBGameReport;
import org.platform.snail.portal.vo.TBGameReportVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.platform.snail.utils.ImgUtils;

/**
 * @author paopao 测试类 可以做单元测试
 */

public class TestService {

	public static void main(String[] args) {

		// 抓取图片
		try {
			String imgUrl = "http://img2.woyaogexing.com/2018/01/03/671b684da4231b7b!400x400_big.jpg";			
			String rst = ImgUtils.getBase64ImgString(imgUrl);
			System.out.println(rst);
		} catch (Exception e) {			
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		// 报表单元测试
		// ApplicationContext ac = new
		// FileSystemXmlApplicationContext("src/main/resources/applicationContext.xml");
		// ReportStatisticsDao reportDao =
		// ac.getBean(ReportStatisticsDao.class);
		// TBGameReportVo condition = new TBGameReportVo();
		// // TBGameReport condition = new TBGameReport();
		// // "yyyy-MM-dd HH:mm:ss"
		// condition.setStartDate("2018-01-20 12:12:12");
		// condition.setEndDate("2018-01-31 12:12:12");
		// List<TBGameReportVo> list = reportDao.tbGameStatistics(condition, 0,
		// 10, "", "1", "2");
		// int allRows = reportDao.tbGameStatisticsCount(condition, "1", "2");
		// System.out.println("list大小" + list.size());
		// System.out.println("allRows大小" + allRows);

	}

}
