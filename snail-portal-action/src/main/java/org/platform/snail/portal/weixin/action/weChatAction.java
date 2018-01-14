package org.platform.snail.portal.weixin.action;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.web.action.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/weChat")
public class weChatAction extends BaseController {

	@RequestMapping(value = "/weChatLogin.do")
	@ResponseBody
	public DataResponse weChatLogin(HttpServletRequest request) {
		DataResponse dr = new DataResponse();
		Map<String, Object> condition = new HashMap<String, Object>();
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			String value = request.getParameter(key);
			System.out.println("获取参数key:[" + key + "]" + ",value:[" + value + "]");
			condition.put(key, value);
		}

		dr.setErrorMessage("你进来了");
		dr.setState(true);
		return dr;
	}

}
