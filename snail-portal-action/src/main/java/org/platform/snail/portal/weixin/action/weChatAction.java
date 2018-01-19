package org.platform.snail.portal.weixin.action;

import java.io.Serializable;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.http.NameValuePair;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.portal.service.MemberService;
import org.platform.snail.utils.Config;
import org.platform.snail.utils.HttpClientUtils;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.weixin.model.OAuthInfo;
import org.platform.snail.weixin.model.UserInfo;
import org.platform.snail.weixin.model.WeChatRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/weChat")
public class weChatAction implements Serializable {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/weChatLogin.do")
	@ResponseBody
	public DataResponse weChatLogin(HttpServletRequest request) {
		DataResponse dr = new DataResponse();
		Map<String, String> condition = new HashMap<String, String>();
		Enumeration<String> e = request.getParameterNames();
		while (e.hasMoreElements()) {
			String key = e.nextElement();
			String value = request.getParameter(key);
			// System.out.println("获取参数key:[" + key + "]" + ",value:[" + value +
			// "]");
			condition.put(key, value);
		}
		if (condition.containsKey("code")) {
			// 初始化请求参数
			// String url =
			// "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
			WeChatRequest wcr = new WeChatRequest();
			wcr.setAccessTokenUrl("https://api.weixin.qq.com/sns/oauth2/access_token");
			wcr.setAppId(Config.getProperty("wx.appId"));
			wcr.setAppSecret(Config.getProperty("wx.appSecret"));
			wcr.setCode(condition.get("code"));
			wcr.setGrantType("authorization_code");
			String oAuthUrl = wcr.getOAuthInfo();
			JSONObject oAuthJson = HttpClientUtils.doGet(oAuthUrl);
			// System.out.println(result);
			try {
				OAuthInfo oAuthInfo = new OAuthInfo();
				SnailBeanUtils.copyProperties(oAuthInfo, oAuthJson);
				if (oAuthInfo.getErrcode() == null) {
					wcr.setUserInfoUrl("https://api.weixin.qq.com/sns/userinfo");
					String userUrl = wcr.getUserInfoUrl();
					List<NameValuePair> params = wcr.getParamsForUser(oAuthInfo);
					JSONObject userJson = HttpClientUtils.doPost(userUrl, params);
					UserInfo userInfo = new UserInfo();
					SnailBeanUtils.copyProperties(userInfo, userJson);
					if (userInfo.getErrcode() == null) {
						// 没有错误码说明获取用户信息成功，可以登录或者注册
						try {
							dr = this.memberService.userLoginOrRegister(userInfo);
						} catch (Exception e1) {
							e1.printStackTrace();
							return new DataResponse(false, "注册失败！" + e1.getMessage());
						}
					} else {
						dr.setState(false);
						dr.setErrorMessage("出错啦！errCode:" + userInfo.getErrcode() + " errMsg:" + userInfo.getErrmsg());
					}
				} else {
					dr.setState(false);
					dr.setErrorMessage("出错啦！errCode:" + oAuthInfo.getErrcode() + "errMsg:" + oAuthInfo.getErrmsg());
				}
			} catch (Exception e1) {
				dr.setState(false);
				dr.setErrorMessage("错误--" + e1.getMessage());
				return dr;
			}
		} else {
			dr.setState(false);
			dr.setErrorMessage("code不存在!");
		}
		return dr;
	}
}
