package org.platform.snail.portal.openapi.action;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.platfom.snail.pay.model.PaySaPi;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.portal.service.OpenAPIService;
import org.platform.snail.utils.PayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author pzp 对外开放的公用业务接口
 */
@Controller
@RequestMapping(value = "/openAPI")
public class OpenAPIAction implements Serializable {

	@Autowired
	private OpenAPIService openAPIService;

	// 创建订单，返回订单信息，编号等
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
			resultMap.put("data", PayUtils.payOrder(remoteMap));
			if (this.openAPIService.createOrder(remoteMap)) {
				dr.setResponse(resultMap);
				dr.setState(true);
				return dr;
			} else {			
				return new DataResponse(false,"创建订单失败！");
			}
		} catch (Exception e) {

			return new DataResponse(false,"出错了！：" + e.getMessage());
		}
	}

	@RequestMapping("/notifyPay.do")
	public void notifyPay(HttpServletRequest request, HttpServletResponse response, PaySaPi paySaPi) {
		// 保证密钥一致性
		if (PayUtils.checkPayKey(paySaPi)) {

			System.out.println("更新数据库！");
		} else {
			System.out.println("密钥错误！");
		}
	}

	@RequestMapping("/returnPay.do")
	public DataResponse returnPay(HttpServletRequest request, HttpServletResponse response, String orderid) {
		boolean isTrue = false;
		DataResponse dr = null;
		// 根据订单号查找相应的记录:根据结果跳转到不同的页面
		if (isTrue) {
			dr = new DataResponse(true, "正确的跳转地址");
		} else {
			dr = new DataResponse(false, "没有支付成功的地址");
		}
		return dr;
	}
}
