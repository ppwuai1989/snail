package org.platform.snail.portal.web.listener;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.io.IOUtils;
import org.apache.commons.net.util.Base64;
import org.platfom.snail.pay.model.QRCodeMsg;
import org.platform.snail.portal.dao.ReportStatisticsDao;
import org.platform.snail.portal.model.TBGameReport;
import org.platform.snail.portal.vo.TBGameReportVo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import org.platform.snail.utils.HttpClientUtils;
import org.platform.snail.utils.ImgUtils;
import org.platform.snail.utils.PayUtils;
import org.platform.snail.utils.SnailBeanUtils;

/**
 * @author paopao 测试类 可以做单元测试
 */

public class TestService {

	public static void main(String[] args) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", "6dc7af43978a4029302c7e5b");
		paramMap.put("price", "6.00");
		paramMap.put("istype", Integer.valueOf("2"));
		paramMap.put("notify_url", "http://paopao.viphk.ngrok.org/portal/openAPI/notifyPay.do");
		paramMap.put("return_url", "http://tb.n0b16.cn/payResult.html");
		paramMap.put("orderid", "1235781545654");
		paramMap.put("orderuid", "10000026");
		paramMap.put("goodsname", "1");
		paramMap.put("key", PayUtils.getKey(paramMap));
		ObjectMapper mapper = new ObjectMapper();
		String jsonObject;
		try {
			jsonObject = mapper.writeValueAsString(paramMap);
			String url = "https://pay.paysapi.com/?format=json";

			// String i = HttpClientUtils.doPost(url, param);
			System.out.println(jsonObject);
			String jsons = HttpClientUtils.doPost(url, jsonObject);
			
			// QRCodeMsg msg = new QRCodeMsg();
			// SnailBeanUtils.copyProperties(msg, json);
			// msg.setDataMsg(msg.getDataMsg(msg.getData()));
			// System.out.println(msg.toString());
			Map<String, Object> jsonMsg = JSONObject.fromObject(jsons);
			Map<String, Object> jsonData = JSONObject.fromObject(jsonMsg.get("data"));
			//String base64Img = ImgUtils.getBase64ImgString(PayUtils.QRCODE_URL + jsonData.get("qrcode")).replaceAll("\n", "").replaceAll("\r", "");
			String base64Img = ImgUtils.getBase64ImgString(PayUtils.QRCODE_URL + jsonData.get("qrcode"));
			jsonData.put("qrcode", base64Img);
			jsonMsg.put("data", jsonData);
		
			System.out.println(jsonMsg);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 测试json
		// String jsons = "{" + "'msg':'付款即时到账 未到账可联系我们'," + "'data':{"
		// + "'qrcode':'HTTPS://QR.ALIPAY.COM/FKX08406GFWYYSF0YRNC10'," +
		// "'istype':'1'," + "'realprice':0.05"
		// + "}," + "'code':1," + "'url':'https://www.paysapi.com/'" + "}";
		// JSONObject json = JSONObject.fromObject(jsons);
		// System.out.println(json);
		// System.out.println(json.toString());
		// QRCodeMsg msg = new QRCodeMsg();
		// try {
		// SnailBeanUtils.copyProperties(msg, json);
		// msg.setDataMsg(msg.getDataMsg(msg.getData()));
		// } catch (InvocationTargetException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// } catch (IllegalAccessException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// 抓取图片
		// try {
		// String imgUrl =
		// "http://img2.woyaogexing.com/2018/01/03/671b684da4231b7b!400x400_big.jpg";
		// String rst = ImgUtils.getBase64ImgString(imgUrl);
		// System.out.println(rst);
		// } catch (Exception e) {
		// System.out.println(e.getMessage());
		// e.printStackTrace();
		// }

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
