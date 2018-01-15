package org.platform.snail.portal.weixin.action;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.utils.HttpClientUtils;
import org.platform.snail.web.action.BaseController;
import org.platform.snail.weixin.model.WeChatRequest;
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
		Map<String, String> condition = new HashMap<String, String>();
		Enumeration e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			String value = request.getParameter(key);
			System.out.println("获取参数key:[" + key + "]" + ",value:[" + value + "]");
			condition.put(key, value);
		}
		if (condition.containsKey("code")) {
			// 初始化请求参数
			// String url =
			// "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
			WeChatRequest wcr = new WeChatRequest();
			wcr.setLoginDomain("https://api.weixin.qq.com/sns/oauth2/access_token");
			wcr.setAppId("wxe96bbd4187ab4e71");
			wcr.setAppSecret("562a2bf5af2dcadc1c21a8f58ef0f347");
			wcr.setCode(condition.get("code"));
			wcr.setGrantType("authorization_code");
			String oAuthUrl = wcr.getOAuthInfo();
			String result = HttpClientUtils.doGet(oAuthUrl);
			System.out.println(result);
			return new DataResponse(true, result);
		} else {
			dr.setState(false);
			dr.setErrorMessage("code不存在!");
			return dr;
		}
	}

}
