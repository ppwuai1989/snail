package org.platform.snail.portal.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.model.Agent;
import org.platform.snail.model.Resources;
import org.platform.snail.model.Users;
import org.platform.snail.service.LoginService;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.web.action.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.opensymphony.xwork2.ActionContext;

@Controller
@RequestMapping(value = "/login")
public class LoginAction extends BaseController {

	private static final long serialVersionUID = 1L;
	@Autowired
	private LoginService loginService;

	/**
	 * 用SystemUser模型 在Dao层用account取出账户信息 在Service层添加方法验证 在Action中直接
	 * 返回错误信息或根据账户查出权限资源等信息存入session跳转到主页面
	 */
	@RequestMapping(value = "/checkLogin.do")
	@ResponseBody
	public DataResponse checkLogin(String account, String password) throws Exception {
		DataResponse rst = new DataResponse();
		if (SnailUtils.isBlankString(account)) {
			rst.setState(false);
			rst.setErrorMessage("账户不能为空！");
			return rst;
		}
		if (SnailUtils.isBlankString(password)) {
			rst.setState(false);
			rst.setErrorMessage("密码不能为空！");
			return rst;
		}
		Users users = this.loginService.getUsersByAccount(account);
		if (users != null) {
			if (users.getStatus() != null && users.getStatus().equals("0")) {
				rst.setState(false);
				rst.setErrorMessage("账户已被禁用！请联系管理员！");
				return rst;
			}
			password = SnailUtils.getMd5(password);
			if (users.getPassword().equals(password)) {
				// 密码正确登录成功 查出权限
				SystemUser systemUser = new SystemUser();
				Map<String, Resources> map = new HashMap<String, Resources>();
				List<Resources> resources = this.loginService.getResourcesByUserId(users.getUserId());
				systemUser.setUsers(users);
				//找到代理信息存入systemUser
				Agent agent = this.loginService.selectAgentById(users.getUserId());
				systemUser.setAgent(agent);
				systemUser.setResources(resources);
				for (Resources o : resources) {
					map.put(o.getResourcesId(), o);
				}
				systemUser.setMap(map);
				this.loginService.updateLastLoginTimeByUserId(systemUser);
				this.setSessionSystemUser(systemUser);
				rst.setState(true);
				rst.setErrorMessage("登录成功！");
			} else {
				rst.setState(false);
				rst.setErrorMessage("密码错误！");
			}
		} else {
			rst.setState(false);
			rst.setErrorMessage("账户不存在！");
		}
		return rst;
	}
}
