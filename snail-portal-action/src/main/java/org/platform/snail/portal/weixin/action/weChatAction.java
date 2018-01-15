package org.platform.snail.portal.weixin.action;

import java.lang.reflect.InvocationTargetException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.NameValuePair;
import org.platform.snail.beans.DataResponse;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.service.MemberService;
import org.platform.snail.utils.HttpClientUtils;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.web.action.BaseController;
import org.platform.snail.weixin.model.OAuthInfo;
import org.platform.snail.weixin.model.UserInfo;
import org.platform.snail.weixin.model.WeChatRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/weChat")
public class weChatAction {

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
			System.out.println("获取参数key:[" + key + "]" + ",value:[" + value + "]");
			condition.put(key, value);
		}
		if (condition.containsKey("code")) {
			// 初始化请求参数
			// String url =
			// "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
			WeChatRequest wcr = new WeChatRequest();
			wcr.setAccessTokenUrl("https://api.weixin.qq.com/sns/oauth2/access_token");
			wcr.setAppId("wxe96bbd4187ab4e71");
			wcr.setAppSecret("562a2bf5af2dcadc1c21a8f58ef0f347");
			wcr.setCode(condition.get("code"));
			wcr.setGrantType("authorization_code");
			String oAuthUrl = wcr.getOAuthInfo();
			String rstOAuth = HttpClientUtils.doGet(oAuthUrl);
			// System.out.println(result);
			try {
				OAuthInfo oAuthInfo = new OAuthInfo();
				SnailBeanUtils.copyProperties(oAuthInfo, rstOAuth);
				if (oAuthInfo.getErrcode() == null) {
					wcr.setUserInfoUrl("https://api.weixin.qq.com/sns/userinfo");
					String userUrl = wcr.getUserInfoUrl();
					List<NameValuePair> params = wcr.getParamsForUser(oAuthInfo);
					String rstUser = HttpClientUtils.doPost(userUrl, params);
					UserInfo userInfo = new UserInfo();
					SnailBeanUtils.copyProperties(userInfo, rstUser);
					if (userInfo.getErrcode() == null) {
						// 说明获取用户信息成功，可以保存入库，并返回用户信息给客户端最后登录成功跳转
						// "openid": "oLVPpjqs9BhvzwPj5A-vTYAX3GLc",
						// "nickname": "刺猬宝宝",
						// "sex": 1,
						// "language": "简体中文",
						// "city": "深圳",
						// "province": "广东",
						// "country": "中国",
						// "headimgurl":
						// "http://wx.qlogo.cn/mmopen/utpKYf69VAbCRDRlbUsPsdQN38DoibCkrU6SAMCSNx558eTaLVM8PyM6jlEGzOrH67hyZibIZPXu4BK1XNWzSXB3Cs4qpBBg18/0",
						// "privilege": []					
						dr = this.memberService.userLoginOrRegister(userInfo, oAuthInfo);
					} else {
						dr.setState(false);
						dr.setErrorMessage("出错啦！errMsg:" + userInfo.getErrmsg());
					}
					dr.setState(true);
					dr.setErrorMessage("获取成功UserInfo" + userInfo);
				} else {
					dr.setState(false);
					dr.setErrorMessage("出错啦！errMsg:" + oAuthInfo.getErrmsg());
				}
			} catch (Exception e1) {
				dr.setState(false);
				dr.setErrorMessage("oAuthInfo转换失败" + e1.getMessage());
				return dr;
			}
		} else

		{
			dr.setState(false);
			dr.setErrorMessage("code不存在!");
		}
		return dr;
	}
}
