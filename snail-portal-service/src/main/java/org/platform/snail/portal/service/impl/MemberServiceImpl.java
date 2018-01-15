package org.platform.snail.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.platform.snail.beans.DataResponse;
import org.platform.snail.beans.SystemUser;
import org.platform.snail.portal.dao.MemberDao;
import org.platform.snail.portal.model.Member;
import org.platform.snail.portal.service.MemberService;
import org.platform.snail.portal.vo.MemberVo;
import org.platform.snail.service.DataBaseLogService;
import org.platform.snail.utils.CommonKeys;
import org.platform.snail.utils.SnailBeanUtils;
import org.platform.snail.utils.SnailUtils;
import org.platform.snail.weixin.model.OAuthInfo;
import org.platform.snail.weixin.model.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private DataBaseLogService dataBaseLogService;

	@Override
	public DataResponse findUsersSearchList(Member condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<Map<String, String>> list = this.memberDao.findUsersSearchList(condition, start, limit, orderBy);
		rst.setList(list);
		int allRows = this.memberDao.findUsersSearchCount(condition);
		rst.setAllRows(allRows);
		return rst;
	}

	@Override
	public DataResponse findUsersList(Member condition, int start, int limit, String orderBy) throws Exception {
		DataResponse rst = new DataResponse();
		List<MemberVo> list = this.memberDao.findUsersList(condition, start, start + limit, orderBy);
		rst.setList(list);
		if (start <= 1) {
			int allRows = this.memberDao.findUsersCount(condition);
			rst.setAllRows(allRows);
		}
		return rst;
	}

	@Override
	public DataResponse insertUsers(JSONObject josnObject, SystemUser systemUser) throws Exception {
		Member member = new Member();
		SnailBeanUtils.copyProperties(member, josnObject);
		// if (SnailUtils.isBlankString(member.getAccount())) {
		// return new DataResponse(false, "账户不能为空!");
		// }
		// if (this.memberDao.isExitUsersAccount(member.getAccount()) > 0) {
		// return new DataResponse(false, "账户已存在!");
		// }
		// if (SnailUtils.isBlankString(member.getWeChatId())) {
		// return new DataResponse(false, "微信号不能为空!");
		// }
		// if (this.memberDao.isExitUsersWeChatId(member.getWeChatId()) > 0) {
		// return new DataResponse(false, "微信号已存在!");
		// }
		if (SnailUtils.isBlankString(member.getMobile())) {
			return new DataResponse(false, "手机号不能为空!");
		}
		if (this.memberDao.isExitUsersAccount(member.getMobile()) > 0) {
			return new DataResponse(false, "手机号已存在!");
		}
		if (SnailUtils.isBlankString(member.getPassword())) {
			member.setPassword(SnailUtils.getMd5(member.getPassword()));
		}
		int insert = this.memberDao.insertUsers(member);
		if (insert > 0) {
			this.dataBaseLogService.log(CommonKeys.logCreate, "添加", "", member.toString(), "游戏管理-会员管理", systemUser,
					"26");
		}
		return new DataResponse(true, "添加新会员成功！");
	}

	@Override
	public DataResponse updateUsers(JSONObject josnObject, SystemUser systemUser) throws Exception {
		Member member = new Member();
		SnailBeanUtils.copyProperties(member, josnObject);
		// if (SnailUtils.isBlankString(member.getAccount())) {
		// return new DataResponse(false, "账户不能为空!");
		// }
		if (SnailUtils.isBlankString(member.getWeChatId())) {
			return new DataResponse(false, "微信号不能为空!");
		}
		if (SnailUtils.isBlankString(member.getMobile())) {
			return new DataResponse(false, "手机号不能为空!");
		}
		if (!SnailUtils.isBlankString(member.getPassword())) {
			member.setPassword(SnailUtils.getMd5(member.getPassword()));
		}
		MemberVo o = this.memberDao.selectUsersVoByPrimaryKey(member.getUserId());
		int i = this.memberDao.updateUsersByPrimaryKey(member);
		if (i > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", o.toString(), member.toString(), "游戏管理-会员管理",
					systemUser, "26");
		}
		return new DataResponse(true, "会员信息变更成功！");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.platform.snail.portal.service.TUsersService#
	 * updateUsersStatusByPrimaryKey(java.lang.String, java.lang.String,
	 * org.platform.snail.beans.SystemUser) 删除操作 作为更新用户状态0--禁用 1--启用
	 */
	@Override
	public DataResponse updateUsersStatusByPrimaryKey(String userId, String status, SystemUser systemUser)
			throws Exception {
		DataResponse rst = new DataResponse();
		if (SnailUtils.isBlankString(userId)) {
			return new DataResponse(false, "会员编号不能为空！");
		}
		if (SnailUtils.isBlankString(status)) {
			return new DataResponse(false, "会员状态不能为空！");
		}
		MemberVo o = this.memberDao.selectUsersVoByPrimaryKey(userId);
		int i = this.memberDao.updateUsersStatusByPrimaryKey(userId, status);
		if (i > 0) {
			this.dataBaseLogService.log(CommonKeys.logUpdate, "更新", "status[" + o.getStatus() + "]",
					"status:[" + status + "]", "游戏管理-会员管理", systemUser, "26");
		}
		return new DataResponse(true, "会员禁用成功！");
	}

	@Override
	public DataResponse selectUsersByPrimaryKey(String userId) throws Exception {
		DataResponse rst = new DataResponse();
		Member member = this.memberDao.selectUsersVoByPrimaryKey(userId);
		rst.setResponse(member);
		return rst;
	}

	@Override
	public DataResponse findMemberAccountInfo(String agentId) throws Exception {
		DataResponse rst = new DataResponse();
		MemberVo member = this.memberDao.findMemberAccountInfo(agentId);
		Map<String, String> map = new HashMap();
		if (member != null) {
			map.put("coins", member.getCoins());
			map.put("gems", member.getGems());
			map.put("pkCard", member.getPkCard());
			rst.setResponse(map);
			rst.setState(true);
		} else {
			rst.setState(false);
			rst.setErrorMessage("该用户不是代理！");
		}
		return rst;
	}

	/*
	 * (non-Javadoc) 通过微信注册添加用户
	 * 
	 * @see
	 * org.platform.snail.portal.service.MemberService#insertUsers(net.sf.json.
	 * JSONObject, org.platform.snail.beans.SystemUser)
	 */
	@Override
	public DataResponse userLoginOrRegister(UserInfo userInfo) throws Exception {
		DataResponse rst = new DataResponse();
		int isExit = this.memberDao.isExitUsersUnionId(userInfo.getUnionid());
		MemberVo memberVo = new MemberVo();
		if (isExit > 0) {
			memberVo = this.memberDao.selectMemberByUnionId(userInfo.getUnionid());
			// 更新用户登录时间
			int update = this.memberDao.updateMemberLastLoginTimeByUserId(memberVo.getUserId());
			rst.setState(true);
			rst.setErrorMessage("用户登录成功！");
			rst.setResponse(memberVo);
		} else {
			Member member = new Member();
			// 暂时将unionid存入account
			//初始化账户信息
			member.setLevel("0");
			member.setExperience("0");
			member.setCoins("0");
			member.setGems("0");
			member.setPkCard("0");
			member.setIsAgent("0");
			member.setAccount(userInfo.getUnionid());
			member.setWeChatId(userInfo.getOpenid());
			member.setName(userInfo.getNickname());			
			member.setSex(userInfo.getSex());
			member.setCity(userInfo.getCity());
			member.setLanguage(userInfo.getLanguage());
			member.setProvince(userInfo.getProvince());
			member.setCountry(userInfo.getCountry());
			member.setHeadImg(userInfo.getHeadimgurl());
			member.setPrivilege(userInfo.getPrivilege());
			member.setUnionId(userInfo.getUnionid());
			
			int insert = this.memberDao.insertUsers(member);
			if (insert > 0) {				
				rst.setResponse(member);
				rst.setErrorMessage("注册成功！");
				rst.setState(true);
				this.dataBaseLogService.log(
						"unionId为[" + member.getUnionId() + "]的用户[" + member.getName() + "]\r\n注册了游戏！", "注册", "",
						member.toString(), "游戏管理-会员管理", null);
			} else {
				rst.setErrorMessage("未注册成功！");
				rst.setState(false);
			}
		}
		return rst;
	}

}
