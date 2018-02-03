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
import org.platform.snail.utils.ImgUtils;
import org.platform.snail.utils.PayUtils;
import org.platform.snail.utils.SnailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			resultMap.put("data", PayUtils.payOrder(remoteMap));
			if (this.openAPIService.createOrder(remoteMap)) {
				
				dr.setResponse(resultMap);
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

}
