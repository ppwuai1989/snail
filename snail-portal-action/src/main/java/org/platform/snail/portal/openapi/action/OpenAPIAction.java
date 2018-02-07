package org.platform.snail.portal.openapi.action;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.platfom.snail.pay.model.PaySaPi;
import org.platfom.snail.pay.model.QRCodeMsg;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.portal.service.OpenAPIService;
import org.platform.snail.utils.HttpClientUtils;
import org.platform.snail.utils.ImgUtils;
import org.platform.snail.utils.PayUtils;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import net.sf.json.JSONObject;

/**
 * @author pzp 对外开放的公用业务接口
 */
@Controller
@RequestMapping(value = "/openAPI")
public class OpenAPIAction implements Serializable {

	@Autowired
	private OpenAPIService openAPIService;

	/**
	 * 创建订单，返回订单信息，编号等
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/pay.do")
	@ResponseBody
	public DataResponse pay(HttpServletRequest request) {

		try {
			DataResponse dr = new DataResponse();
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, Object> remoteMap = new HashMap<String, Object>();
			Enumeration<String> e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String key = e.nextElement();
				String value = request.getParameter(key);
				remoteMap.put(key, value);
			}
			remoteMap.put("orderid", PayUtils.getOrderIdByUUId());
			resultMap = PayUtils.payOrder(remoteMap);
			if (this.openAPIService.createOrder(remoteMap)) {
				ObjectMapper mapper = new ObjectMapper();
				resultMap.remove("amount");
				resultMap.remove("orderuname");// 请求时去除姓名
				String jsonReq = mapper.writeValueAsString(resultMap);
				System.out.println(jsonReq);
				String jsonRes = HttpClientUtils.doPost(PayUtils.BASE_URL, jsonReq);
				Map<String, Object> jsonMsg = JSONObject.fromObject(jsonRes);
				Map<String, Object> jsonData = JSONObject.fromObject(jsonMsg.get("data"));
				String base64Img = ImgUtils.getBase64ImgString(PayUtils.QRCODE_URL + jsonData.get("qrcode"));
				jsonData.put("qrcode", base64Img);
				jsonMsg.put("data", jsonData);
				jsonMsg.put("orderid", remoteMap.get("orderid"));
				// QRCodeMsg msg = new QRCodeMsg();
				// SnailBeanUtils.copyProperties(msg, jsonObj);
				// msg.setDataMsg(msg.getDataMsg(msg.getData()));
				// System.out.println(msg.toString());
				// dr.setResponse(msg);
				System.out.println(jsonMsg);
				dr.setResponse(jsonMsg);
				dr.setState(true);
				return dr;
			} else {
				return new DataResponse(false, "创建订单失败！");
			}
		} catch (Exception e) {
			return new DataResponse(false, "出错了！：" + e.getMessage());
		}
	}

	/**
	 * 验证订单支付回调, 更新订单信息
	 * 
	 * @param request
	 * @param response
	 * @param paySaPi
	 */
	@RequestMapping(value = "/notifyPay.do", method = RequestMethod.POST)
	public void notifyPay(HttpServletRequest request, HttpServletResponse response, PaySaPi paySaPi) {
		// 保证密钥一致性
		try {
			if (PayUtils.checkPayKey(paySaPi)) {
				System.out.println("/notifyPay.do更新数据库start！");
				// 首先根据订单号查出充值信息，先给用户充值。
				this.openAPIService.completeOrder(paySaPi);
				System.out.println("/notifyPay.do更新数据库end！");
			} else {
				System.out.println("密钥错误！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 获取订单状态
	 * 
	 * @param request
	 * @param response
	 * @param orderid
	 * @return
	 */
	@RequestMapping("/getOrderStatus.do")
	@ResponseBody
	public DataResponse getOrderStatus(HttpServletRequest request, HttpServletResponse response, String orderid) {
		DataResponse dr = new DataResponse();
		try {
			Map<String, String> map = this.openAPIService.getOrderStatus(orderid);
			dr.setResponse(map);
			dr.setState(true);
		} catch (Exception e) {
			return new DataResponse(false, "获取信息异常--" + e.getMessage());
		}
		return dr;
	}

	/**
	 * 解析跨域图片 返回 "data:image/png;base64,XXXXX"图片
	 * 
	 * @param url
	 * @return
	 */
	@RequestMapping("/getBase64Img.do")
	@ResponseBody
	public String getBase64Img(String url) {
		String rst = "";
		if (SnailUtils.isBlankString(url)) {
			return rst;
		}
		rst = ImgUtils.getBase64ImgString(url);
		return rst;
	}

	/**
	 * 申请成为代理(此接口不完善，后期需要改善为 添加一条 代理申请记录，由后台审核通过)
	 * 
	 * @return
	 */
	@RequestMapping("/applyToBeAgent.do")
	@ResponseBody
	public DataResponse applyToBeAgent(HttpServletRequest request) {
		// 解析request中参数
		try {
			Map<String, String> reqMap = new HashMap<String, String>();
			Enumeration<String> e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String key = e.nextElement();
				String value = request.getParameter(key);
				reqMap.put(key, value);
			}
			return this.openAPIService.applyToBEAgent(reqMap);
		} catch (Exception e) {
			return new DataResponse(false, "申请代理异常！");
		}
	}

	/**
	 * 获取商城信息 返回参数列表格式 rst{ coins{ list1{id,amount,price,...}, list2, list3 }}
	 * 
	 * 
	 * @return
	 */
	@RequestMapping("/getMallInfo.do")
	@ResponseBody
	public DataResponse getMallInfo(HttpServletRequest request) {
		// 解析request中参数
		try {
			Map<String, String> reqMap = new HashMap<String, String>();
			Enumeration<String> e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String key = e.nextElement();
				String value = request.getParameter(key);
				reqMap.put(key, value);
			}
			if (reqMap.containsKey("userId")) {
				String userId = reqMap.get("userId");
				int way = 1;
				// if (SnailUtils.isNotBlankString(reqMap.get("way"))) {
				// way = Integer.valueOf(reqMap.get("way"));
				// }
				return this.openAPIService.getMallInfo(userId, way);
			} else {
				return new DataResponse(false, "请检查参数格式！");
			}
		} catch (Exception e) {
			return new DataResponse(false, "获取商城信息异常！");
		}
	}

}
